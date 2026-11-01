cmake_minimum_required(VERSION 3.21)
project(MacLinux VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_add_executable(maclinux-shell
    src/main.cpp
)

qt_add_qml_module(maclinux-shell
    URI MacLinux
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/Installer.qml
        qml/GlassPanel.qml
)

target_link_libraries(maclinux-shell PRIVATE Qt6::Quick)
