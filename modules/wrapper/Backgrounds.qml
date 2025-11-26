import QtQuick
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell

import "../../configs"
import "../../services"

Item {
    required property var screen

    id: root

    Shape {
        id: background
        visible: false
        preferredRendererType: Shape.CurveRenderer

        anchors {
            fill: parent
        }

        ShapePath {
            strokeColor: "transparent"
            fillColor: Appearance.wrapper.background
            fillRule: ShapePath.OddEvenFill

            startX: 0
            startY: 0

            PathLine { x: screen.width; y: 0 }
            PathLine { x: screen.width; y: screen.height }
            PathLine { x: 0; y: screen.height }
            PathLine { x: 0; y: 0 }

            PathMove {
                x: GlobalStates.showSidebar ? Config.sidebar.implicitWidth : Config.wrapper.implicitSize
                y: Config.wrapper.implicitSize
            }

            PathLine { x: screen.width - Config.wrapper.implicitSize; y: Config.wrapper.implicitSize }
            PathLine { x: screen.width - Config.wrapper.implicitSize; y: screen.height - Config.wrapper.implicitSize }
            PathLine { x: GlobalStates.showSidebar ? Config.sidebar.implicitWidth : Config.wrapper.implicitSize; y: screen.height - Config.wrapper.implicitSize }
            PathLine { x: GlobalStates.showSidebar ? Config.sidebar.implicitWidth : Config.wrapper.implicitSize; y: Config.wrapper.implicitSize }
        }
    }

    MultiEffect {
        source: background
        shadowEnabled: true

        anchors {
            fill: parent
        }
    }
}
