import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

Item {
    required property var screen

    id: root

    component ExclusionZone: PanelWindow {
        screen: root.screen
        implicitWidth: 0
        implicitHeight: 0
        color: "transparent"
        mask: Region {}

        WlrLayershell.namespace: Globals.appId + "_exclusions"
    }

    ExclusionZone {
        exclusiveZone: Config.appearance.wrapper.implicitSize

        anchors {
            top: true
        }
    }

    ExclusionZone {
        exclusiveZone: States.showSidebar
            ? Config.appearance.sidebar.implicitSize
            : Config.appearance.wrapper.implicitSize

        anchors {
            left: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.appearance.wrapper.implicitSize

        anchors {
            right: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.appearance.wrapper.implicitSize

        anchors {
            bottom: true
        }
    }
}
