import QtQuick
import Quickshell

QtObject {
    property string name: ""
    property bool supported: false
    property list<Monitor> monitors: []
    property Monitor monitor: null
    property int monitorCount: 0
}
