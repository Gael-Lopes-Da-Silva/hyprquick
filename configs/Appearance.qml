pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property var wrapper: QtObject {
        readonly property color background: "#1a1a1a"
    }

    readonly property var sidebar: QtObject {
        readonly property var power: QtObject {
            readonly property color background: "#2a2a2a"
            readonly property var button: QtObject {
                readonly property color hovered: "#3a3a3a"
                readonly property color color: "#ffffff"
            }
        }
        readonly property var workspaces: QtObject {
            readonly property var windowCount: QtObject {
                readonly property color background: "#2a2a2a"
                readonly property color color: "#ffffff"
            }
            readonly property var indicators: QtObject {
                readonly property color background: "#2a2a2a"
                readonly property var indicator: QtObject {
                    readonly property color background: "transparent"
                    readonly property color urgent: "#6a3a3a"
                    readonly property color specialSelected: "#4a4a4a"
                    readonly property color selected: "#3a3a3a"
                    readonly property color specialColor: "#ffffff"
                    readonly property color color: "#ffffff"
                }
            }
        }
        readonly property var clock: QtObject {
            readonly property color background: "#2a2a2a"
            readonly property var button: QtObject {
                readonly property color hovered: "#3a3a3a"
                readonly property color iconColor: "#ffffff"
                readonly property color color: "#ffffff"
            }
        }
        readonly property var status: QtObject {
            readonly property color background: "#2a2a2a"
            readonly property var button: QtObject {
                readonly property color hovered: "#3a3a3a"
                readonly property color color: "#ffffff"
            }
        }
        readonly property var systemTray: QtObject {
            readonly property color background: "#2a2a2a"
            readonly property var button: QtObject {
                readonly property color hovered: "#3a3a3a"
            }
        }
    }
}
