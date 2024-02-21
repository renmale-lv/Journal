import QtQuick
import Base
import QtQuick.Controls
import Mysql

Item {
    id: container
    height: 1000
    property int tasknum: task_model.count
    ListModel {
        id: task_model
    }
    ListView {
        id: task_view
        boundsBehavior: Flickable.StopAtBounds
        anchors.fill: parent
        model: task_model
        delegate: J_TaskItem{
            width: task_view.width
            task: model.data
        }
    }
    Component.onCompleted: {
        var data = Mysql.getTodayTask();
        for(var i=0;i<data.length;i++){
            task_model.append({"data":data[i]});
        }
        console.log(data)
    }
}
