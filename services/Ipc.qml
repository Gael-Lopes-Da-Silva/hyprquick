pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

import qs.configs
import qs.components.ipc

import "ipc" as Ipc

Singleton {
    id: root

    property var compositor: Compositor {
        name: Config.general.compositor
        supported: ["hyprland", "niri"].includes(Config.general.compositor)
    }

    Component.onCompleted: {
        switch (compositor.name) {
            case "hyprland": {
                Ipc.Hyprland.initialize();
                break;
            }

            case "niri": {
                Ipc.Niri.initialize();
                break;
            }
        }
    }
}

