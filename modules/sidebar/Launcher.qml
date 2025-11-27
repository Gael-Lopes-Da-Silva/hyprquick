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
        radius: Config.sidebar.launcher.radius
        color: Appearance.sidebar.launcher.background

        Layout.alignment: Qt.AlignCenter
        Layout.preferredHeight: Config.sidebar.launcher.size
        Layout.preferredWidth: Config.sidebar.launcher.size

        MouseArea {
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            anchors {
                fill: parent
            }

            onEntered: launchButton.color = Appearance.sidebar.launcher.button.hovered
            onExited: launchButton.color = "transparent"
        }

        Rectangle {
            id: launchButton
            color: "transparent"
            radius: Config.sidebar.launcher.radius

            anchors {
                fill: parent
                margins: Config.sidebar.launcher.button.margin
            }

            Icon {
                icon: GlobalIcons.rocket_2_fill
                color: Appearance.sidebar.launcher.button.color
                size: Config.sidebar.launcher.button.iconSize

                anchors {
                    centerIn: parent
                    alignWhenCentered: false
                }
            }
        }
    }
}
