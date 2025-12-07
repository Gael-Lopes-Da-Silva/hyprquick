pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

import qs.services
import qs.components.ipc

Singleton {
    id: root

    function initialize() {
        let monitorsRequest = (monitorsCommand, monitorsData) => {
            if (monitorsCommand !== "j/monitors") return;

            requests.finished.disconnect(monitorsRequest);

            Ipc.compositor.monitors = monitorsData.map(m => monitorFactory.createObject(null, {
                monitorId: m.id,
                width: m.width,
                height: m.height,
                scale: m.scale,
                active: m.focused
            }));
            Ipc.compositor.monitor = Ipc.compositor.monitors.find(m => m.active) || null;

            let workspacesRequest = (workspacesCommand, workspacesData) => {
                if (workspacesCommand !== "j/workspaces") return;

                requests.finished.disconnect(workspacesRequest);

                Ipc.compositor.monitors.forEach(m => {
                    m.workspaces = workspacesData
                        .filter(w => w.monitorID === m.monitorId)
                        .map(w => workspaceFactory.createObject(null, {
                            workspaceId: w.id,
                            name: w.name,
                            special: w.name === "special:magic",
                            fullscreen: w.hasfullscreen,
                            active: monitorsData.find(md => md.id === m.monitorId && md.activeWorkspace.id === w.id) !== undefined
                        }));
                    m.workspace = m.workspaces.find(w => w.active) || null;
                });

                let surfacesRequest = (surfacesCommand, surfacesData) => {
                    if (surfacesCommand !== "j/clients") return;

                    requests.finished.disconnect(surfacesRequest)

                    Ipc.compositor.monitors.forEach(m => {
                        m.workspaces.forEach(w => {
                            w.surfaces = surfacesData
                                .filter(s => s.workspace.id === w.workspaceId)
                                .map(s => surfaceFactory.createObject(null, {
                                    surfaceId: s.address,
                                    title: s.title,
                                    fullscreen: s.fullscreen === 1,
                                    active: workspacesData.find(wd => wd.id === w.workspaceId && wd.lastwindow === s.address) !== undefined
                                }));
                            w.surface = w.surfaces.find(s => s.active) || null;
                        });
                    });
                }

                requests.request("j/clients");
                requests.finished.connect(surfacesRequest);
            }

            requests.request("j/workspaces");
            requests.finished.connect(workspacesRequest);
        }

        requests.request("j/monitors");
        requests.finished.connect(monitorsRequest);

        events.connected = true;
    }

    Socket {
        signal eventReceived(string name, string data)

        id: events
        connected: false
        path: Quickshell.env("XDG_RUNTIME_DIR") + "/hypr/" + Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE") + "/.socket2.sock"
        parser: SplitParser {
            onRead: (line) => {
                if (!line || line.length === 0) return;

                const chuncks = line.split(">>");
                const name = chuncks.length > 0 ? chuncks[0] : "";
                const data = chuncks.length > 1 ? chuncks[1] : "";

                events.eventReceived(name, data);
            }
        }

        onEventReceived: (name, data) => {
            switch (name) {
                case "workspacev2":
                    let id = data.split(",")[0] ?? "";

                    let workspacesRequest = (workspacesCommand, workspacesData) => {
                        if (workspacesCommand !== "j/workspaces") return;

                        requests.finished.disconnect(workspacesRequest);

                        Ipc.compositor.monitors.forEach(m => {
                            m.workspaces = workspacesData
                                .filter(w => w.monitorID === m.monitorId)
                                .map(w => workspaceFactory.createObject(null, {
                                    workspaceId: w.id,
                                    name: w.name,
                                    special: w.name === "special:magic",
                                    fullscreen: w.hasfullscreen,
                                    active: w.id === parseInt(id)
                                }));
                            m.workspace = m.workspaces.find(w => w.active) || null;
                        });

                        let surfacesRequest = (surfacesCommand, surfacesData) => {
                            if (surfacesCommand !== "j/clients") return;

                            requests.finished.disconnect(surfacesRequest)

                            Ipc.compositor.monitors.forEach(m => {
                                m.workspaces.forEach(w => {
                                    w.surfaces = surfacesData
                                        .filter(s => s.workspace.id === w.workspaceId)
                                        .map(s => surfaceFactory.createObject(null, {
                                            surfaceId: s.address,
                                            title: s.title,
                                            fullscreen: s.fullscreen === 1,
                                            active: workspacesData.find(wd => wd.id === w.workspaceId && wd.lastwindow === s.address) !== undefined
                                        }));
                                    w.surface = w.surfaces.find(s => s.active) || null;
                                });
                            });
                        }

                        requests.request("j/clients");
                        requests.finished.connect(surfacesRequest);
                    }

                    requests.request("j/workspaces");
                    requests.finished.connect(workspacesRequest);
                    break;

                case "monitoraddedv2":
                    break;

                case "monitorremovedv2":
                    break;
            }
        }
    }

    Socket {
        property string command: ""
        property string output: ""

        signal finished(string command, var result)

        id: requests
        connected: false
        path: Quickshell.env("XDG_RUNTIME_DIR") + "/hypr/" + Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE") + "/.socket.sock"
        parser: SplitParser {
            splitMarker: ""
            onRead: (data) => {
                requests.output += data;
            }
        }

        onConnectedChanged: if (connected) {
            write(command);
            flush();
        } else {
            let data = null;

            try {
                data = JSON.parse(output)
            } catch (error) {}

            finished(command, data);
        }

        function request(request: string) {
            output = "";
            command = request;
            connected = true;
        }
    }

    Component {
        id: monitorFactory

        Monitor {}
    }

    Component {
        id: workspaceFactory

        Workspace {}
    }

    Component {
        id: surfaceFactory

        Surface {}
    }
}

