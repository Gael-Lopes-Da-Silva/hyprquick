pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var options: QtObject {
        readonly property var wrapper: QtObject {
            readonly property real implicitSize: 20
            readonly property color fillColor: "white"
        }

        readonly property var sidebar: QtObject {
            readonly property real implicitWidth: 50

            readonly property var workspaces: QtObject {

            }
        }
    }

    readonly property var fonts: QtObject {
        readonly property var sizes: QtObject {
            readonly property real scale: 1
            readonly property int small: 11 * scale
            readonly property int smaller: 12 * scale
            readonly property int normal: 13 * scale
            readonly property int larger: 15 * scale
            readonly property int large: 18 * scale
            readonly property int extraLarge: 28 * scale
        }

        readonly property var icons: FontLoader {
            source: Qt.resolvedUrl("../assets/fonts/MingCute.ttf")
        }
    }
}
