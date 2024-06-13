cmake_minimum_required(VERSION 3.16)

project(ns-models LANGUAGES CXX)
set(PROJECT_NAME_QT NsModels)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 COMPONENTS Quick Core REQUIRED)

qt_add_library(${PROJECT_NAME} STATIC)

qt_add_qml_module(${PROJECT_NAME}
        URI ${PROJECT_NAME_QT}
        OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME_QT}"
        RESOURCE_PREFIX /Models/
        VERSION 1.0
        SOURCES
            UserModel.cpp
            UserModel.h
)

target_include_directories(${PROJECT_NAME} PUBLIC "./")
target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Core Qt6::Quick)
