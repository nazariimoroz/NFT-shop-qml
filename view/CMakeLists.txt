cmake_minimum_required(VERSION 3.16)

project(ns-view VERSION 1.0 LANGUAGES CXX)
set(PROJECT_NAME_QT NsView)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 COMPONENTS Widgets Quick Gui REQUIRED)

qt_add_library(${PROJECT_NAME} STATIC)

qt_add_qml_module(${PROJECT_NAME}
        URI ${PROJECT_NAME_QT}
        OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME_QT}"
        RESOURCE_PREFIX /View/
        VERSION 1.0
        QML_FILES
            main.qml
            NftSwiper.qml
            NftSwiper2.qml
            NftSwiper2Element.qml
            MainPage.qml
            ExplorePage.qml
            UserProfilePage.qml
            NotificationsPage.qml
            SearchPage.qml
            LoginWindow/LoginWindow.qml
            NavigationMenu/NavigationMenu.qml
            NavigationMenu/NavMenuElementDelegate.qml
        SOURCES
            ApplicationWindow/ApplicationWindowController.cpp
            ApplicationWindow/ApplicationWindowController.h
            LoginWindow/LoginWindowController.cpp
            LoginWindow/LoginWindowController.h
)

target_include_directories(${PROJECT_NAME} PUBLIC
        .
        ./ApplicationWindow/
        ./LoginWindow/)
target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Quick Qt6::Gui Qt::Widgets ns-utils ns-models ns-modelsplugin)
