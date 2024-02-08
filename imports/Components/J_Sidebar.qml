import QtQuick
import QtQuick.Controls

Item {
    visible: true
    width: 240

    Rectangle {
        anchors.fill: parent
        color: "#f7f7f5"
    }

    Behavior on x{
        NumberAnimation {duration: 200}
    }
}