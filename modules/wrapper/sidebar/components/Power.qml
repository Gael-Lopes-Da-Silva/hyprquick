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
            radius: Config.appearance.sidebar.power.radius
            color: Config.appearance.sidebar.power.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: Config.appearance.sidebar.power.size
            Layout.preferredWidth: Config.appearance.sidebar.power.size

            Rectangle {
                color: "transparent"
                radius: Config.appearance.sidebar.power.radius

                anchors {
                    fill: parent
                    margins: Config.appearance.sidebar.power.button.margin
                }

                Icon {
                    icon: Globals.icons.power_fill
                    color: Config.appearance.sidebar.power.button.color
                    size: Config.appearance.sidebar.power.button.iconSize

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

                    onEntered: parent.color = Config.appearance.sidebar.power.button.hovered
                    onExited: parent.color = "transparent"
                }
            }
        }
    }
}
