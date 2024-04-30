cmake_minimum_required(VERSION 3.16)

project(ps-view VERSION 1.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick Gui REQUIRED)

qt_add_library(${PROJECT_NAME} STATIC)

qt_add_qml_module(${PROJECT_NAME}
        URI ${PROJECT_NAME}
        OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME}"
        RESOURCE_PREFIX /source/
        VERSION 1.0
        QML_FILES
            main.qml)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_NAME})
target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Gui Qt6::Quick)
