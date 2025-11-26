pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var wrapper: QtObject {
        readonly property real implicitSize: 20
    }

    readonly property var sidebar: QtObject {
        readonly property real implicitWidth: 50

        readonly property var workspaces: QtObject {
            readonly property var background: QtObject {
                readonly property real radius: 100
            }

            readonly property var icons: QtObject {
                readonly property var background: QtObject {
                    readonly property real radius: 100
                }
            }
        }
    }

    readonly property var sizes: QtObject {
        readonly property real scale: 1
        readonly property int small: 11 * scale
        readonly property int smaller: 12 * scale
        readonly property int normal: 13 * scale
        readonly property int larger: 15 * scale
        readonly property int large: 18 * scale
        readonly property int extraLarge: 28 * scale
    }

    readonly property var margins: QtObject {
        readonly property real scale: 1
        readonly property int extraSmall: 4 * scale
        readonly property int small: 10 * scale
        readonly property int smaller: 20 * scale
        readonly property int normal: 30 * scale
        readonly property int larger: 40 * scale
        readonly property int large: 50 * scale
        readonly property int extraLarge: 60 * scale
    }

    readonly property var radius: QtObject {
        readonly property real scale: 1
        readonly property int extraSmall: 4 * scale
        readonly property int small: 8 * scale
        readonly property int smaller: 14 * scale
        readonly property int normal: 20 * scale
        readonly property int larger: 28 * scale
        readonly property int large: 34 * scale
        readonly property int extraLarge: 38 * scale
        readonly property int round: 100 * scale
    }

    readonly property var fonts: QtObject {
        readonly property var icons: FontLoader {
            source: Qt.resolvedUrl("../assets/fonts/MingCute.ttf")
        }
    }
}
