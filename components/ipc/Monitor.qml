import QtQuick
import Quickshell

QtObject {
    property int monitorId: 0
    property int height: 0
    property int width: 0
    property real scale: 0
    property bool active: false
    property list<Workspace> workspaces: []
    property Workspace workspace: null
}
