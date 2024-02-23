import QtQuick
import Base

Item {
    id:root
    height: tab_nav.height
    J_Tabview{
        anchors.fill: parent
        id: tab_nav
    }
    Component.onCompleted: {
        tab_nav.appendTab("未开始", com_page)
        tab_nav.appendTab("未开始", com_page)
    }
    Component{
        id: com_page
        J_TargetList{
            //希望找到更常规地方式来改变Tabview地大小
            onVisibleChanged: {
                if(visible===true){
                    root.height=44+columnnum*260-10
//                    console.log(root.height)
                }
            }
            onColumnnumChanged: {
                if(visible===true){
                    root.height=44+columnnum*260-10
//                    console.log(root.height)
                }
            }
        }
    }
}
