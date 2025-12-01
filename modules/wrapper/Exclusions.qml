import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

Item {
    required property var screen

    component ExclusionZone: PanelWindow {
        screen: root.screen
        implicitWidth: 0
        implicitHeight: 0
        color: "transparent"
        mask: Region {}

        WlrLayershell.namespace: Globals.appId + "_exclusions"
    }

    id: root

    ExclusionZone {
        exclusiveZone: Config.general.wrapper.implicitSize

        anchors {
            top: true
        }
    }

    ExclusionZone {
        exclusiveZone: States.showSidebar ? Config.general.sidebar.implicitSize : Config.general.wrapper.implicitSize

        anchors {
            left: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.general.wrapper.implicitSize

        anchors {
            right: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.general.wrapper.implicitSize

        anchors {
            bottom: true
        }
    }
}
