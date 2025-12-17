import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.configs
import qs.components
import qs.services

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: ColumnLayout {
        Rectangle {
            radius: Config.appearance.sidebar.status.radius
            color: Config.appearance.sidebar.status.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: statusColumn.height
            Layout.preferredWidth: Config.appearance.sidebar.status.size

            ColumnLayout {
                id: statusColumn
                spacing: 0

                Loader {
                    active: true
                    visible: true
                    sourceComponent: Item {
                        anchors {
                            fill: parent
                        }

                        Rectangle {
                            color: "transparent"
                            radius: Config.appearance.sidebar.status.radius

                            anchors {
                                fill: parent
                                margins: Config.appearance.sidebar.status.button.margin
                            }

                            Icon {
                                icon: Globals.icons.wifi_fill
                                color: Config.appearance.sidebar.status.button.color
                                size: Config.appearance.sidebar.status.button.iconSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            MouseArea {
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                anchors {
                                    fill: parent
                                }

                                onEntered: parent.color = Config.appearance.sidebar.status.button.hovered
                                onExited: parent.color = "transparent"
                            }
                        }
                    }

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: Config.appearance.sidebar.status.size
                    Layout.preferredWidth: Config.appearance.sidebar.status.size
                }

                Loader {
                    active: true
                    visible: true
                    sourceComponent: Item {
                        anchors {
                            fill: parent
                        }

                        Rectangle {
                            color: "transparent"
                            radius: Config.appearance.sidebar.status.radius

                            anchors {
                                fill: parent
                                margins: Config.appearance.sidebar.status.button.margin
                            }

                            Icon {
                                icon: Globals.icons.bluetooth_fill
                                color: Config.appearance.sidebar.status.button.color
                                size: Config.appearance.sidebar.status.button.iconSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            MouseArea {
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                anchors {
                                    fill: parent
                                }

                                onEntered: parent.color = Config.appearance.sidebar.status.button.hovered
                                onExited: parent.color = "transparent"
                            }
                        }
                    }

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: Config.appearance.sidebar.status.size
                    Layout.preferredWidth: Config.appearance.sidebar.status.size
                }

                Loader {
                    active: true
                    visible: true
                    sourceComponent: Item {
                        anchors {
                            fill: parent
                        }

                        Rectangle {
                            color: "transparent"
                            radius: Config.appearance.sidebar.status.radius

                            anchors {
                                fill: parent
                                margins: Config.appearance.sidebar.status.button.margin
                            }

                            Icon {
                                icon: Globals.icons.battery_fill
                                color: Config.appearance.sidebar.status.button.color
                                size: Config.appearance.sidebar.status.button.iconSize

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            MouseArea {
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor

                                anchors {
                                    fill: parent
                                }

                                onEntered: parent.color = Config.appearance.sidebar.status.button.hovered
                                onExited: parent.color = "transparent"
                            }
                        }
                    }

                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredHeight: Config.appearance.sidebar.status.size
                    Layout.preferredWidth: Config.appearance.sidebar.status.size
                }
            }
        }
    }
}

