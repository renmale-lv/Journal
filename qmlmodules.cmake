qt_add_qml_module(Journal
    URI "Main"
    VERSION 1.0
    NO_PLUGIN
    QML_FILES Main.qml
    RESOURCE_PREFIX "/"
)

add_subdirectory(Content)
add_subdirectory(imports)

target_link_libraries(Journal PRIVATE
    Journal_contentplugin
    Baseplugin
    Componentsplugin
)
