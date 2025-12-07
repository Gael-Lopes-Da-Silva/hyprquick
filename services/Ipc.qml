pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

import qs.components.ipc

import "ipc" as Ipc

Singleton {
    id: root

    property var compositor: Compositor {
        readonly property string data: Quickshell.env("XDG_CURRENT_DESKTOP")

        name: data
        supported: ["Hyprland", "Niri"].includes(data)
    }

    Component.onCompleted: {
        switch (compositor.name) {
            case "Hyprland":
                Ipc.Hyprland.initialize();
                break;

            case "Niri":
                Ipc.Niri.initialize();
                break;
        }
    }
}

