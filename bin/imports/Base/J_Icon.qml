import QtQuick
import QtQuick.Controls

Text{
    property string iconName
    property int iconSize: 20
    property color iconColor: "#000000"
    id: control
    font.family: "iconfont"
    font.pixelSize: iconSize
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: iconColor
    text: iconName
    FontLoader{
        source: "Resource/Font/iconfont.ttf"
    }
}
