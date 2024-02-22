import QtQuick
import QtQuick.Controls
import Base


Item{
//    implicitHeight: tab_nav.height
    height: 200
    J_Tabview{
        anchors.fill: parent
        id: tab_nav
    }
    Component.onCompleted: {
        tab_nav.appendTab("今天任务", com_page)
//        tab_nav.appendTab("测试测试测试测试", com_page)
    }
    Component{
        id: com_page
        J_TaskList{
        }
    }
}
