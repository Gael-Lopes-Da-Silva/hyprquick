import QtQuick
import QtQuick.Shapes
import Quickshell

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: Shape {
        preferredRendererType: Shape.CurveRenderer

        ShapePath {}
    }
}
