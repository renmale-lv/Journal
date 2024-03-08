import QtQuick
import Base
import QtQuick.Controls
import Mysql

Item {
    id: root
    property int tasknum: task_model.count
    ListModel {
        id: task_model
    }
    ListView {
        id: task_view
        boundsBehavior: Flickable.StopAtBounds
        anchors{
            top: parent.top
            bottom: task_new_button.top
            left: parent.left
            right: parent.right
        }

        model: task_model
        spacing: 5
        delegate: J_TaskItem{
            width: task_view.width
            task: model.data
        }
    }
    Button{
        id: task_new_button
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 30
        J_Text{
            text: "+ NEW"
            anchors.centerIn: parent
        }
        onClicked: {
            Mysql.addTask()
            updateTask()
            update()
        }
    }

    Component.onCompleted: {
        updateTask()
    }

    function updateTask(){
        task_model.clear()
        var data = Mysql.getTodayTask()
        for(var i=0;i<data.length;i++){
            task_model.append({"data":data[i]})
        }
    }
}
