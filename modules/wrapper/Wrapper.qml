import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.configs
import qs.services
import qs.modules.sidebar

Loader {
    id: root
    active: GlobalStates.showWrapper && !Hyprland.focusedMonitor.activeWorkspace.hasFullscreen
    visible: GlobalStates.showWrapper && !Hyprland.focusedMonitor.activeWorkspace.hasFullscreen
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            id: wrapper

            required property var modelData

            Exclusions {
                screen: wrapper.modelData
            }

            PanelWindow {
                screen: wrapper.modelData
                color: "transparent"

                WlrLayershell.namespace: GlobalDatas.appId + "_wrapper"
                WlrLayershell.exclusionMode: ExclusionMode.Ignore

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                mask: Region {
                    x: 0
                    y: 0
                    width: wrapper.modelData.width
                    height: wrapper.modelData.height
                    intersection: Intersection.Xor

                    regions: [
                        Region {
                            item: GlobalStates.showSidebar ? sidebar : null
                            intersection: Intersection.Xor
                        }
                    ]
                }

                Item {
                    layer.enabled: true
                    layer.effect: MultiEffect {
                        shadowEnabled: Config.wrapper.shadow.enabled
                        blurMax: Config.wrapper.shadow.maxBlur
                    }

                    anchors {
                        fill: parent
                    }

                    Rectangle {
                        color: Appearance.wrapper.background
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
                        radius: Config.wrapper.radius

                        anchors {
                            fill: parent
                            margins: Config.wrapper.implicitSize
                            leftMargin: GlobalStates.showSidebar ? Config.sidebar.implicitSize : Config.wrapper.implicitSize
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
        }
    }
}
