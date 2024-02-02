import QtQuick
import QtQuick.Layouts
import "qrc:/Base"

J_Scrollpage {
    id: root
    Item{
        Layout.fillWidth: true
        height: 400
        Image {
            id: backgroundimage
            anchors.fill: parent
            horizontalAlignment: Image.AlignHCenter
            fillMode: Image.PreserveAspectCrop
            source: "qrc:background.jpg"
        }
        J_Radiusimage{
            id: avatarimage
            width: 150
            height: 150
            x: 50
            y: parent.height - width - 50
            radius: 15
            imgsrc: "qrc:avatar.png"
        }
        Text{
            anchors{
                left: avatarimage.right
                bottom: avatarimage.bottom
                leftMargin: 15
            }
            font{
                family: "Courier New"
                pixelSize: 50
                weight: Font.DemiBold
            }
            text: "Nanasaki"
        }
    }
    Item{
        Layout.fillWidth: true
        height: 20
    }
    Item{
        Layout.fillWidth: true
        Layout.rightMargin: 20
        Layout.leftMargin: 20
        Layout.preferredHeight: subpage_row.childrenRect.height
        Row{
            id: subpage_row
            spacing: 20
            Home_Subpage_1{
                width: root.width*0.16
            }
            Home_Subpage_2{
                width: root.width*0.6
            }
            Home_Subpage_3{
                width: root.width*0.16
            }
        }
    }
    Item{
        Layout.fillWidth: true
        height: 150
    }
}
