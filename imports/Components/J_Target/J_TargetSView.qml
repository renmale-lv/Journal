import QtQuick
import Base

Item {
    height: 300
    J_Tabview{
        anchors.fill: parent
        id: tab_nav
    }
    Component.onCompleted: {
        tab_nav.appendTab("未开始", com_page)
    }
    Component{
        id: com_page
        J_TargetList{}
    }
}
