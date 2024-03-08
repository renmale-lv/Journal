import QtQuick
import Target
import Base

Item {
    id: root;
    property Target target
    height: 250

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
                leftMargin: 10
                rightMargin: 7
            }
            spacing: 7
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
            Rectangle{
                id: target_status
                width: 60
                height: 20
                radius: height/2
                color: {
                    if (target.status===0){
                        return "#e3e2e0"
                    }else if(target.status===1){
                        return "#d3e5ef"
                    }else{
                        return "#dbeddb"
                    }
                }
                J_Text{
                    anchors.centerIn: parent
                    text: {
                        if (target.status===0){
                            return "计划"
                        }else if(target.status===1){
                            return "进行中"
                        }else{
                            return "完成"
                        }
                    }
                    font.pixelSize: 12
                }
            }
            Rectangle{
                height: 16
                width: 40
                color: "#d3e5ef"
                radius: 4
                J_Text{
                    anchors.centerIn: parent
                    text: "年目标"
                    font.pixelSize: 10
                    color: "#3e85ae"
                    font.bold: true
                }
            }
            Rectangle{
                height: 16
                width: 50
                color: "#fdebec"
                radius: 4
                J_Text{
                    anchors.centerIn: parent
                    text: "截止日期"
                    font.pixelSize: 10
                    color: "#d44c47"
                    font.bold: true
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
