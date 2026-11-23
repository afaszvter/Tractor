"""Window-relative UI sizing in Qt logical pixels (Windows DPI is handled by Qt)."""
import math
import re
from PyQt5.QtCore import QTimer
from PyQt5.QtWidgets import QLayout


def window_scale(width, height, reference_width, reference_height):
    ratio = math.sqrt(max(1, width) * max(1, height) / (reference_width * reference_height))
    # Keep the accepted small-window size; bound very large displays for readability.
    return round(min(2.25, max(1.0, ratio)), 2)


def scaled_stylesheet(stylesheet, scale):
    return re.sub(r'(\d+)px', lambda m: f'{max(1, round(int(m[1]) * scale))}px', stylesheet)


class ResponsiveUiMixin:
    def init_responsive_ui(self, reference_size, stylesheet, callback=None):
        # Enlarged child size hints must not prevent restoring a smaller window.
        # Explicit minimum sizes still apply; fonts settle after the resize event.
        if self.layout() is not None:
            self.layout().setSizeConstraint(QLayout.SetNoConstraint)
        self._reference_size = reference_size
        self._base_stylesheet = stylesheet
        self._scale_callback = callback
        self._ui_scale = None
        self._scale_timer = QTimer(self)
        self._scale_timer.setSingleShot(True)
        self._scale_timer.timeout.connect(self.update_responsive_ui)
        self.update_responsive_ui()

    def update_responsive_ui(self):
        scale = window_scale(self.width(), self.height(), *self._reference_size)
        if scale == self._ui_scale:
            return
        self._ui_scale = scale
        self.setStyleSheet(scaled_stylesheet(self._base_stylesheet, scale))
        if self._scale_callback:
            self._scale_callback(scale)

    def resizeEvent(self, event):
        super().resizeEvent(event)
        if hasattr(self, '_scale_timer'):
            # Debounce layout changes while the user drags a window edge.
            self._scale_timer.start(70)

    def showEvent(self, event):
        super().showEvent(event)
        if hasattr(self, '_scale_timer'):
            # Reapply after Qt polishes inherited styles from a larger parent window.
            self._ui_scale = None
            self._scale_timer.start(0)
