import QtQuick.Window
import "qrc:/Base"
import QtQuick
import QtQuick.Controls

Window{
    id: window
    minimumHeight: 800
    minimumWidth: 1300
    visible: true

    J_Iconbutton{
        id: testbutton
        anchors.centerIn: parent
        width: 100
        height: 100
        z: 100
    }
    // Homepage{
    //     anchors.fill: parent
    // }
}
