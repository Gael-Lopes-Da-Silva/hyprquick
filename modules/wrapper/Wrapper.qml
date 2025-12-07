import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services
import qs.modules.sidebar

Loader {
    id: root
    active: States.showWrapper && !Ipc.compositor.monitor?.workspace?.fullscreen
    visible: States.showWrapper && !Ipc.compositor.monitor?.workspace?.fullscreen
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            required property var modelData

            id: wrapper

            PanelWindow {
                screen: wrapper.modelData
                color: "transparent"

                WlrLayershell.namespace: Globals.appId + "_wrapper"
                WlrLayershell.exclusionMode: ExclusionMode.Ignore

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                mask: Region {
                    item: mask
                    intersection: Intersection.Xor

                    regions: [
                        Region {
                            item: States.showSidebar ? sidebar : null
                            intersection: Intersection.Xor
                        }
                    ]
                }

                Item {
                    layer.enabled: true
                    layer.effect: MultiEffect {
                        shadowEnabled: Config.general.wrapper.shadow.enabled
                        blurMax: Config.general.wrapper.shadow.maxBlur
                    }

                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        color: Config.appearance.wrapper.background
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            maskSource: mask
                            maskEnabled: true
                            maskInverted: true
                            maskThresholdMin: 0.5
                            maskSpreadAtMin: 1
                        }

                        anchors {
                            fill: parent
                        }
                    }
                }

                Item {
                    id: mask
                    visible: false
                    layer.enabled: true

                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        radius: Config.general.wrapper.radius

                        anchors {
                            fill: parent
                            margins: Config.general.wrapper.implicitSize
                            leftMargin: States.showSidebar ? Config.general.sidebar.implicitSize : Config.general.wrapper.implicitSize
                        }
                    }
                }

                Sidebar {
                    id: sidebar
                    screen: wrapper.modelData

                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }
                }

                Backgrounds {
                    screen: wrapper.modelData

                    anchors {
                        fill: parent
                    }
                }
            }

            Exclusions {
                screen: wrapper.modelData
            }
        }
    }
}
