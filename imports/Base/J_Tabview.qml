import QtQuick
import QtQml.Models
import QtQuick.Controls

//鼠标穿透真的恶心
Item {
    id: root
    property int index: tab_nav.currentIndex
//    height: childrenRect.height


    ListModel {
        id: tab_model
    }
    MouseArea {
        //将子项包在父项MouseArea解决Hover事件穿透
        propagateComposedEvents: true
        hoverEnabled: true
        anchors.fill: parent

        ListView {
            id: tab_nav
            orientation: ListView.Horizontal
            //禁止拖动
            boundsBehavior: Flickable.StopAtBounds
            height: 34
            width: childrenRect.width
            anchors {
                top: parent.top
                left: parent.left
            }
            model: tab_model
            delegate: Item {
                width: 42+model.text.length*14
                height: tab_nav.height
                J_Iconbutton {
                    anchors.fill: parent
                    display: Button.TextBesideIcon
                    text: model.text
                    textColor: "black"
                    font.pixelSize: 14
                    iconName: "\ueaf1"
                    onClicked: {
                        slider.x = parent.x
                        slider.width = parent.width
                        tab_nav.currentIndex = index
                    }
                }
            }
        }
        Row {
            id: right_row
            height: tab_nav.height
            width: childrenRect.width
            anchors {
                right: parent.right
                top: parent.top
            }
            opacity: 0
            J_Iconbutton {
                id: filter_button
                height: tab_nav.height
                display: Button.TextOnly
                textColor: "black"
                font.pixelSize: 14
                text: "Filter"
            }
            J_Iconbutton {
                id: sort_button
                height: tab_nav.height
                display: Button.TextOnly
                textColor: "black"
                font.pixelSize: 14
                text: "Sort"
            }
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }
        }
        //嵌套再嵌套，人晕了
        // MouseArea{
        //     anchors.fill: parent
		// 	propagateComposedEvents: true
		// 	hoverEnabled: true
            onEntered: {
                right_row.opacity = 1
            }
            onExited: {
                right_row.opacity = 0
            }
        //     //事件穿透
        //     onPressed: mouse => {
        //         mouse.accepted = false
        //     }
        // }
        Rectangle{
            anchors{
                top: tab_nav.bottom
                left: parent.left
                right: parent.right
                topMargin: 1
            }
            height: 1
            color: "#e9e9e7"
        }
        Rectangle{
            id: slider
            anchors.top: tab_nav.bottom
            height: 2
            x: 0
            color: "black"
            Behavior on x {
                NumberAnimation {
                    duration: 200
                }
            }
        }
        //怎么根据显示地组件动态改变高度
        Item {
            anchors {
                top: slider.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                topMargin: 7
            }
            id: container
//            height: container_repeater.itemAt(root.index).item.height
            Repeater {
                id: container_repeater
                model: tab_model
                Loader {
                    anchors.fill: parent
                    sourceComponent: model.page
                    visible: tab_nav.currentIndex === index
                }
            }
        }
    }

    function appendTab(text,page){
        tab_model.append({text: text, page: page})
    }
    Component.onCompleted:{
        tab_nav.currentIndex = 0
        slider.x = tab_nav.currentItem.x
        slider.width = tab_nav.currentItem.width
    }
}
