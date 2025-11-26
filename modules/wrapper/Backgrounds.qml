import QtQuick
import QtQuick.Shapes
import Quickshell

import "../../configs"

Shape {
    required property var screen

    id: root
    preferredRendererType: Shape.CurveRenderer

    anchors {
        fill: parent
    }

    ShapePath {
        strokeColor: "transparent"
        fillColor: Config.options.wrapper.fillColor
        fillRule: ShapePath.OddEvenFill

        startX: 0
        startY: 0

        PathLine { x: screen.width; y: 0 }
        PathLine { x: screen.width; y: screen.height }
        PathLine { x: 0; y: screen.height }
        PathLine { x: 0; y: 0 }

        PathMove {
            x: Config.options.sidebar.implicitWidth
            y: Config.options.wrapper.implicitSize
        }

        PathLine { x: screen.width - Config.options.wrapper.implicitSize; y: Config.options.wrapper.implicitSize }
        PathLine { x: screen.width - Config.options.wrapper.implicitSize; y: screen.height - Config.options.wrapper.implicitSize }
        PathLine { x: Config.options.sidebar.implicitWidth; y: screen.height - Config.options.wrapper.implicitSize }
        PathLine { x: Config.options.sidebar.implicitWidth; y: Config.options.wrapper.implicitSize }
    }
}
