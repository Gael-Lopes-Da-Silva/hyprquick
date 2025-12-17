import QtQuick
import Quickshell

QtObject {
    property string workspaceId: ""
    property string name: ""
    property bool fullscreen: false
    property bool active: false
    property bool urgent: false
    property bool special: false
    property string activeSurfaceId: ""
    property list<Surface> surfaces: []
    property Surface surface: null
    property int surfaceCount: 0
}
