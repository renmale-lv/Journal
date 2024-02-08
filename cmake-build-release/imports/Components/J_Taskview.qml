import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Base

Item{
    height: 1000
    J_Tabview{
        anchors.fill: parent
        id: tab_view
    }
    Component.onCompleted: {
        tab_view.appendTab("测试1")
        tab_view.appendTab("测试测试测试测试")
    }
}
