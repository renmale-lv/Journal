import QtQuick
import Mysql
import Base
import QtQuick.Controls

Item {
    id:root
    property int numeachcolumn: Math.floor(width/320)
    property int columnnum: Math.ceil(goal_model.count/numeachcolumn)


    ListModel{
        id: goal_model
    }
    Flow{
        id: goal_view
        anchors.fill: parent
        spacing: 10
        height: childrenRect.height
        Repeater{
            model: goal_model
            delegate: J_GoalItem{
                width: Math.floor((goal_view.width-(numeachcolumn-1)*goal_view.spacing)/numeachcolumn)
                goal: model.data
            }
        }
    }


    Component.onCompleted: {
        var data = Mysql.getNotStartGoal();
        for(var i=0;i<data.length;i++){
            goal_model.append({"data":data[i]});
        }
    }
}
