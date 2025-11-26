import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../services"

Item {
    GlobalShortcut {
        appid: GlobalDatas.appId
        name: "toggleSidebar"
        description: "Toggle sidebar"

        onPressed: {
            GlobalStates.showSidebar = !GlobalStates.showSidebar;
        }
    }
}
