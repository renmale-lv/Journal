import QtQuick

Rectangle{
    id: root
    property string text;
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
        }
    }
}