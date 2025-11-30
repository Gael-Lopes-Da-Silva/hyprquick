import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.services

Item {
    id: root

    GlobalShortcut {
        appid: Globals.appId
        name: "toggle:sidebar"
        description: "Toggle sidebar"

        onPressed: {
            States.showSidebar = !States.showSidebar;
        }
    }

    GlobalShortcut {
        appid: Globals.appId
        name: "toggle:wrapper"
        description: "Toggle wrapper"

        onPressed: {
            States.showWrapper = !States.showWrapper;
        }
    }
}
