import QtQuick
import Base
import Goal

Item {
    id: root
    height: 330
    property Goal goal
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        Rectangle{
            id: goal_background
            anchors.fill: parent
            color: "#ffffff"
            radius: 5
            border.color: "#d6d6d6"
            border.width: 1
        }
        onEntered: {
            goal_background.color = "#efefef"
        }
        onExited: {
            goal_background.color = "#ffffff"
        }
    }
}
