import QtQuick
import QtQuick.Shapes
import Quickshell

import qs.configs
import qs.services

import qs.modules.drawers.audio as Audio
import qs.modules.drawers.launcher as Launcher
import qs.modules.drawers.notifications as Notifications
import qs.modules.drawers.overview as Overview
import qs.modules.drawers.power as Power
import qs.modules.drawers.utilities as Utilities

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: Item {
        Audio.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }

        Launcher.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }

        Notifications.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }

        Overview.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }

        Power.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }

        Utilities.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }
}
