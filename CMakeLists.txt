cmake_minimum_required(VERSION 3.21)
project(Journal)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)


find_package(Qt6 6.2 REQUIRED COMPONENTS
        Quick
        Widgets
        Core
        QuickControls2
        Gui
    )

add_executable(Journal main.cpp Qml/qml.qrc Image/imgs.qrc Font/fonts.qrc)

target_link_libraries(Journal
        Qt::Core
        Qt6::Widgets
        Qt6::Quick
        Qt6::QuickControls2
        )
