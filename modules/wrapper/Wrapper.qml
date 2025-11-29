import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

Loader {
    active: GlobalStates.showWrapper
    visible: GlobalStates.showWrapper
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            id: root

            required property var modelData

            Exclusions {
                screen: root.modelData
            }

            PanelWindow {
                screen: root.modelData
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
                    item: mask
                    intersection: Intersection.Xor
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

                    Loader {
                        active: true
                        visible: true
                        sourceComponent: Backgrounds {
                            screen: root.modelData

                            anchors {
                                fill: parent
                            }
                        }
                    }
                }
            }
        }
    }
}
