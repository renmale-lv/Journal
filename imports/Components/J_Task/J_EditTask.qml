import QtQuick
import QtQuick.Controls
import Task
import QtQuick.Templates as T
import GlobalSignals
import Base

Popup{
    id: root;
    property Task task
    width: 950
    height: 650
    padding: 0
    closePolicy: Popup.CloseOnPressOutside || Popup.CloseOnEscape
    modal: true //模态
    T.Overlay.modal: Rectangle{
        color: "#906f6f6f"
    }
    Connections{
        target: GlobalSignals
        function onEditTask(task){
            root.open();
        }
    }

    Item{
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: 30
        Row{
            anchors.centerIn: parent
            J_Icon{
                iconName: "\ue61c"
            }
            J_Text{
                text: "Journal"
                font.pixelSize: 17
            }
        }
    }
    J_Scrollpage{

    }
}
