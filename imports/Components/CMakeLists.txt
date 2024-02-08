qt_add_library(Components STATIC)

qt6_add_qml_module(Components
    URI "Components"
    VERSION 1.0
    QML_FILES
        J_Sidebar.qml
        J_Taskview.qml
)
