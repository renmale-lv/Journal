import QtQuick
import QtQuick.Layouts

Item{
    // default的使用
    default property alias content: container.data
    property int spacing: 0
    property int leftPadding: 0
    property int topPadding: 0
    property int rightPadding: 0
    property int bottomPadding: 0

    id: root
    Item{
        anchors{
            fill: parent
            leftMargin: root.leftPadding
            rightMargin: root.rightPadding
            topMargin: root.topPadding
            bottomMargin: root.bottomPadding
        }
        Flickable{
            id: flickview
            clip: true
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: container.height
            boundsBehavior: Flickable.StopAtBounds
            ColumnLayout{
                id: container
                spacing: root.spacing
                anchors{
                    left: parent.left
                    right: parent.right
                    top: parent.top
                }

            }
        }
    }
    J_Scrollbar{
        id: verticalbar
        orientation: Qt.Vertical
        target: flickview
        anchors{
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        opacity: container.height > flickview.height ? 1 : 0;
    }
    J_Scrollbar{
        id: horizontalbar
        orientation: Qt.Horizontal
        target: flickview
        anchors{
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        opacity: container.width > flickview.width ? 1 : 0;
    }
}
