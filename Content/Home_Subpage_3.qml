import QtQuick

Item{
    height: width*2
    Image {
        id: backgroundimage
        anchors.fill: parent
        horizontalAlignment: Image.AlignHCenter
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/Content/Resource/Image/image2.jpg"
    }
}
