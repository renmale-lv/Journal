import QtQuick
import Base
import QtQuick.Controls
import Mysql

Item {
    id: container
    ListModel {
        id: task_model
    }
    ListView {
        id: task_view
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
        model: task_model
        delegate: Item {
            width: task_view.width
            height: 30
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
                    text: model.name
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
                    text: model.date
                }
                CheckBox {
                    id: task_complete
                    height: parent.height
                    checked: true
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                    }
                }
                onEntered: {
                    task_background.color = "#efefef"
                }
                onExited: {
                    task_background.color = "#ffffff"
                }
            }
        }
    }
    Component.onCompleted: {
        var data = Mysql.getTodayTask();
        for(var i=0;i<data.length;i++){
            task_model.append({"name":data[i].name,"date":data[i].startTime});
        }
    }
}
