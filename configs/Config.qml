pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var wrapper: QtObject {
        readonly property real implicitSize: 20
        readonly property real radius: 30
        readonly property var shadow: QtObject {
            readonly property bool enabled: true
            readonly property real maxBlur: 15
        }
    }

    readonly property var sidebar: QtObject {
        readonly property real implicitSize: 50
        readonly property real topMargin: 5
        readonly property real bottomMargin: 5
        readonly property real spacing: 20
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
                    readonly property real specialFontSize: 16
                    readonly property real fontSize: 12
                }
            }
        }
        readonly property var clock: QtObject {
            readonly property real radius: 100
            readonly property real size: 40
            readonly property real spacing: 0
            readonly property bool showSeconds: false
            readonly property bool useTwelveHourClock: false
            readonly property var button: QtObject {
                readonly property real margin: 4
                readonly property real iconSize: 16
                readonly property real fontSize: 16
            }
        }
        readonly property var status: QtObject {
            readonly property real radius: 100
            readonly property real size: 40
            readonly property var button: QtObject {
                readonly property real margin: 4
                readonly property real iconSize: 16
            }
        }
        readonly property var systemTray: QtObject {
            readonly property real radius: 100
            readonly property real size: 40
            readonly property var button: QtObject {
                readonly property real margin: 4
                readonly property real iconSize: 20
            }
        }
    }

    readonly property var drawers: QtObject {
    }

    readonly property var fonts: QtObject {
        readonly property var icons: FontLoader {
            source: Qt.resolvedUrl("../assets/fonts/MingCute.ttf")
        }
    }
}
