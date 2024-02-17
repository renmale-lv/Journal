import QtQuick
import QtQuick.Controls
import QtQml.Models
import Mysql
import Base


Item{
    height: 1000
    J_Tabview{
        anchors.fill: parent
        id: tab_view
    }
    Component.onCompleted: {
        tab_view.appendTab("测试1", com_page)
        tab_view.appendTab("测试测试测试测试", com_page)
    }
    Component{
        id: com_page
        J_Tasklist{}
    }
}
