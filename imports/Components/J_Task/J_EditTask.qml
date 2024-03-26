import QtQuick
import QtQuick.Controls
import Task
import QtQuick.Templates as T
import GlobalSignals
import Base
import QtQuick.Layouts

Popup{
    id: root;
    property Task task
    width: 950
    height: 650
    padding: 0
    closePolicy: Popup.CloseOnPressOutside || Popup.CloseOnEscape
    modal: true //模态
    background: Rectangle{
        anchors.fill: parent;
        radius: 7
        color: "#ffffff"
    }

    T.Overlay.modal: Rectangle{
        color: "#906f6f6f"
    }
    Connections{
        target: GlobalSignals
        function onEditTask(task){
            root.open()
            root.task = task
        }
    }

    Item{
        id: title_bar
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
    Image {
        anchors{
            bottom: parent.bottom
            right: parent.right
        }
        height: 350
        fillMode: Image.PreserveAspectFit
        source: "qrc:Base/Resource/Image/background_fangnai.png"
    }
    J_Scrollpage{
        anchors{
            top: title_bar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Item{
            id: container
            Layout.fillWidth: true
            height: 400


            Item{
                id: task_name
                anchors{
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    leftMargin: 80
                    rightMargin: 50
                    topMargin: 50
                }
                height: 70
                TextEdit{
                    anchors.fill: parent
                    text: root.task.name
                    font.family: "Courier New"
                    font.pixelSize: 50
                }
            }
            Item{
                anchors{
                    top: task_name.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: 80
                    rightMargin: 50
                }
                Item{
                    anchors{
                        top: parent.top
                        left: parent.left
                    }
                    Column{
                        anchors.fill: parent
                        spacing: 20
                        Row{
                            J_Text{
                                text: "状态："
                                font.pixelSize: 17
                                width: 200
                            }
                            J_ComboBox{
                                width: 200
                                model: ["未完成","完成","超时"]
                                currentIndex: root.task.status
                            }

                        }
                        J_Text{
                            text: "短期目标："
                            font.pixelSize: 17
                        }
                        J_Text{
                            text: "时间："
                            font.pixelSize: 17
                        }
                        Row{
                            J_Text{
                                text: "End Date:"
                                font.pixelSize: 17
                                width: 200
                            }
                            Switch{

                            }
                        }
                        Row{
                            J_Text{
                                text: "Include Time:"
                                font.pixelSize: 17
                                width: 200
                            }
                            Switch{

                            }
                        }
                    }
                }
            }
        }
    }
}
