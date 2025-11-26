import QtQuick
import Quickshell
import Quickshell.Wayland

import "sidebar"
import "../../configs"
import "../../components"
import "../../services"

Variants {
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

            Rectangle {
                id: mask
                color: "transparent"

                anchors {
                    fill: parent
                    topMargin: Config.wrapper.implicitSize
                    leftMargin: GlobalDatas.showSidebar ? Config.sidebar.implicitWidth : Config.wrapper.implicitSize
                    rightMargin: Config.wrapper.implicitSize
                    bottomMargin: Config.wrapper.implicitSize
                }
            }

            Loader {
                active: true

                anchors {
                    fill: parent
                }

                Backgrounds {
                    screen: root.modelData

                    anchors {
                        fill: parent
                    }
                }
            }


            Loader {
                active: GlobalStates.showSidebar

                anchors {
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom

                    topMargin: Config.wrapper.implicitSize
                    bottomMargin: Config.wrapper.implicitSize
                }

                sourceComponent: Sidebar {
                    screen: root.modelData
                    implicitWidth: Config.sidebar.implicitWidth

                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                    }
                }
            }
        }
    }
}
