import QtQuick
import Target
import Base

Item {
    id: root;
    property Target target
    height: 250
//    width: 200

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        Rectangle{
            id: target_background
            anchors.fill: parent
            color: "#ffffff"
            radius: 5
            border.color: "#d6d6d6"
            border.width: 1
        }
        Column{
            anchors{
                fill: parent
                topMargin: 7
                leftMargin: 7
                rightMargin: 7
            }

            Item{
                height: childrenRect.height
                width: parent.width
                J_Icon{
                    id: target_icon
                    anchors.left: parent.left
                    iconName: "\ueaf1"
                }
                J_Text{
                    anchors{
                        left: target_icon.right
                        right: parent.right
                        leftMargin: 5
                        top: target_icon.top
                        topMargin: 2
                    }
                    text: target.name
                }
            }
        }
        onEntered: {
            target_background.color = "#efefef"
        }
        onExited: {
            target_background.color = "#ffffff"
        }
    }
}
