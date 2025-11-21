pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
    id: root

    property var options: QtObject {
        // property var overview: QtObject {
        //     property int rows: 2
        //     property int columns: 5
        //     property real scale: 0.16
        //     property bool enable: true
        // }

        // property var hacks: QtObject {
        //     property int arbitraryRaceConditionDelay: 150
        // }
    }
}
