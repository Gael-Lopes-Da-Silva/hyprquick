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
        readonly property var workspaces: QtObject {
            readonly property color background: "#2a2a2a"

            readonly property var icons: QtObject {
                readonly property color background: "#3a3a3a"
                readonly property color color: "#ffffff"
            }
        }
    }
}
