import QtQuick
import Quickshell

import qs.configs

Text {
    property alias icon: root.text
    property alias size: root.font.pointSize

    id: root
    font.family: iconFont.font.family
    font.weight: iconFont.font.weight
    font.styleName: iconFont.font.styleName

    FontLoader {
        id: iconFont
        source: Quickshell.shellDir + "/" + Config.general.fonts.icons.path
    }
}
