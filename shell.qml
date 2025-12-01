//@ pragma Env QS_NO_RELOAD_POPUP=1
//@ pragma Env QSG_RENDER_LOOP=threaded
//@ pragma Env QT_QUICK_FLICKABLE_WHEEL_DECELERATION=10000

import QtQuick
import Quickshell

import qs.modules
import qs.modules.wallpaper
import qs.modules.wrapper
import qs.modules.sidebar

ShellRoot {
    Wallpaper {}
    Wrapper {}

    Shortcuts {}
}
