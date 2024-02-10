qt_add_library(Base STATIC)

qt6_add_qml_module(Base
    URI "Base"
    VERSION 1.0
    QML_FILES
        J_Icon.qml
        J_Iconbutton.qml
        J_Listview.qml
        J_Radiusimage.qml
        J_Scrollbar.qml
        J_Scrollpage.qml
        J_Shadow.qml
        J_Tabview.qml
    RESOURCES
        Resource/Font/iconfont.ttf
        Resource/Image/Logo.png
    RESOURCE_PREFIX "/"
)
