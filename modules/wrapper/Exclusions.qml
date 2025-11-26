import QtQuick
import Quickshell
import Quickshell.Wayland

import "../../configs"
import "../../components"
import "../../services"

Item {
    required property var screen

    component ExclusionZone: PanelWindow {
        screen: root.screen
        implicitWidth: 1
        implicitHeight: 1
        mask: Region {}

        WlrLayershell.namespace: GlobalDatas.appId + "_exclusions"
    }

    id: root

    ExclusionZone {
        exclusiveZone: Config.wrapper.implicitSize

        anchors {
            top: true
        }
    }

    ExclusionZone {
        exclusiveZone: GlobalStates.showSidebar ? Config.sidebar.implicitWidth : Config.wrapper.implicitSize

        anchors {
            left: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.wrapper.implicitSize

        anchors {
            right: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.wrapper.implicitSize

        anchors {
            bottom: true
        }
    }
}
