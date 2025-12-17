import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

import "components"

Loader {
    required property var screen

    id: root
    active: States.showSidebar
    visible: States.showSidebar
    sourceComponent: Item {
        implicitWidth: Config.appearance.sidebar.implicitSize

        ColumnLayout {
            spacing: Config.appearance.sidebar.spacing

            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: Config.appearance.sidebar.topMargin
            }

            Workspaces {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }
        }

        ColumnLayout {
            spacing: Config.appearance.sidebar.spacing

            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                bottomMargin: Config.appearance.sidebar.bottomMargin
            }

            SystemTray {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Status {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Clock {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }

            Power {
                screen: root.screen

                Layout.alignment: Qt.AlignCenter
            }
        }
    }
}

