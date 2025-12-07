import QtQuick
import Quickshell

QtObject {
    property int workspaceId: 0
    property bool fullscreen: false
    property bool active: false
    property bool special: false
    property string name: ""
    property list<Surface> surfaces: []
    property Surface surface: null
}
