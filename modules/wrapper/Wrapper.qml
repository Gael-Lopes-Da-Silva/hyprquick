import QtQuick
import Quickshell
import Quickshell.Wayland

import "sidebar"
import "../../configs"
import "../../components"
import "../../components/containers"

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

            WlrLayershell.namespace: "hyprquick_wrapper"
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
                    topMargin: Config.options.wrapper.implicitSize
                    leftMargin: Config.options.sidebar.implicitWidth
                    rightMargin: Config.options.wrapper.implicitSize
                    bottomMargin: Config.options.wrapper.implicitSize
                }
            }

            Backgrounds {
                screen: root.modelData
            }

            Sidebar {}
        }
    }
}
