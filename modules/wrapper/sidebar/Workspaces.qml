import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import "../../../configs"
import "../../../components"
import "../../../services"

Item {
    required property var screen

    id: root
    implicitHeight: workspaces.implicitHeight + Config.margins.small
    implicitWidth: workspaces.implicitWidth + Config.margins.small

    Rectangle {
        color: Appearance.sidebar.workspaces.background
        radius: Config.radius.round

        anchors {
            fill: parent
        }
    }

    ColumnLayout {
        id: workspaces
        spacing: 4

        anchors {
            centerIn: parent
        }

        Repeater {
            model: Hyprland.workspaces

            Item {
                implicitWidth: workspaceIcon.implicitWidth + Config.margins.small
                implicitHeight: workspaceIcon.implicitHeight + Config.margins.small

                Rectangle {
                    color: modelData.active ? Appearance.sidebar.workspaces.icons.background : "transparent"
                    radius: Config.radius.round

                    anchors {
                        fill: parent
                    }
                }

                Icon {
                    id: workspaceIcon
                    icon: GlobalIcons.computer_fill
                    color: Appearance.sidebar.workspaces.icons.color
                    size: Config.sizes.larger

                    anchors {
                        centerIn: parent
                    }
                }
            }
        }
    }
}
