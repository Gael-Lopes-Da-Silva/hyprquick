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

Item {
    required property var screen

    id: root

    Loader {
        active: true
        visible: true
        sourceComponent: Audio.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }

    Loader {
        active: true
        visible: true
        sourceComponent: Launcher.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }

    Loader {
        active: true
        visible: true
        sourceComponent: Notifications.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }

    Loader {
        active: true
        visible: true
        sourceComponent: Overview.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }

    Loader {
        active: true
        visible: true
        sourceComponent: Power.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }

    Loader {
        active: true
        visible: true
        sourceComponent: Utilities.Background {
            screen: root.screen

            anchors {
                fill: parent
            }
        }
    }
}
