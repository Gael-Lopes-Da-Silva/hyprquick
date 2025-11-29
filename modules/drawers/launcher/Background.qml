import QtQuick
import QtQuick.Shapes
import Quickshell

Shape {
    required property var screen

    id: root
    preferredRendererType: Shape.CurveRenderer

    ShapePath {}
}
