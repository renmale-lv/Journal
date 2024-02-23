import QtQuick
import QtQuick.Controls
import Base


Item{
    id:root
    height: tab_nav.height
    J_Tabview{
        anchors.fill: parent
        id: tab_nav
    }
    Component.onCompleted: {
        tab_nav.appendTab("今天任务", com_page)
    }
    Component{
        id: com_page
        J_TaskList{
            onVisibleChanged: {
                if(visible===true){
                    root.height=44+tasknum*35-5
//                    console.log(root.height)
                }
            }
            onTasknumChanged: {
                if(visible===true){
                    root.height=44+tasknum*35-5
//                    console.log(root.height)
                }
            }
        }
    }
}
