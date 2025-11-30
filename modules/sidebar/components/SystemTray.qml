import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import qs.configs
import qs.components
import qs.services

Loader {
    required property var screen

    id: root
    active: true
    visible: true
    sourceComponent: ColumnLayout {
        Rectangle {
            radius: Config.general.sidebar.systemTray.radius
            color: Config.appearance.sidebar.systemTray.background

            Layout.alignment: Qt.AlignCenter
            Layout.preferredHeight: systemTrayColumn.height
            Layout.preferredWidth: Config.general.sidebar.systemTray.size

            ColumnLayout {
                id: systemTrayColumn
                spacing: 0

                Repeater {
                    model: SystemTray.items

                    Item {
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredHeight: Config.general.sidebar.systemTray.size
                        Layout.preferredWidth: Config.general.sidebar.systemTray.size

                        Rectangle {
                            color: "transparent"
                            radius: Config.general.sidebar.systemTray.radius

                            anchors {
                                fill: parent
                                margins: Config.general.sidebar.systemTray.button.margin
                            }

                            IconImage {
                                implicitWidth: Config.general.sidebar.systemTray.button.iconSize
                                implicitHeight: Config.general.sidebar.systemTray.button.iconSize
                                source: {
                                    if (modelData.icon.includes("?path=")) {
                                        const [name, path] = modelData.icon.split("?path=");
                                        return Qt.resolvedUrl(`${path}/${name.slice(name.lastIndexOf("/") + 1)}`);
                                    }

                                    return modelData.icon;
                                }

                                anchors {
                                    centerIn: parent
                                    alignWhenCentered: false
                                }
                            }

                            MouseArea {
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                acceptedButtons: Qt.LeftButton | Qt.RightButton

                                anchors {
                                    fill: parent
                                }

                                onEntered: parent.color = Config.appearance.sidebar.systemTray.button.hovered
                                onExited: parent.color = "transparent"
                                onClicked: (event) => {
                                    if (event.button === Qt.LeftButton) {
                                        modelData.activate();
                                    } else {
                                        modelData.secondaryActivate();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
