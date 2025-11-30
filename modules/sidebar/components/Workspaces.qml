import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

import qs.configs
import qs.components
import qs.services

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: ColumnLayout {
        spacing: Config.general.sidebar.workspaces.spacing

        Rectangle {
            radius: Config.general.sidebar.workspaces.windowCount.radius
            color: Config.appearance.sidebar.workspaces.windowCount.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: Config.general.sidebar.workspaces.windowCount.size
            Layout.preferredWidth: Config.general.sidebar.workspaces.windowCount.size

            Icon {
                visible: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length == 0
                icon: Globals.icons.layout_3_fill
                color: Config.appearance.sidebar.workspaces.windowCount.color
                size: Config.general.sidebar.workspaces.windowCount.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }

            Text {
                visible: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length > 0
                text: Hyprland.focusedMonitor.activeWorkspace.toplevels.values.length
                color: Config.appearance.sidebar.workspaces.windowCount.color
                font.pointSize: Config.general.sidebar.workspaces.windowCount.fontSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }
        }

        Rectangle {
            radius: Config.general.sidebar.workspaces.indicators.radius
            color: Config.appearance.sidebar.workspaces.indicators.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: Config.general.sidebar.workspaces.indicators.size
            Layout.preferredHeight: (Config.general.sidebar.workspaces.indicators.size * Hyprland.workspaces.values.length) + (Config.general.sidebar.workspaces.indicators.spacing * (Hyprland.workspaces.values.length - 1))

            ColumnLayout {
                spacing: Config.general.sidebar.workspaces.indicators.spacing

                anchors {
                    centerIn: parent
                }

                Repeater {
                    model: Hyprland.workspaces

                    Item {
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: Config.general.sidebar.workspaces.indicators.size
                        Layout.preferredHeight: Config.general.sidebar.workspaces.indicators.size

                        Rectangle {
                            color: {
                                if (modelData.urgent) {
                                    return Config.appearance.sidebar.workspaces.indicators.indicator.urgent;
                                } else if ((modelData.id <= 0 || modelData.id > 10) && modelData.toplevels.values.length > 0) {
                                    return Config.appearance.sidebar.workspaces.indicators.indicator.specialSelected;
                                } else if (modelData.active) {
                                    return Config.appearance.sidebar.workspaces.indicators.indicator.selected;
                                } else {
                                    return Config.appearance.sidebar.workspaces.indicators.indicator.background;
                                }
                            }
                            radius: Config.general.sidebar.workspaces.indicators.radius

                            anchors {
                                fill: parent
                                margins: Config.general.sidebar.workspaces.indicators.indicator.margin
                            }

                            Text {
                                visible: modelData.id > 0 && modelData.id <= 10
                                text: modelData.id
                                color: Config.appearance.sidebar.workspaces.indicators.indicator.color
                                font.pointSize: Config.general.sidebar.workspaces.indicators.indicator.fontSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            Icon {
                                visible: modelData.id <= 0 || modelData.id > 10
                                icon: Globals.icons.asterisk_fill
                                color: Config.appearance.sidebar.workspaces.indicators.indicator.specialColor
                                font.pointSize: Config.general.sidebar.workspaces.indicators.indicator.specialFontSize

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
}
