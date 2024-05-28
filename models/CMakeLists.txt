cmake_minimum_required(VERSION 3.16)

project(ns-models LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(${PROJECT_NAME} STATIC
        UserModel.cpp
        UserModel.h)

target_include_directories(${PROJECT_NAME} PUBLIC "./")
target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt6::Core)