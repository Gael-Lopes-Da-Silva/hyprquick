import QtQuick
import QtQuick.Layouts
import Quickshell

import "../../configs"
import "../../components"
import "../../services"

ColumnLayout {
    required property var screen

    id: root

    Rectangle {
        radius: Config.sidebar.power.radius
        color: Appearance.sidebar.power.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: Config.sidebar.power.size
        Layout.preferredWidth: Config.sidebar.power.size

        MouseArea {
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            anchors {
                fill: parent
            }

            onEntered: powerButton.color = Appearance.sidebar.power.button.hovered
            onExited: powerButton.color = "transparent"
        }

        Rectangle {
            id: powerButton
            color: "transparent"
            radius: Config.sidebar.power.radius

            anchors {
                fill: parent
                margins: Config.sidebar.power.button.margin
            }

            Icon {
                icon: GlobalIcons.power_fill
                color: Appearance.sidebar.power.button.color
                size: Config.sidebar.power.button.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }
        }
    }
}
