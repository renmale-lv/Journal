import QtQuick
import Mysql
import Base
import QtQuick.Controls

Item {
    id:root
    property int numeachcolumn: Math.floor(width/200)
    property int columnnum: Math.ceil(target_model.count/numeachcolumn)


    ListModel{
        id: target_model
    }
    Flow{
        id: target_view
        anchors.fill: parent
        spacing: 10
        height: childrenRect.height
        Repeater{
            model: target_model
            delegate: J_TargetItem{
                width: Math.floor((target_view.width-(numeachcolumn-1)*target_view.spacing)/numeachcolumn)
                target: model.data
            }
        }
    }


    Component.onCompleted: {
        var data = Mysql.getNotStartTarget();
        for(var i=0;i<data.length;i++){
            target_model.append({"data":data[i]});
        }
    }
}
