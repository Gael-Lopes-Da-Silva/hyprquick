pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property bool isFullscreen: Hyprland.focusedMonitor.activeWorkspace.hasFullscreen
}
