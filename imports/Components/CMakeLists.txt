qt_add_library(Components STATIC)

qt6_add_qml_module(Components
    URI "Components"
    VERSION 1.0
    QML_FILES
        J_Sidebar.qml
        J_Task/J_TaskSView.qml
        J_Task/J_TaskList.qml
        J_Task/J_TaskItem.qml
        J_Task/J_EditTask.qml
        J_Target/J_TargetItem.qml
        J_Target/J_TargetList.qml
        J_Target/J_TargetSView.qml
        J_Goal/J_GoalItem.qml
        J_Goal/J_GoalList.qml
        J_Goal/J_GoalSView.qml
    RESOURCE_PREFIX "/"
)
