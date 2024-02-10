import QtQuick
import Components

Item{
    height: column.childrenRect.height
    Column{
        id: column
        anchors.fill: parent;
        spacing: 10
        Home_Smalltitle{
            width: parent.width
            text: "任务管理"
        }
        J_Taskview{
            width: parent.width
            id: taskview
        }
        Home_Smalltitle{
            width: parent.width
            text: "习惯打卡"
        }
        Home_Smalltitle{
            width: parent.width
            text: "目标管理"
        }
        Home_Smalltitle{
            width: parent.width
            text: "书籍阅读"
        }
    }
}
