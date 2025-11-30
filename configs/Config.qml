pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

import qs.services

Singleton {
    id: root

    property var data: JSON.parse(jsonConfig.text())
    property var general: data.general
    property var appearance: data.appearance

    FileView {
        id: jsonConfig
        path: Qt.resolvedUrl("../shell.json")
        watchChanges: true
        blockLoading: true

        onFileChanged: reload()
    }
}
