import QtQuick

import "../configs"

Text {
    required property string icon

    property real size: Config.sizes.normal

    text: icon
    font.family: Config.fonts.icons.font.family
    font.weight: Config.fonts.icons.font.weight
    font.styleName: Config.fonts.icons.font.styleName
    font.pointSize: size
}
