import QtQuick.Window
import QtQuick
import Content
import Base
import Components

Window {
    id: window
    minimumHeight: 800
    minimumWidth: 1300
    visible: true

    J_Sidebar {
        id: sidebar
        x: 0

        anchors {
            bottom: parent.bottom
            top: parent.top
        }
    }
    Item {
        id: menubar
        height: 35
        visible: true

        anchors {
            left: sidebar.right
            right: parent.right
            top: parent.top
        }
        Row {
            id: menubar_row_left
            // leftPadding: 10

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            J_Iconbutton {
                id: sidebar_show_button
                iconName: "\ueaf1"
                onClicked: {
                    if (sidebar.x === 0) {
                        sidebar.x -= sidebar.width;
                    } else {
                        sidebar.x = 0;
                    }
                }
            }
        }
        Row {
            id: menubar_row_right
            // rightPadding: 10

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            J_Iconbutton {
                id: github_button
                iconName: "\ue673"
                onClicked: {
                    Qt.openUrlExternally("https://github.com/renmale-lv")
                }
            }
            J_Iconbutton {
                id: setting_show_button
                iconName: "\ue68b"
            }
        }
    }
    Homepage {
        id: homepage
        anchors {
            bottom: parent.bottom
            left: sidebar.right
            right: parent.right
            top: menubar.bottom
        }
    }
}
