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
        tab_nav.appendTab("计划", com_page_1)
        tab_nav.appendTab("进行中", com_page_2)
    }
    Component{
        id: com_page_1
        J_TargetList{
            mode: 0
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
    Component{
        id: com_page_2
        J_TargetList{
            mode: 1
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
