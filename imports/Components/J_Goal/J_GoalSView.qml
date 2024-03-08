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
        tab_nav.appendTab("计划", com_page)
    }
    Component{
        id: com_page
        J_GoalList{
            onVisibleChanged: {
                if(visible===true){
                    root.height=44+columnnum*260-10
                }
            }
            onColumnnumChanged: {
                if(visible===true){
                    root.height=44+columnnum*260-10
                }
            }
        }
    }
}
