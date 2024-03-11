import QtQuick
import Base
import Task
import QtQuick.Controls
import GlobalSignals

//不要使用data。。。。
Item{
    id: root
    property Task task


    height: 30;

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        Rectangle {
            id: task_background
            anchors.fill: parent
            color: "#ffffff"
            radius: 5
        }
        J_Text {
            id: task_name
            height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                leftMargin: 15
            }
            text: task.name
        }
        J_Text {
            id: task_date
            height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: task_complete.left
                rightMargin: 5
            }
            text: task.Time
            font.pixelSize: 12
        }
        Rectangle {
            id: task_complete
            height: 20
            width: 50
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 7
            }
            radius: height/2
            color: {
                if (task.status===0){
                    return "#e3e2e0"
                }else if(task.status===1){
                    return "green"
                }else{
                    return "red"
                }
            }
            J_Text{
                anchors.centerIn: parent
                text: {
                    if (task.status===0){
                        return "未完成"
                    }else if(task.status===1){
                        return "完成"
                    }else{
                        return "超时"
                    }
                }
                font.pixelSize: 12
            }
        }

        onEntered: {
            task_background.color = "#efefef"
        }
        onExited: {
            task_background.color = "#ffffff"
        }
        onClicked: {
            GlobalSignals.editTask(task)
        }
    }
}
