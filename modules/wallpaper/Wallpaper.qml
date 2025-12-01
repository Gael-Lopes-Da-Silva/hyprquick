import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.configs
import qs.services

Loader {
    id: root
    active: !Globals.isFullscreen
    visible: !Globals.isFullscreen
    sourceComponent: Variants {
        model: Quickshell.screens

        Scope {
            required property var modelData

            id: wallpaper

            PanelWindow {
                screen: wallpaper.modelData
                color: "transparent"

                WlrLayershell.namespace: Globals.appId + "_wallpaper"
                WlrLayershell.exclusionMode: ExclusionMode.Ignore
                WlrLayershell.layer: WlrLayer.Background

                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                Loader {
                    active: !Config.general.wallpaper.animated
                    visible: !Config.general.wallpaper.animated
                    sourceComponent: Image {
                        asynchronous: true
                        source: Quickshell.shellDir + "/" + Config.general.wallpaper.path
                        fillMode: Image.PreserveAspectCrop
                    }

                    anchors {
                        fill: parent
                    }
                }

                Loader {
                    active: Config.general.wallpaper.animated
                    visible: Config.general.wallpaper.animated
                    sourceComponent: AnimatedImage {
                        asynchronous: true
                        source: Quickshell.shellDir + "/" + Config.general.wallpaper.path
                        fillMode: Image.PreserveAspectCrop
                    }

                    anchors {
                        fill: parent
                    }
                }
            }
        }
    }
}
