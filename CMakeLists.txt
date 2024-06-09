cmake_minimum_required(VERSION 3.16)

project(nft-shop VERSION 1.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Widgets Quick Gui Network Core REQUIRED)

qt_add_resources(RES ./res.qrc)
qt_add_executable(${PROJECT_NAME}
        main.cpp
        ${RES}
)

add_subdirectory(utils)
add_subdirectory(models)
add_subdirectory(view)

target_link_libraries(${PROJECT_NAME} PRIVATE Qt6::Gui Qt6::Quick ns-viewplugin ns-utils ns-models)
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
