cmake_minimum_required(VERSION 3.21)
project(Journal VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(Qt6 6.5 COMPONENTS Core Gui Qml Quick QuickControls2 Sql REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(Journal Src/main.cpp
        Src/model.hpp
        Src/mysql.hpp
        Src/mysql.cpp
    )

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
        Qt6::Sql
)
