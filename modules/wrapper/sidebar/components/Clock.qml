import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

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
            radius: Config.appearance.sidebar.clock.radius
            color: Config.appearance.sidebar.clock.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: clockColumn.height
            Layout.preferredWidth: Config.appearance.sidebar.clock.size

            Rectangle {
                color: "transparent"
                radius: Config.appearance.sidebar.clock.radius

                anchors {
                    fill: parent
                    margins: Config.appearance.sidebar.clock.button.margin
                }

                ColumnLayout {
                    id: clockColumn
                    spacing: Config.appearance.sidebar.clock.spacing

                    anchors {
                        centerIn: parent
                    }

                    Item {
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: Config.appearance.sidebar.clock.size
                        Layout.preferredHeight: Config.appearance.sidebar.clock.size

                        Icon {
                            icon: Globals.icons.time_fill
                            color: Config.appearance.sidebar.clock.button.iconColor
                            size: Config.appearance.sidebar.clock.button.iconSize

                            anchors {
                                centerIn: parent
                                alignWhenCentered: false
                            }
                        }
                    }

                    Item {
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredWidth: Config.appearance.sidebar.clock.size
                        Layout.preferredHeight: clockHoursText.height
                        Layout.bottomMargin: 8

                        Text {
                            id: clockHoursText
                            text: {
                                let time = "hh\nmm";

                                if (Config.general.sidebar.clock.showSeconds) {
                                    time += "\nss";
                                }

                                if (Config.general.sidebar.clock.useTwelveHourClock) {
                                    time += "\nA";
                                }

                                return Qt.formatDateTime(clockHours.date, time);
                            }
                            color: Config.appearance.sidebar.clock.button.color
                            font.pointSize: Config.appearance.sidebar.clock.button.fontSize

                            anchors {
                                centerIn: parent
                                alignWhenCentered: false
                            }

                            SystemClock {
                                id: clockHours
                                precision: Config.general.sidebar.clock.showSeconds
                                    ? SystemClock.Seconds
                                    : SystemClock.Minutes
                            }
                        }
                    }
                }

                MouseArea {
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    anchors {
                        fill: parent
                    }

                    onEntered: parent.color = Config.appearance.sidebar.clock.button.hovered
                    onExited: parent.color = "transparent"
                }
            }
        }
    }
}
