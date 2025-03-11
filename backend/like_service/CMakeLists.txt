cmake_minimum_required(VERSION 3.28.4)

project(like_service LANGUAGES CXX)

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(Boost REQUIRED)
find_package(Threads REQUIRED)
find_package(libpqxx REQUIRED)
find_package(nlohmann_json REQUIRED)

set(INCLUDE_DIR ${CMAKE_SOURCE_DIR}/include)
set(SOURCE_DIR ${CMAKE_SOURCE_DIR}/source)

file(GLOB_RECURSE SOURCES
    ${INCLUDE_DIR}/*.hpp
    ${SOURCE_DIR}/*.cpp)

include_directories(
    ${INCLUDE_DIR})

add_executable(${PROJECT_NAME} ${SOURCES})

target_link_libraries(${PROJECT_NAME} PRIVATE 
    ${Boost_LIBRARIES}
    Threads::Threads
    nlohmann_json::nlohmann_json
    libpqxx::pqxx
    )