import QtQuick
import QtQuick.Shapes
import QtQuick.Effects
import Quickshell

import qs.configs
import qs.services

Item {
    required property var screen

    id: root
    layer.enabled: true
    layer.effect: MultiEffect {
        shadowEnabled: true
        blurMax: 15
    }

    Shape {
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

            PathMove {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) + Config.wrapper.radius
                y: Config.wrapper.implicitSize
            }
            PathArc {
                x: GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
                y: Config.wrapper.implicitSize + Config.wrapper.radius
                radiusX: Config.wrapper.radius
                radiusY: Config.wrapper.radius
                direction: PathArc.Counterclockwise
            }

            // Left

            PathLine {
                x: GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
                y: (screen.height - Config.wrapper.implicitSize) - Config.wrapper.radius
            }
            PathArc {
                x: (GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize) + Config.wrapper.radius
                y: screen.height - Config.wrapper.implicitSize
                radiusX: Config.wrapper.radius
                radiusY: Config.wrapper.radius
                direction: PathArc.Counterclockwise
            }

            // Bottom

            PathLine {
                x: (screen.width - Config.wrapper.implicitSize) - Config.wrapper.radius
                y: screen.height - Config.wrapper.implicitSize
            }
            PathArc {
                x: (screen.width - Config.wrapper.implicitSize)
                y: (screen.height - Config.wrapper.implicitSize) - Config.wrapper.radius
                radiusX: Config.wrapper.radius
                radiusY: Config.wrapper.radius
                direction: PathArc.Counterclockwise
            }

            // Right

            PathLine {
                x: screen.width - Config.wrapper.implicitSize
                y: Config.wrapper.implicitSize + Config.wrapper.radius
            }
            PathArc {
                x: (screen.width - Config.wrapper.implicitSize) - Config.wrapper.radius
                y: Config.wrapper.implicitSize
                radiusX: Config.wrapper.radius
                radiusY: Config.wrapper.radius
                direction: PathArc.Counterclockwise
            }

            // Top
        }
    }


}
