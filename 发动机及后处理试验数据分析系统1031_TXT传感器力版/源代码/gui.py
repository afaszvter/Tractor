import json
import os
import re
import shutil
import subprocess
import sys
import traceback
import hashlib
from pathlib import Path

from PyQt5.QtCore import Qt, QThread, pyqtSignal, QTimer
from PyQt5.QtGui import QIcon, QPixmap
from PyQt5.QtWidgets import (
    QApplication, QDialog, QDialogButtonBox, QFileDialog, QFormLayout,
    QComboBox, QFrame, QHBoxLayout, QLabel, QLineEdit,
    QListWidget, QListWidgetItem, QMainWindow, QMessageBox, QPushButton,
    QPlainTextEdit, QScrollArea, QSizePolicy, QSplitter, QStatusBar, QTextEdit, QVBoxLayout, QWidget,
)
from figure_editor import FigureEditor
from can_decode import decode_asc
from responsive_ui import ResponsiveUiMixin


APP_TITLE = "发动机及后处理试验数据分析系统"
DEFAULT_REMARK = ""
MODES = {
    "time": ("时域分析", "01_time_domain.png"),
    "spectrum": ("频谱分析", "02_speed_spectrum.png"),
    "points": ("工作点分析", "03_operating_points.png"),
    "distribution": ("分布分析", "04_force_distribution.png"),
    "temperature": ("温度分析", "05_temperature.png"),
    "pressure": ("压力与液位", "06_pressure_levels.png"),
    "electrical": ("电压分析", "07_electrical.png"),
    "sensor": ("传感器 ADC", "08_sensor_adc.png"),
    "force": ("传感器力分析", "11_sensor_force.png"),
    "force_distribution": ("拉力分布", "12_sensor_force_distribution.png"),
    "controls": ("油门与可用扭矩", "09_controls.png"),
    "counters": ("累计计量", "10_counters.png"),
    "decode": ("解析并导出 CSV", ""),
    "all": ("生成全部图像", "01_time_domain.png"),
}


def resource_path(name):
    return Path(getattr(sys, "_MEIPASS", Path(__file__).resolve().parent)) / name


def config_dir():
    override = os.environ.get("SYSLAB_CONFIG_DIR")
    if override:
        return Path(override)
    return Path(os.environ.get("APPDATA", str(Path.home()))) / "SyslabASCTrialAnalyzer"


def load_preferences():
    preferences = {"title": APP_TITLE, "remark": DEFAULT_REMARK, "logo": ""}
    try:
        values = json.loads((config_dir() / "settings.json").read_text(encoding="utf-8"))
        if isinstance(values, dict):
            for key in preferences:
                if isinstance(values.get(key), str):
                    preferences[key] = values[key]
    except (OSError, ValueError):
        pass
    preferences["title"] = preferences["title"].strip() or APP_TITLE
    return preferences


def save_preferences(title, remark, logo):
    folder = config_dir()
    folder.mkdir(parents=True, exist_ok=True)
    saved_logo = ""
    if logo:
        source = Path(logo)
        if not source.is_file() or QPixmap(str(source)).isNull():
            raise ValueError("Logo 图片无法读取，请选择 PNG、JPG、BMP 或 ICO 图片。")
        destination = folder / ("logo" + source.suffix.lower())
        if source.resolve() != destination.resolve():
            shutil.copy2(source, destination)
        saved_logo = str(destination)
    values = {"title": title.strip() or APP_TITLE, "remark": remark.strip(), "logo": saved_logo}
    target = folder / "settings.json"
    temporary = folder / "settings.json.tmp"
    temporary.write_text(json.dumps(values, ensure_ascii=False, indent=2), encoding="utf-8")
    temporary.replace(target)
    return values


class PreviewLabel(QLabel):
    resized = pyqtSignal()

    def resizeEvent(self, event):
        super().resizeEvent(event)
        self.resized.emit()


class SettingsDialog(ResponsiveUiMixin, QDialog):
    def __init__(self, parent, preferences):
        super().__init__(parent)
        self.setWindowTitle("界面设置")
        self.setMinimumWidth(520)
        self.resize(620, 500)
        layout = QVBoxLayout(self)
        form = QFormLayout()
        self.title_edit = QLineEdit(preferences["title"])
        self.title_edit.setMaxLength(60)
        form.addRow("程序标题", self.title_edit)
        logo_row = QHBoxLayout()
        self.logo_edit = QLineEdit(preferences["logo"])
        self.logo_edit.setReadOnly(True)
        logo_row.addWidget(self.logo_edit, 1)
        browse = QPushButton("选择图片…")
        browse.clicked.connect(self.browse_logo)
        logo_row.addWidget(browse)
        clear = QPushButton("清除")
        clear.clicked.connect(lambda: self.logo_edit.clear())
        logo_row.addWidget(clear)
        form.addRow("程序 Logo", logo_row)
        self.remark_edit = QPlainTextEdit(preferences["remark"])
        self.remark_edit.setPlaceholderText("例如：项目名称、课题组或数据说明")
        self.remark_edit.setMaximumHeight(110)
        form.addRow("备注", self.remark_edit)
        layout.addLayout(form)
        hint = QLabel("设置保存在当前 Windows 用户目录。Logo 会复制到设置目录，原图片移动后仍可使用。")
        hint.setWordWrap(True)
        hint.setObjectName("settingsHint")
        layout.addWidget(hint)
        buttons = QDialogButtonBox(QDialogButtonBox.Save | QDialogButtonBox.Cancel)
        buttons.button(QDialogButtonBox.Save).setText("保存")
        buttons.button(QDialogButtonBox.Cancel).setText("取消")
        buttons.accepted.connect(self.accept)
        buttons.rejected.connect(self.reject)
        layout.addWidget(buttons)
        self.init_responsive_ui((620, 500), "QWidget { font-size: 14px; }",
                                lambda scale: self.remark_edit.setMaximumHeight(round(110 * scale)))

    def browse_logo(self):
        image, _ = QFileDialog.getOpenFileName(
            self, "选择程序 Logo", self.logo_edit.text() or str(Path.home()),
            "图片 (*.png *.jpg *.jpeg *.bmp *.ico)")
        if image:
            self.logo_edit.setText(image)


def syslab_runtime():
    depot = Path(os.environ.get("SYSLAB_DEPOT", r"C:\Users\Public\TongYuan\.julia"))
    configured_julia = os.environ.get("SYSLAB_JULIA")
    if configured_julia:
        julia_root = Path(configured_julia)
        julia = julia_root if julia_root.name.lower() == "julia.exe" else julia_root / "bin" / "julia.exe"
    else:
        runtime_root = Path(r"C:\Users\Public\TongYuan")
        preferred = runtime_root / "julia-1.10.10" / "bin" / "julia.exe"
        candidates = [path / "bin" / "julia.exe" for path in runtime_root.glob("julia-*")]

        def version_key(path):
            return tuple(int(part) for part in re.findall(r"\d+", path.parent.parent.name))

        julia = preferred if preferred.is_file() else max(
            (path for path in candidates if path.is_file()), key=version_key, default=Path())
    python = depot / "miniforge3" / "python.exe"
    if not julia.is_file() or not python.is_file():
        raise FileNotFoundError("找不到 Syslab 2026b 的 Julia/Python 环境。请确认已安装 MWORKS.Syslab 2026b，或设置 SYSLAB_JULIA 与 SYSLAB_DEPOT。")
    return julia, python, depot


class AnalysisWorker(QThread):
    completed = pyqtSignal(bool, str, str)

    def __init__(self, mode, csv_path, output_dir, dbc_paths=None, channel="", source=""):
        super().__init__()
        self.mode = mode
        self.csv_path = Path(csv_path)
        self.output_dir = Path(output_dir)
        self.dbc_paths = dbc_paths or [resource_path("j1939.dbc"), resource_path("adc_in1_force_10kN.dbc")]
        self.channel = channel
        self.source = source

    def run(self):
        try:
            self.output_dir.mkdir(parents=True, exist_ok=True)
            input_path = self.csv_path
            decode_log = ""
            if input_path.suffix.lower() in (".asc", ".txt"):
                input_path, decode_log = decode_asc(input_path, self.dbc_paths, self.output_dir)
            if self.mode == "decode":
                self.completed.emit(True, str(input_path), decode_log or "已选择物理量 CSV，可直接分析。")
                return
            context = {"csv_sha256": hashlib.sha256(input_path.read_bytes()).hexdigest(),
                       "channel": self.channel, "source": self.source, "layout_version": 9}
            context_path = self.output_dir / "analysis_context.json"
            try:
                previous = json.loads(context_path.read_text(encoding="utf-8"))
            except (OSError, ValueError):
                previous = None
            if previous != context:
                for _, filename in MODES.values():
                    if filename:
                        (self.output_dir / filename).unlink(missing_ok=True)
                        (self.output_dir / filename).with_suffix(".panels.toml").unlink(missing_ok=True)
            context_path.write_text(json.dumps(context), encoding="utf-8")
            julia, python, depot = syslab_runtime()
            env = os.environ.copy()
            env.update({
                "JULIA_DEPOT_PATH": str(depot),
                "PYTHON": str(python),
                "TYPLOT_BACKEND": "Agg",
                "PYTHONHOME": "",
                "TRIAL_CHANNEL": self.channel,
                "TRIAL_SOURCE": self.source,
            })
            command = [
                str(julia), str(resource_path("trial_worker.jl")),
                self.mode, str(input_path), str(self.output_dir),
            ]
            flags = getattr(subprocess, "CREATE_NO_WINDOW", 0)
            result = subprocess.run(command, capture_output=True, text=True,
                                    encoding="utf-8", errors="replace", env=env,
                                    creationflags=flags)
            log = (decode_log + "\n" + result.stdout + "\n" + result.stderr).strip()
            expected = self.output_dir / MODES[self.mode][1]
            okay = result.returncode == 0
            if self.mode == "all" and not expected.is_file():
                expected = next((self.output_dir / name for _, name in MODES.values()
                                 if name and (self.output_dir / name).is_file()), expected)
            self.completed.emit(okay, str(expected) if okay and expected.is_file() else "", log)
        except Exception:
            self.completed.emit(False, "", traceback.format_exc())


class MainWindow(ResponsiveUiMixin, QMainWindow):
    def __init__(self, smoke=False, smoke_output=None):
        super().__init__()
        self.worker = None
        self.current_image = None
        self.current_csv = None
        self.current_output_dir = None
        self.smoke = smoke
        self.smoke_output = Path(smoke_output) if smoke_output else None
        self.preferences = load_preferences()
        self.resize(1320, 900)
        self.build_ui()
        self.apply_style()
        self.apply_preferences()
        if smoke:
            QTimer.singleShot(100, self.start_smoke)

    def build_ui(self):
        root = QWidget()
        self.setCentralWidget(root)
        whole = QVBoxLayout(root)
        self.root_layout = whole
        whole.setContentsMargins(22, 18, 22, 18)
        whole.setSpacing(16)

        header = QHBoxLayout()
        self.logo_label = QLabel()
        self.logo_label.setObjectName("appLogo")
        self.logo_label.setFixedSize(66, 66)
        self.logo_label.setAlignment(Qt.AlignCenter)
        header.addWidget(self.logo_label)
        title_column = QVBoxLayout()
        title_column.setSpacing(2)
        self.heading = QLabel()
        self.heading.setObjectName("heading")
        self.heading.setWordWrap(True)
        self.subheading = QLabel("CAN 报文导入 · DBC 解析 · Syslab 分析")
        self.subheading.setObjectName("subheading")
        self.remark_label = QLabel()
        self.remark_label.setObjectName("remark")
        self.remark_label.setWordWrap(True)
        title_column.addWidget(self.heading)
        title_column.addWidget(self.subheading)
        title_column.addWidget(self.remark_label)
        header.addLayout(title_column, 1)
        settings_button = QPushButton("设置")
        settings_button.clicked.connect(self.open_settings)
        header.addWidget(settings_button, 0, Qt.AlignTop)
        whole.addLayout(header)

        folder_row = QHBoxLayout()
        folder_row.addWidget(QLabel("数据文件夹"))
        self.folder_edit = QLineEdit()
        self.folder_edit.setPlaceholderText("选择 ASC、CAN表格TXT / ASC格式TXT 或 CSV 数据文件夹")
        self.folder_edit.returnPressed.connect(self.scan_folder)
        folder_row.addWidget(self.folder_edit, 1)
        browse = QPushButton("浏览…")
        browse.clicked.connect(self.browse_folder)
        folder_row.addWidget(browse)
        scan = QPushButton("扫描数据")
        scan.clicked.connect(self.scan_folder)
        folder_row.addWidget(scan)
        whole.addLayout(folder_row)

        output_row = QHBoxLayout()
        output_row.addWidget(QLabel("输出文件夹"))
        self.output_edit = QLineEdit()
        self.output_edit.setPlaceholderText("留空时在数据文件夹下创建“分析结果”")
        output_row.addWidget(self.output_edit, 1)
        output_browse = QPushButton("选择…")
        output_browse.clicked.connect(self.browse_output)
        output_row.addWidget(output_browse)
        whole.addLayout(output_row)

        dbc_row = QHBoxLayout()
        dbc_row.addWidget(QLabel("J1939 DBC"))
        self.engine_dbc = QLineEdit(str(resource_path("j1939.dbc")))
        dbc_row.addWidget(self.engine_dbc, 1)
        engine_browse = QPushButton("选择…")
        engine_browse.clicked.connect(lambda: self.choose_dbc(self.engine_dbc))
        dbc_row.addWidget(engine_browse)
        dbc_row.addWidget(QLabel("传感器 DBC"))
        self.sensor_dbc = QLineEdit(str(resource_path("adc_in1_force_10kN.dbc")))
        dbc_row.addWidget(self.sensor_dbc, 1)
        sensor_browse = QPushButton("选择…")
        sensor_browse.clicked.connect(lambda: self.choose_dbc(self.sensor_dbc))
        dbc_row.addWidget(sensor_browse)
        whole.addLayout(dbc_row)
        filter_row = QHBoxLayout()
        filter_row.addWidget(QLabel("绘图通道"))
        self.channel_select = QComboBox()
        self.channel_select.addItem("自动选择（CSV保留全部）", "")
        for channel in range(1, 9):
            self.channel_select.addItem(f"CAN {channel}", str(channel))
        filter_row.addWidget(self.channel_select)
        filter_row.addWidget(QLabel("绘图源地址"))
        self.source_edit = QLineEdit()
        self.source_edit.setPlaceholderText("留空优先 0x00；或输入 0x03 等十六进制地址")
        filter_row.addWidget(self.source_edit, 1)
        whole.addLayout(filter_row)

        splitter = QSplitter(Qt.Horizontal)
        whole.addWidget(splitter, 1)

        left = QFrame()
        self.left_card = left
        left.setObjectName("card")
        left.setMinimumWidth(285)
        left_layout = QVBoxLayout(left)
        self.left_card_layout = left_layout
        left_layout.setContentsMargins(18, 18, 18, 18)
        left_layout.setSpacing(10)
        left_layout.addWidget(QLabel("数据文件"))
        self.files = QListWidget()
        self.files.currentItemChanged.connect(self.selection_changed)
        left_layout.addWidget(self.files, 1)
        left_layout.addWidget(QLabel("分析操作"))
        self.buttons = {}
        for mode, (caption, _) in MODES.items():
            button = QPushButton(caption)
            if mode == "all":
                button.setObjectName("primary")
            button.clicked.connect(lambda checked=False, m=mode: self.run_mode(m))
            self.buttons[mode] = button
            left_layout.addWidget(button)
        left_scroll = QScrollArea()
        self.left_scroll = left_scroll
        left_scroll.setWidgetResizable(True)
        left_scroll.setWidget(left)
        splitter.addWidget(left_scroll)

        right = QFrame()
        right.setObjectName("card")
        right_layout = QVBoxLayout(right)
        self.right_card_layout = right_layout
        right_layout.setContentsMargins(18, 18, 18, 18)
        right_layout.setSpacing(10)
        preview_row = QHBoxLayout()
        preview_row.addWidget(QLabel("图像预览"))
        self.figure_select = QComboBox()
        self.figure_select.setMinimumWidth(160)
        self.figure_select.currentIndexChanged.connect(self.select_figure)
        preview_row.addWidget(self.figure_select)
        self.edit_figure_button = QPushButton("图窗编辑")
        self.edit_figure_button.setEnabled(False)
        self.edit_figure_button.clicked.connect(self.open_figure_editor)
        preview_row.addWidget(self.edit_figure_button)
        right_layout.addLayout(preview_row)
        self.analysis_splitter = QSplitter(Qt.Vertical)
        self.analysis_splitter.setChildrenCollapsible(False)
        preview_panel = QWidget()
        preview_layout = QVBoxLayout(preview_panel)
        preview_layout.setContentsMargins(0, 0, 0, 0)
        self.preview = PreviewLabel("选择文件并点击分析按钮\n图像将显示在这里")
        self.preview.setObjectName("preview")
        self.preview.setAlignment(Qt.AlignCenter)
        self.preview.setMinimumHeight(180)
        self.preview.setSizePolicy(QSizePolicy.Ignored, QSizePolicy.Ignored)
        self.preview.resized.connect(self.show_preview)
        preview_layout.addWidget(self.preview)
        self.analysis_splitter.addWidget(preview_panel)
        log_panel = QWidget()
        log_layout = QVBoxLayout(log_panel)
        log_layout.setContentsMargins(0, 0, 0, 0)
        log_layout.setSpacing(5)
        log_layout.addWidget(QLabel("运行信息（可拖动分隔线调整高度，滚轮滚动）"))
        self.log = QTextEdit()
        self.log.setReadOnly(True)
        self.log.setLineWrapMode(QTextEdit.NoWrap)
        self.log.setVerticalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.log.setHorizontalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.log.setMinimumHeight(100)
        self.log.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        log_layout.addWidget(self.log, 1)
        self.analysis_splitter.addWidget(log_panel)
        self.analysis_splitter.setStretchFactor(0, 3)
        self.analysis_splitter.setStretchFactor(1, 1)
        self.analysis_splitter.setSizes([440, 190])
        right_layout.addWidget(self.analysis_splitter, 1)
        splitter.addWidget(right)
        splitter.setSizes([310, 820])

        self.setStatusBar(QStatusBar())
        self.statusBar().showMessage("就绪 · 图像由 MWORKS.Syslab 2026b 生成")

    def apply_style(self):
        self.init_responsive_ui((1320, 900), """
            QMainWindow, QWidget { background: #f3f6f9; color: #172b3a; font-family: "Microsoft YaHei"; font-size: 14px; }
            QLabel#heading { font-size: 28px; font-weight: 700; color: #183b56; }
            QLabel#subheading { color: #607487; font-size: 13px; }
            QLabel#remark { color: #50687a; font-size: 13px; }
            QLabel#settingsHint { color: #607487; font-size: 12px; }
            QFrame#card { background: #ffffff; border: 1px solid #dce5eb; border-radius: 10px; }
            QLineEdit, QListWidget, QTextEdit { background: white; border: 1px solid #cad7e1; border-radius: 5px; padding: 7px; }
            QListWidget::item { padding: 7px; }
            QListWidget::item:selected { background: #deedf7; color: #163f5e; }
            QPushButton { background: #e7eff5; border: 1px solid #bdd1df; border-radius: 6px; padding: 8px 11px; }
            QPushButton:hover { background: #d8e8f2; }
            QPushButton:disabled { color: #8b9da9; background: #eef2f4; }
            QPushButton#primary { background: #245a78; color: white; border-color: #245a78; font-weight: 600; }
            QPushButton#primary:hover { background: #194863; }
            QLabel#preview { background: #fbfcfd; border: 1px dashed #c5d3dc; border-radius: 8px; color: #7b8c99; }
        """, self.scale_ui_metrics)

    def scale_ui_metrics(self, scale):
        px = lambda value: round(value * scale)
        self.root_layout.setContentsMargins(px(22), px(18), px(22), px(18))
        self.root_layout.setSpacing(px(16))
        for layout in (self.left_card_layout, self.right_card_layout):
            layout.setContentsMargins(px(18), px(18), px(18), px(18))
            layout.setSpacing(px(10))
        self.left_card.setMinimumWidth(px(285))
        self.left_scroll.setMinimumWidth(px(305))
        self.logo_label.setFixedSize(px(66), px(66))
        self.figure_select.setMinimumWidth(px(160))
        self.preview.setMinimumHeight(px(180))
        self.log.setMinimumHeight(px(100))
        self.apply_preferences()

    def apply_preferences(self):
        title = self.preferences["title"]
        self.setWindowTitle(title + " · MWORKS.Syslab")
        self.heading.setText(title)
        self.remark_label.setText(self.preferences["remark"])
        self.remark_label.setVisible(bool(self.preferences["remark"]))
        logo = self.preferences["logo"]
        pixmap = QPixmap(logo) if logo else QPixmap()
        if pixmap.isNull():
            self.logo_label.hide()
            self.setWindowIcon(QIcon())
        else:
            self.logo_label.setPixmap(pixmap.scaled(self.logo_label.width()-2, self.logo_label.height()-2,
                                                  Qt.KeepAspectRatio, Qt.SmoothTransformation))
            self.logo_label.show()
            self.setWindowIcon(QIcon(pixmap))

    def open_settings(self):
        dialog = SettingsDialog(self, self.preferences)
        if dialog.exec_() == QDialog.Accepted:
            try:
                self.preferences = save_preferences(
                    dialog.title_edit.text(), dialog.remark_edit.toPlainText(), dialog.logo_edit.text())
            except (OSError, ValueError) as exc:
                QMessageBox.warning(self, APP_TITLE, f"保存设置失败：{exc}")
                return
            self.apply_preferences()
            self.statusBar().showMessage("界面设置已保存")

    def browse_folder(self):
        folder = QFileDialog.getExistingDirectory(self, "选择数据文件夹", self.folder_edit.text() or str(Path.home()))
        if folder:
            self.folder_edit.setText(folder)
            self.scan_folder()

    def browse_output(self):
        folder = QFileDialog.getExistingDirectory(self, "选择输出文件夹", self.output_edit.text() or self.folder_edit.text() or str(Path.home()))
        if folder:
            self.output_edit.setText(folder)

    def choose_dbc(self, edit):
        path, _ = QFileDialog.getOpenFileName(self, "选择 DBC 文件", edit.text(), "DBC 文件 (*.dbc)")
        if path:
            edit.setText(path)

    def make_worker(self, mode, path, output_dir):
        source = self.source_edit.text().strip()
        if source:
            value = int(source, 16)
            if not 0 <= value <= 255:
                raise ValueError("源地址必须在 0x00–0xFF 之间")
            source = f"0x{value:02X}"
        dbcs = [Path(edit.text().strip()) for edit in (self.engine_dbc, self.sensor_dbc) if edit.text().strip()]
        if Path(path).suffix.lower() in (".asc", ".txt") and (not dbcs or any(not p.is_file() for p in dbcs)):
            raise ValueError("请选择有效的 DBC 文件")
        return AnalysisWorker(mode, path, output_dir, dbcs, self.channel_select.currentData(), source)

    def scan_folder(self):
        folder = Path(self.folder_edit.text().strip())
        if not folder.is_dir():
            QMessageBox.warning(self, APP_TITLE, "请先选择有效的数据文件夹。")
            return
        paths = sorted((p for p in folder.rglob("*") if p.is_file() and p.suffix.lower() in (".asc", ".txt", ".csv") and "分析结果" not in p.parts and p.name not in ("signal_mapping.csv", "decoded_signals_long.csv", "解析摘要.txt")), key=lambda p: str(p).lower())
        self.files.clear()
        for path in paths:
            item = QListWidgetItem(str(path.relative_to(folder)))
            item.setData(Qt.UserRole, str(path))
            self.files.addItem(item)
        if paths:
            self.files.setCurrentRow(0)
            if not self.output_edit.text().strip():
                self.output_edit.setText(str(folder / "分析结果"))
        self.log.setPlainText(f"找到 {len(paths)} 个数据文件。支持 CAN 表格 TXT、ASC 及物理量 CSV。")
        self.statusBar().showMessage(f"已扫描：{len(paths)} 个数据文件")

    def selection_changed(self, current, previous):
        if current:
            self.statusBar().showMessage("已选择：" + current.text())

    def run_mode(self, mode):
        item = self.files.currentItem()
        if item is None:
            QMessageBox.warning(self, APP_TITLE, "请先选择 ASC、CAN表格TXT / ASC格式TXT 或 CSV 文件。")
            return
        csv_path = Path(item.data(Qt.UserRole))
        output_root = Path(self.output_edit.text().strip() or csv_path.parent / "分析结果")
        output_dir = output_root / f"{csv_path.parent.name}_{csv_path.stem}"
        if self.worker is not None and self.worker.isRunning():
            return
        try:
            self.worker = self.make_worker(mode, csv_path, output_dir)
        except ValueError as exc:
            QMessageBox.warning(self, APP_TITLE, str(exc))
            return
        self.current_csv = csv_path
        self.current_output_dir = output_dir
        self.active_mode = mode
        self.worker.completed.connect(self.analysis_done)
        self.worker.finished.connect(self.worker.deleteLater)
        for button in self.buttons.values():
            button.setEnabled(False)
        self.statusBar().showMessage(f"Syslab 正在执行：{MODES[mode][0]}…")
        self.log.setPlainText(f"数据：{csv_path}\n输出：{output_dir}\n运行中，请稍候…")
        self.worker.start()

    def analysis_done(self, okay, image_path, log):
        if self.worker is not None:
            self.worker.wait()
        self.worker = None
        for button in self.buttons.values():
            button.setEnabled(True)
        self.log.setPlainText(log or "分析完成。")
        if okay and self.active_mode == "decode":
            self.statusBar().showMessage("CSV 导出完成：" + image_path)
        elif okay:
            self.populate_figures(self.active_mode)
            if image_path:
                self.statusBar().showMessage("完成 · 图像已保存至 " + str(self.current_output_dir))
            else:
                self.statusBar().showMessage("本项所需有效数据不足，已跳过出图；详情见运行信息。")
        else:
            self.statusBar().showMessage("运行失败，请查看运行信息")
            if not self.smoke:
                QMessageBox.critical(self, APP_TITLE, "Syslab 分析失败，请查看下方运行信息。")
        if self.smoke:
            screenshot = os.environ.get("SYSLAB_SMOKE_SCREENSHOT")
            if screenshot:
                self.grab().save(screenshot)
            if self.smoke_output:
                self.smoke_output.write_text(("PASS" if okay else "FAIL") + "\n" + log, encoding="utf-8")
            QTimer.singleShot(100, QApplication.instance().quit)

    def populate_figures(self, preferred_mode):
        self.figure_select.blockSignals(True)
        self.figure_select.clear()
        selected = 0
        for mode, (caption, filename) in MODES.items():
            if mode in ("all", "decode"):
                continue
            if (self.current_output_dir / filename).is_file():
                if mode == preferred_mode:
                    selected = self.figure_select.count()
                self.figure_select.addItem(caption, mode)
        self.figure_select.setCurrentIndex(selected)
        self.figure_select.blockSignals(False)
        self.select_figure(self.figure_select.currentIndex())

    def select_figure(self, index):
        if index < 0 or self.current_output_dir is None:
            self.current_image = None
            self.preview.clear()
            self.preview.setText("没有适用的图像\n仅对有效数据生成分析图，跳过原因见运行信息。")
            self.edit_figure_button.setEnabled(False)
            return
        mode = self.figure_select.itemData(index)
        self.current_image = self.current_output_dir / MODES[mode][1]
        self.show_preview()
        self.edit_figure_button.setEnabled(self.current_image.is_file())

    def open_figure_editor(self):
        mode = self.figure_select.currentData()
        if not mode or not self.current_image or not self.current_image.is_file():
            return
        try:
            editor = FigureEditor(self, self.current_csv, self.current_output_dir,
                                  mode, self.current_image, self.make_worker)
        except (OSError, ValueError) as exc:
            QMessageBox.warning(self, APP_TITLE, f"无法打开图窗：{exc}")
            return
        editor.image_updated.connect(self.edited_image_updated)
        editor.exec_()

    def edited_image_updated(self, image_path):
        self.current_image = Path(image_path)
        self.show_preview()
        self.statusBar().showMessage("图窗编辑已保存至 " + str(self.current_image))

    def show_preview(self):
        if self.current_image and self.current_image.is_file():
            pixmap = QPixmap(str(self.current_image))
            if not pixmap.isNull():
                self.preview.setPixmap(pixmap.scaled(self.preview.size(), Qt.KeepAspectRatio, Qt.SmoothTransformation))

    def resizeEvent(self, event):
        super().resizeEvent(event)
        if self.current_image:
            self.show_preview()

    def start_smoke(self):
        sample = Path(os.environ.get("SYSLAB_SMOKE_DATA", ""))
        if not sample.is_file():
            if self.smoke_output:
                self.smoke_output.write_text("FAIL\nmissing smoke data", encoding="utf-8")
            QApplication.instance().quit()
            return
        self.folder_edit.setText(str(sample.parent))
        self.output_edit.setText(os.environ.get("SYSLAB_SMOKE_OUTPUT", str(sample.parent / "smoke_figures")))
        self.scan_folder()
        for i in range(self.files.count()):
            if Path(self.files.item(i).data(Qt.UserRole)) == sample:
                self.files.setCurrentRow(i)
                break
        self.run_mode(os.environ.get("SYSLAB_SMOKE_MODE", "time"))


def main():
    app = QApplication(sys.argv)
    smoke = "--smoke" in sys.argv
    smoke_output = None
    if "--smoke-output" in sys.argv:
        smoke_output = sys.argv[sys.argv.index("--smoke-output") + 1]
    window = MainWindow(smoke=smoke, smoke_output=smoke_output)
    window.show()
    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
