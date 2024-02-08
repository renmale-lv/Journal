cmake_minimum_required(VERSION 3.21)

project(Journal LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
#set(CMAKE_AUTORCC ON)
#set(CMAKE_INCLUDE_CURRENT_DIR ON)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.6 COMPONENTS Core Gui Qml Quick QuickControls2 Widgets REQUIRED)

qt_standard_project_setup(REQUIRES 6.6.1)
#qt_policy(SET CMP0127 NEW)
qt_add_executable(Journal Src/main.cpp)

qt_add_resources(Journal "configuration"
        PREFIX "/"
        FILES
            Config/config.conf
)

include(qmlmodules.cmake)

target_link_libraries(Journal PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Quick
        Qt6::Qml
        Qt6::QuickControls2
        Qt6::Widgets
)

install(TARGETS Journal
        RUNTIME DESTINATION "${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_BUILD_TYPE}/bin"
        BUNDLE DESTINATION "${CMAKE_CURRENT_SOURCE_DIR}"
        LIBRARY DESTINATION "${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_BUILD_TYPE}/lib"
)
