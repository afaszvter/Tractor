import json
import csv
import math
import tomllib
from pathlib import Path
from responsive_ui import ResponsiveUiMixin

from PyQt5.QtCore import Qt, QTimer, pyqtSignal
from PyQt5.QtGui import QPixmap
from PyQt5.QtWidgets import (
    QComboBox, QDialog, QFormLayout, QGraphicsScene, QGraphicsView,
    QHBoxLayout, QLabel, QLineEdit, QMessageBox, QPushButton, QScrollArea,
    QSpinBox, QVBoxLayout, QWidget,
)


PANELS = {
    "time": ["子图 1", "子图 2", "子图 3", "子图 4"],
    "spectrum": ["转速频谱", "低频细节"],
    "points": ["工作点"],
    "distribution": ["分布子图 1", "分布子图 2"],
    "temperature": ["冷却液温度", "机油温度", "燃油温度", "大气温度"],
    "pressure": ["机油压力", "大气压力", "机油油位", "冷却液液位"],
    "electrical": ["发动机输入电压", "点火开关电压", "充电系统电压"],
    "sensor": ["AI11 ADC", "AI16 ADC", "AI18 ADC"],
    "force": ["传感器力（IN1）"],
    "force_distribution": ["拉力分布：作业样本"],
    "controls": ["油门踏板开度", "最大可利用扭矩"],
    "counters": ["累积工作时间", "总转数", "行程燃油", "记录内燃油积分"],
}


def style_path(output_dir, mode):
    return Path(output_dir) / f"plot_style_{mode}.toml"


def read_styles(output_dir, mode):
    path = style_path(output_dir, mode)
    if not path.is_file():
        return {}
    with path.open("rb") as stream:
        values = tomllib.load(stream)
    return {key: value for key, value in values.items() if key.startswith("panel") and isinstance(value, dict)}


def write_styles(output_dir, mode, styles):
    lines = []
    for key in sorted(styles, key=lambda item: int(item.removeprefix("panel"))):
        lines.append(f"[{key}]")
        for name, value in styles[key].items():
            if isinstance(value, str):
                encoded = json.dumps(value, ensure_ascii=False)
            elif isinstance(value, list):
                encoded = "[" + ", ".join(json.dumps(v, ensure_ascii=False) for v in value) + "]"
            else:
                encoded = str(value)
            lines.append(f"{name} = {encoded}")
        lines.append("")
    content = "\n".join(lines)
    tomllib.loads(content)
    path = style_path(output_dir, mode)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(".toml.tmp")
    temporary.write_text(content, encoding="utf-8")
    temporary.replace(path)


class ZoomView(QGraphicsView):
    def __init__(self):
        super().__init__()
        self.setScene(QGraphicsScene(self))
        self.setDragMode(QGraphicsView.ScrollHandDrag)
        self.setTransformationAnchor(QGraphicsView.AnchorUnderMouse)
        self.setRenderHints(self.renderHints())
        self.setStyleSheet("background: white; border: 1px solid #cbd8e2;")

    def set_image(self, path):
        pixmap = QPixmap(str(path))
        if pixmap.isNull():
            raise ValueError(f"图像无法打开：{path}")
        self.scene().clear()
        self.scene().addPixmap(pixmap)
        self.scene().setSceneRect(0, 0, pixmap.width(), pixmap.height())
        QTimer.singleShot(0, self.fit_image)

    def fit_image(self):
        if not self.scene().items():
            return
        self.resetTransform()
        self.fitInView(self.scene().sceneRect(), Qt.KeepAspectRatio)

    def zoom(self, factor):
        current = self.transform().m11()
        if 0.03 <= current * factor <= 12:
            self.scale(factor, factor)

    def wheelEvent(self, event):
        self.zoom(1.2 if event.angleDelta().y() > 0 else 1 / 1.2)
        event.accept()


class FigureEditor(ResponsiveUiMixin, QDialog):
    image_updated = pyqtSignal(str)

    def __init__(self, parent, csv_path, output_dir, mode, image_path, worker_class):
        super().__init__(parent)
        self.csv_path = Path(csv_path)
        self.output_dir = Path(output_dir)
        self.mode = mode
        self.image_path = Path(image_path)
        self.worker_class = worker_class
        self.worker = None
        self.styles = read_styles(output_dir, mode)
        layout_path = self.image_path.with_suffix(".panels.toml")
        if layout_path.is_file():
            with layout_path.open("rb") as stream:
                metadata = tomllib.load(stream)
            self.panel_labels = metadata["labels"]
            self.panel_keys = metadata["keys"]
            saved = list(self.styles.values())
            self.styles = {f"panel{i+1}": next((p for p in saved if p.get("field_key") == key), {})
                           for i, key in enumerate(self.panel_keys)}
        else:
            self.panel_labels = PANELS[self.mode]
            self.panel_keys = [""] * len(self.panel_labels)
        self.active_panel = 0
        self.setWindowTitle("图窗编辑 · " + mode)
        self.resize(1360, 830)
        self.setMinimumSize(960, 620)
        self.build_ui()
        self.init_responsive_ui((1360, 830), "QWidget { font-size: 14px; }",
                                lambda scale: self.controls_scroll.setFixedWidth(round(350 * scale)))
        self.load_panel(0)
        self.view.set_image(self.image_path)

    def build_ui(self):
        layout = QHBoxLayout(self)
        left = QVBoxLayout()
        toolbar = QHBoxLayout()
        for label, action in (("放大 +", lambda: self.view.zoom(1.25)),
                              ("缩小 −", lambda: self.view.zoom(0.8)),
                              ("适合窗口", self.view_fit)):
            button = QPushButton(label)
            button.clicked.connect(action)
            toolbar.addWidget(button)
        if self.mode == "force":
            full = QPushButton("完整时域")
            full.clicked.connect(self.full_time_range)
            toolbar.addWidget(full)
            focus = QPushButton("自动聚焦")
            focus.clicked.connect(self.auto_time_range)
            toolbar.addWidget(focus)
        toolbar.addStretch()
        toolbar.addWidget(QLabel("滚轮缩放 · 拖动平移"))
        left.addLayout(toolbar)
        self.view = ZoomView()
        left.addWidget(self.view, 1)
        layout.addLayout(left, 1)

        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setFixedWidth(350)
        self.controls_scroll = scroll
        controls = QWidget()
        form_layout = QVBoxLayout(controls)
        form = QFormLayout()
        self.panel_select = QComboBox()
        self.panel_select.addItems(self.panel_labels)
        self.panel_select.currentIndexChanged.connect(self.change_panel)
        form.addRow("编辑区域", self.panel_select)
        self.title_edit = QLineEdit()
        self.title_edit.setPlaceholderText("留空：保留原图题")
        form.addRow("图题", self.title_edit)
        self.xlabel_edit = QLineEdit()
        self.xlabel_edit.setPlaceholderText("留空：保留原横轴")
        form.addRow("横轴名称", self.xlabel_edit)
        self.ylabel_edit = QLineEdit()
        self.ylabel_edit.setPlaceholderText("留空：保留原纵轴")
        form.addRow("纵轴名称", self.ylabel_edit)
        self.bounds = {}
        for key, label in (("xmin", "横轴最小值"), ("xmax", "横轴最大值"),
                           ("ymin", "纵轴最小值"), ("ymax", "纵轴最大值")):
            edit = QLineEdit()
            edit.setPlaceholderText("自动")
            self.bounds[key] = edit
            form.addRow(label, edit)
        self.title_font = self.font_combo("SimSun")
        self.axis_font = self.font_combo("Times New Roman")
        form.addRow("图题字体", self.title_font)
        form.addRow("坐标轴字体", self.axis_font)
        self.title_size = self.spin(12)
        self.axis_size = self.spin(11)
        self.tick_size = self.spin(10)
        form.addRow("图题字号", self.title_size)
        form.addRow("轴名称字号", self.axis_size)
        form.addRow("刻度字号", self.tick_size)
        self.legend_mode = QComboBox()
        self.legend_mode.addItem("保持原样", "keep")
        self.legend_mode.addItem("显示 / 更新", "show")
        self.legend_mode.addItem("隐藏", "hide")
        self.legend_mode.currentIndexChanged.connect(self.legend_changed)
        form.addRow("图例", self.legend_mode)
        self.legend_labels = QLineEdit()
        self.legend_labels.setPlaceholderText("例如：A, B, C/2")
        form.addRow("图例名称", self.legend_labels)
        form_layout.addLayout(form)
        hint = QLabel("图例名称用英文逗号分隔；每项对应一条曲线或一组柱。坐标范围留空表示自动。")
        hint.setWordWrap(True)
        hint.setStyleSheet("color: #607487;")
        form_layout.addWidget(hint)
        self.apply_button = QPushButton("应用并重新出图")
        self.apply_button.clicked.connect(self.apply_changes)
        form_layout.addWidget(self.apply_button)
        reset_button = QPushButton("恢复此图默认格式")
        reset_button.clicked.connect(self.reset_style)
        form_layout.addWidget(reset_button)
        self.message = QLabel("图像由 MWORKS.Syslab 重新生成并保存。")
        self.message.setWordWrap(True)
        form_layout.addWidget(self.message)
        form_layout.addStretch()
        scroll.setWidget(controls)
        layout.addWidget(scroll)

    def full_time_range(self):
        path = self.csv_path
        if path.suffix.lower() != '.csv':
            path = self.output_dir / (path.stem + '_physical.csv')
        low, high = math.inf, -math.inf
        try:
            with path.open(encoding='utf-8-sig', newline='') as stream:
                for row in csv.DictReader(stream):
                    try:
                        value = float(row.get('Time_s', ''))
                    except (ValueError, TypeError):
                        continue
                    if math.isfinite(value):
                        low, high = min(low, value), max(high, value)
            if not math.isfinite(low) or high <= low:
                raise ValueError('没有可用的时间范围')
            self.bounds['xmin'].setText(str(low))
            self.bounds['xmax'].setText(str(high))
            self.apply_changes()
        except (OSError, ValueError) as exc:
            QMessageBox.warning(self, '图窗编辑', str(exc))

    def auto_time_range(self):
        self.bounds['xmin'].clear()
        self.bounds['xmax'].clear()
        self.apply_changes()

    def view_fit(self):
        self.view.fit_image()

    @staticmethod
    def font_combo(default):
        combo = QComboBox()
        combo.setEditable(True)
        combo.addItems(["SimSun", "Times New Roman", "Microsoft YaHei", "Arial", "SimHei"])
        combo.setCurrentText(default)
        return combo

    @staticmethod
    def spin(default):
        field = QSpinBox()
        field.setRange(6, 36)
        field.setValue(default)
        return field

    def legend_changed(self):
        self.legend_labels.setEnabled(self.legend_mode.currentData() == "show")

    def change_panel(self, new_index):
        if new_index < 0:
            return
        try:
            self.capture_panel(self.active_panel)
        except ValueError as exc:
            self.panel_select.blockSignals(True)
            self.panel_select.setCurrentIndex(self.active_panel)
            self.panel_select.blockSignals(False)
            QMessageBox.warning(self, "图窗编辑", str(exc))
            return
        self.active_panel = new_index
        self.load_panel(new_index)

    def load_panel(self, index):
        panel = self.styles.get(f"panel{index+1}", {})
        self.title_edit.setText(panel.get("title", ""))
        self.xlabel_edit.setText(panel.get("xlabel", ""))
        self.ylabel_edit.setText(panel.get("ylabel", ""))
        for key, edit in self.bounds.items():
            edit.setText(str(panel[key]) if key in panel else "")
        self.title_font.setCurrentText(panel.get("title_font", "SimSun"))
        self.axis_font.setCurrentText(panel.get("axis_font", "Times New Roman"))
        self.title_size.setValue(panel.get("title_size", 12))
        self.axis_size.setValue(panel.get("axis_size", 11))
        self.tick_size.setValue(panel.get("tick_size", 10))
        self.legend_mode.setCurrentIndex({"keep": 0, "show": 1, "hide": 2}.get(panel.get("legend", "keep"), 0))
        self.legend_labels.setText(", ".join(panel.get("legend_labels", [])))
        self.legend_changed()

    def capture_panel(self, index):
        panel = {}
        if self.panel_keys[index]:
            panel["field_key"] = self.panel_keys[index]
        for key, edit in (("title", self.title_edit), ("xlabel", self.xlabel_edit), ("ylabel", self.ylabel_edit)):
            value = edit.text().strip()
            if value:
                panel[key] = value
        for key, edit in self.bounds.items():
            value = edit.text().strip()
            if value:
                number = float(value)
                if not math.isfinite(number):
                    raise ValueError("坐标范围只能填写有限数字。")
                panel[key] = number
        for low, high in (("xmin", "xmax"), ("ymin", "ymax")):
            if low in panel and high in panel and panel[low] >= panel[high]:
                raise ValueError("坐标轴最小值必须小于最大值。")
        panel["title_font"] = self.title_font.currentText().strip() or "SimSun"
        panel["axis_font"] = self.axis_font.currentText().strip() or "Times New Roman"
        panel["title_size"] = self.title_size.value()
        panel["axis_size"] = self.axis_size.value()
        panel["tick_size"] = self.tick_size.value()
        panel["legend"] = self.legend_mode.currentData()
        if panel["legend"] == "show":
            labels = [part.strip() for part in self.legend_labels.text().split(",") if part.strip()]
            if not labels:
                raise ValueError("显示图例时，请至少填写一个图例名称。")
            panel["legend_labels"] = labels
        self.styles[f"panel{index+1}"] = panel

    def apply_changes(self):
        try:
            self.capture_panel(self.active_panel)
            write_styles(self.output_dir, self.mode, self.styles)
        except (OSError, ValueError) as exc:
            QMessageBox.warning(self, "图窗编辑", str(exc))
            return
        self.apply_button.setEnabled(False)
        self.message.setText("Syslab 正在重新绘制，请稍候…")
        self.worker = self.worker_class(self.mode, self.csv_path, self.output_dir)
        self.worker.completed.connect(self.render_done)
        self.worker.finished.connect(self.worker.deleteLater)
        self.worker.start()

    def reset_style(self):
        try:
            path = style_path(self.output_dir, self.mode)
            path.unlink(missing_ok=True)
        except OSError as exc:
            QMessageBox.warning(self, "图窗编辑", str(exc))
            return
        self.styles = {}
        self.load_panel(self.active_panel)
        self.apply_changes()

    def render_done(self, okay, image_path, log):
        if self.worker is not None:
            self.worker.wait()
        self.worker = None
        self.apply_button.setEnabled(True)
        if okay and image_path:
            self.image_path = Path(image_path)
            self.view.set_image(self.image_path)
            self.image_updated.emit(str(self.image_path))
            self.message.setText("已保存：" + str(self.image_path))
        elif okay:
            self.message.setText("所需数据不足，已跳过该图。请返回主窗口查看运行信息。")
        else:
            self.message.setText("出图失败，请检查坐标值和字体设置。")
            QMessageBox.critical(self, "图窗编辑", "Syslab 重新出图失败：\n" + log[-3000:])

    def closeEvent(self, event):
        if self.worker is not None and self.worker.isRunning():
            self.message.setText("Syslab 正在出图，完成后可关闭图窗。")
            event.ignore()
        else:
            event.accept()
