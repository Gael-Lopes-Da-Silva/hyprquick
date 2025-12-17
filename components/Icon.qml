import QtQuick
import Quickshell

import qs.configs
import qs.services

Text {
    property alias icon: root.text
    property alias size: root.font.pointSize

    id: root
    font.family: Globals.iconsFont.font.family
    font.weight: Globals.iconsFont.font.weight
    font.styleName: Globals.iconsFont.font.styleName
}
