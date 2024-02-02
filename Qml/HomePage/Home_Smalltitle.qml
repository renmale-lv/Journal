import QtQuick
import QtQuick.Layouts

Rectangle{
    property string text;
    property int fontSize: 15
    id: root
    radius: 4
    height: 40
    color: "#edf3ec"
    Text{
        anchors{
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        text: root.text
        font{
            family: "Courier New"
            pixelSize: root.fontSize
        }
    }
}
