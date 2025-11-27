pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var wrapper: QtObject {
        readonly property real implicitSize: 20
        readonly property var background: QtObject {
            readonly property real radius: 30
        }
    }

    readonly property var sidebar: QtObject {
        readonly property real implicitSize: 50
        readonly property real topMargin: 40
        readonly property real bottomMargin: 40
        readonly property real spacing: 20
        readonly property var launcher: QtObject {
            readonly property real radius: 100
            readonly property real size: 40
            readonly property var button: QtObject {
                readonly property real margin: 4
                readonly property real iconSize: 16
            }
        }
        readonly property var power: QtObject {
            readonly property real radius: 100
            readonly property real size: 40
            readonly property var button: QtObject {
                readonly property real margin: 4
                readonly property real iconSize: 16
            }
        }
        readonly property var workspaces: QtObject {
            readonly property real spacing: 4
            readonly property var windowCount: QtObject {
                readonly property real radius: 100
                readonly property real size: 40
                readonly property real iconSize: 16
                readonly property real fontSize: 12
            }
            readonly property var indicators: QtObject {
                readonly property real radius: 100
                readonly property real size: 40
                readonly property real spacing: 0
                readonly property var indicator: QtObject {
                    readonly property real margin: 4
                    readonly property real fontSize: 12
                }
            }
        }
    }

    readonly property var fonts: QtObject {
        readonly property var icons: FontLoader {
            source: Qt.resolvedUrl("../assets/fonts/MingCute.ttf")
        }
    }
}
