import QtQuick
import Quickshell
import Quickshell.Wayland

import "../../components"
import "../../configs"

Scope {
    required property var screen

    component ExclusionZone: PanelWindow {
        screen: root.screen
        implicitWidth: 1
        implicitHeight: 1
        mask: Region {}

        WlrLayershell.namespace: "hyprquick_exclusions"
    }

    id: root

    ExclusionZone {
        exclusiveZone: Config.options.wrapper.implicitSize

        anchors {
            top: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.options.sidebar.implicitWidth

        anchors {
            left: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.options.wrapper.implicitSize

        anchors {
            right: true
        }
    }

    ExclusionZone {
        exclusiveZone: Config.options.wrapper.implicitSize

        anchors {
            bottom: true
        }
    }
}
