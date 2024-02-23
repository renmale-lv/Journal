qt_add_library(Journal_content STATIC)

qt6_add_qml_module(Journal_content
    URI "Content"
    VERSION 1.0
    QML_FILES
        Home_Smalltitle.qml
        Home_Subpage_1.qml
        Home_Subpage_2.qml
        Home_Subpage_3.qml
        Homepage.qml
    RESOURCES
        Resource/Image/avatar.png
        Resource/Image/background.jpg
        Resource/Image/image1.jpg
        Resource/Image/image2.jpg
    RESOURCE_PREFIX "/"
)
