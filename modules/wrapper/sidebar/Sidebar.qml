import QtQuick
import Quickshell

import "../../../configs"

Rectangle {
    color: "red"
    implicitWidth: Config.options.sidebar.implicitWidth

    anchors {
        top: parent.top
        left: parent.left
        bottom: parent.bottom

        topMargin: Config.options.wrapper.implicitSize
        bottomMargin: Config.options.wrapper.implicitSize
    }
}
