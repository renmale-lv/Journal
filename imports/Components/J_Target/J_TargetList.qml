import QtQuick
import Mysql
import Base
import QtQuick.Controls

Item {
    id:root
    property int numeachcolumn: Math.floor(width/200)
    property int columnnum: Math.ceil(target_model.count/numeachcolumn)
    property int mode: 0


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
        var data
        if(mode===0){
            data = Mysql.getNotStartTarget();
        }else if(mode===1){
            data = Mysql.getOnGoingTarget();
        }

        for(var i=0;i<data.length;i++){
            target_model.append({"data":data[i]});
        }
    }
}
