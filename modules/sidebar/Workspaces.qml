import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import "../../configs"
import "../../components"
import "../../services"

ColumnLayout {
    required property var screen

    id: root
    spacing: Config.sidebar.workspaces.spacing

    Rectangle {
        radius: Config.sidebar.workspaces.windowCount.radius
        color: Appearance.sidebar.workspaces.windowCount.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: Config.sidebar.workspaces.windowCount.size
        Layout.preferredWidth: Config.sidebar.workspaces.windowCount.size

        Loader {
            active: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length == 0
            sourceComponent: Icon {
                icon: GlobalIcons.layout_3_fill
                color: Appearance.sidebar.workspaces.windowCount.color
                size: Config.sidebar.workspaces.windowCount.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }

            anchors {
                centerIn: parent
            }
        }

        Loader {
            active: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length > 0
            sourceComponent: Text {
                text: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length
                color: Appearance.sidebar.workspaces.windowCount.color
                font.pointSize: Config.sidebar.workspaces.windowCount.fontSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }

            anchors {
                centerIn: parent
            }
        }
    }

    Rectangle {
        radius: Config.sidebar.workspaces.indicators.radius
        color: Appearance.sidebar.workspaces.indicators.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: Config.sidebar.workspaces.indicators.size
        Layout.preferredHeight: (Config.sidebar.workspaces.indicators.size * Hyprland.workspaces.values.length) + (Config.sidebar.workspaces.indicators.spacing * (Hyprland.workspaces.values.length - 1))

        ColumnLayout {
            id: workspaces
            spacing: Config.sidebar.workspaces.indicators.spacing

            anchors {
                centerIn: parent
            }

            Repeater {
                model: Hyprland.workspaces

                Item {
                    Layout.preferredWidth: Config.sidebar.workspaces.indicators.size
                    Layout.preferredHeight: Config.sidebar.workspaces.indicators.size

                    Rectangle {
                        color: modelData.active ? Appearance.sidebar.workspaces.indicators.indicator.selected : Appearance.sidebar.workspaces.indicators.indicator.background
                        radius: Config.sidebar.workspaces.indicators.radius

                        anchors {
                            fill: parent
                            margins: Config.sidebar.workspaces.indicators.indicator.margin
                        }

                        Text {
                            text: modelData.id
                            color: Appearance.sidebar.workspaces.indicators.indicator.color
                            font.pointSize: Config.sidebar.workspaces.indicators.indicator.fontSize

                            anchors {
                                centerIn: parent
                                alignWhenCentered: false
                            }
                        }
                    }
                }
            }
        }
    }
}
