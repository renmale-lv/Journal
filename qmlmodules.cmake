qt6_add_qml_module(Journal
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

# Make Qt Creator aware of where the QML modules live
set (_QML_IMPORT_PATHS"")

## Add new module paths here.
list (APPEND _QML_IMPORT_PATHS ${CMAKE_CURRENT_BINARY_DIR}/imports)
list (APPEND _QML_IMPORT_PATHS ${CMAKE_CURRENT_BINARY_DIR})
list (APPEND _QML_IMPORT_PATHS ${CMAKE_CURRENT_SOURCE_DIR}/imports)
list (APPEND _QML_IMPORT_PATHS ${CMAKE_CURRENT_SOURCE_DIR})
message(${CMAKE_CURRENT_BINARY_DIR})
message(${CMAKE_CURRENT_SOURCE_DIR})
set (
    QML_IMPORT_PATH
    ${_QML_IMPORT_PATHS}
    CACHE
    STRING
   "Path used to locate CMake modules by Qt Creator"
#    "Warnings occurred while importing module by CLion"
    FORCE
)
