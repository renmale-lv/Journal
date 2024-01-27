import QtQuick
import QtQuick.Window

Rectangle{
    id: root
    property Flickable target: parent
    property int orientation: Qt.Vertical

    width: orientation == Qt.Vertical ? 4 : target.width
    height: orientation == Qt.Vertical ? target.height : 4
    color: Qt.rgba(0,0,0,0)
    radius: 2

    Rectangle{
        y: orientation == Qt.Vertical ? target.visibleArea.yPosition * target.height : 0
        x: orientation == Qt.Vertical ? 0 : target.visibleArea.xPosition * target.width
        width: orientation == Qt.Vertical ? parent.width : target.visibleArea.widthRatio * target.width
        height: orientation == Qt.Vertical ? target.visibleArea.heightRatio * target.height : parent.height
        color: "#8a8a8a"
        radius: root.radius
        opacity: 1
    }
}