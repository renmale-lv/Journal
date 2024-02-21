import QtQuick
import QtQuick.Controls
import QtQml.Models
import Mysql
import Base


Item{
    implicitHeight: tab_nav.height
    J_Tabview{
        anchors.fill: parent
        id: tab_nav
    }
    Component.onCompleted: {
        tab_nav.appendTab("测试1", com_page)
//        tab_nav.appendTab("测试测试测试测试", com_page)
    }
    Component{
        id: com_page
        J_TaskList{
        }
    }
}
