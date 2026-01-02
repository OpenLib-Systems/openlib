cmake_minimum_required(VERSION 3.24)

project(
  openlib
  VERSION 0.1.0
  DESCRIPTION "Modular C++ framework (core, vision, control)"
  LANGUAGES CXX
)

# -------------------------
# Global IDE / Build Setup
# -------------------------
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(OPENLIB_BUILD_VISION "Build vision module" ON)
option(OPENLIB_BUILD_CONTROL "Build control module" ON)
option(OPENLIB_BUILD_TESTING "Build tests" ON)
# -------------------------
# CMake Modules
# -------------------------
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
# -------------------------
# Project Options
# -------------------------
include(ProjectOptions)
include(Platform)
# -------------------------
# Testing
# -------------------------
include(CTest)
if(OPENLIB_BUILD_TESTING)
  enable_testing()
endif()
# -------------------------
# Core (always required)
# -------------------------
add_subdirectory(modules/core)
# -------------------------
# Optional Modules
# -------------------------
if(OPENLIB_BUILD_VISION)
  add_subdirectory(modules/vision)
endif()

if(OPENLIB_BUILD_CONTROL)
  add_subdirectory(modules/control)
endif()
