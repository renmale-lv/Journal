import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T

T.ComboBox {
    id: control
    property int delewidth: 50
    height: 30

    delegate: ItemDelegate{
        width: control.width
        height: 30
        contentItem: Item{
            Rectangle{
                width: control.delewidth
                height: parent.height
                radius: height/2
                color: "green"
                Text{
                    anchors.centerIn: parent
                    text: modelData
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        background: Rectangle{
            radius: height/2
            color: (control.highlightedIndex === index) ? "yellow" : "transparent"
            border.width: 0
        }

        highlighted: control.highlightedIndex === index
    }
    indicator: null
    contentItem: Item{
        Rectangle{
            width: control.delewidth
            height: parent.height
            radius: height/2
            color: "green"
            Text{
                anchors.centerIn: parent
                text: control.displayText
                verticalAlignment: Text.AlignVCenter

            }
        }
    }

    background: J_Rectangle{
        anchors.fill: parent
        topLeftRadius: 5
        topRightRadius: 5
        bottomLeftRadius: pop_.opened ? 0 : 5
        bottomRightRadius: pop_.opened ? 0 : 5
        color: pop_.opened ? "#f7f7f5" : hovered ? "#efefef" : "#ffffff"
        borderWidth: pop_.opened ? 1 : 0
        borderColor: pop_.opened ? "#d5d5d5" : "transparent"
    }

    popup: Popup{
        id: pop_
        width: control.width
        implicitHeight: contentItem.implicitHeight
        //        height: 20
        padding: 0
        y: control.height - 1

        contentItem: ListView{
            clip: true
            boundsBehavior: Flickable.StopAtBounds;
            model: control.delegateModel
            implicitHeight: contentHeight;
            ScrollIndicator.vertical: ScrollIndicator { }
            currentIndex: control.highlightedIndex

            J_Rectangle{
                width: parent.width
                height: parent.height
                borderWidth: 1
                borderColor: "#d5d5d5"
                color: "transparent"
                bottomLeftRadius:  5
                bottomRightRadius: 5
            }
        }
    }

}
