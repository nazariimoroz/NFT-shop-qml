cmake_minimum_required(VERSION 3.16)

project(ns-utils VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

qt_add_resources(RES ../res.qrc)
add_library(${PROJECT_NAME} STATIC
        Utils.h
        Utils.cpp
        NetworkManager.cpp
        NetworkManager.h
        ${RES})

target_include_directories(${PROJECT_NAME} PUBLIC "./")
target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Network Qt6::Core)