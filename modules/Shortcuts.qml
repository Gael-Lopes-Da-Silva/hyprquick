import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.services

Item {
    id: root

    GlobalShortcut {
        appid: GlobalDatas.appId
        name: "toggle:sidebar"
        description: "Toggle sidebar"

        onPressed: {
            GlobalStates.showSidebar = !GlobalStates.showSidebar;
        }
    }

    GlobalShortcut {
        appid: GlobalDatas.appId
        name: "toggle:wrapper"
        description: "Toggle wrapper"

        onPressed: {
            GlobalStates.showWrapper = !GlobalStates.showWrapper;
        }
    }
}
