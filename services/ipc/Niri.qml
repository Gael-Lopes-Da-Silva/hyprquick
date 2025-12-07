pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

import qs.services.ipc

Singleton {
    id: root

    Socket {
        id: events
        connected: true
        path: Quickshell.env("NIRI_SOCKET")
        parser: SplitParser {
            onRead: (data) => {
                // console.log(data);
            }
        }

        onConnectedChanged: {
            if (this.connected) {
                write("\"EventStream\"\n");
                flush();
            }
        }
    }
}

