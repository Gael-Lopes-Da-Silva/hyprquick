import QtQuick

import qs.configs

Text {
    property alias icon: root.text
    property alias size: root.font.pointSize

    id: root
    font.family: Config.fonts.icons.font.family
    font.weight: Config.fonts.icons.font.weight
    font.styleName: Config.fonts.icons.font.styleName
}
