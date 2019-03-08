cmake_minimum_required(VERSION 3.12)
project(eigen3_and_ceres LANGUAGES CXX)
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/CommonSettings.cmake")
find_package(OpenMP REQUIRED)
include(Eigen3AndCeres)

add_library(eigen3_and_ceres INTERFACE)
target_link_libraries(eigen3_and_ceres INTERFACE Eigen3::Eigen ceres)

install(TARGETS eigen3_and_ceres)
