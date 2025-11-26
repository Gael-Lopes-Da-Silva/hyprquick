import QtQuick
import QtQuick.Layouts
import Quickshell

Item {
    required property var screen

    id: root

    ColumnLayout {
        spacing: 4

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        Workspaces {
            screen: root.screen

            Layout.alignment: Qt.AlignCenter
        }
    }
}
