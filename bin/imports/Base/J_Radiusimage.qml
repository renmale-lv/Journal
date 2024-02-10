import QtQuick
import Qt5Compat.GraphicalEffects

Item{
    id: root
    property string imgsrc
    property int radius
    Rectangle{
        id: mask
        anchors.fill: parent
        radius: root.radius
        visible: false
    }
    Image{
        id: image
        visible: false
        anchors.fill: parent
        source: root.imgsrc
        smooth: true
    }
    OpacityMask{
        anchors.fill: image
        source: image
        maskSource: mask
        visible: true
    }
}