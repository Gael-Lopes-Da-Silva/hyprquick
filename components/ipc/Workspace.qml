import QtQuick
import Quickshell

QtObject {
    property string workspaceId: ""
    property bool fullscreen: false
    property bool active: false
    property bool urgent: false
    property bool special: false
    property string name: ""
    property list<Surface> surfaces: []
    property Surface surface: null
    property string activeSurfaceId: ""
    property int surfaceCount: 0
}
