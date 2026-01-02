# =========================
# OpenLib Core Library
# =========================
add_library(openlib_core)
add_library(openlib::core ALIAS openlib_core)

# =========================
# Sources & Headers
# =========================
file(GLOB_RECURSE OPENLIB_CORE_SOURCES
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

file(GLOB_RECURSE OPENLIB_CORE_HEADERS
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/include/openlib/core/*.hpp
)

target_sources(openlib_core
  PRIVATE
    ${OPENLIB_CORE_SOURCES}
  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include
    FILES ${OPENLIB_CORE_HEADERS}
)

target_include_directories(openlib_core
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

find_package(fmt CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(Eigen3 CONFIG REQUIRED)

# =========================
# Dependencies
# =========================
target_link_libraries(openlib_core
  PUBLIC
    openlib_project_options
    fmt::fmt
    spdlog::spdlog
    Eigen3::Eigen
)

# =========================
# Tests
# =========================
if(OPENLIB_BUILD_TESTING)
  add_subdirectory(tests)
endif()

# =========================
# IDE Organization
# =========================
set_target_properties(openlib_core PROPERTIES
  FOLDER "OpenLib/Modules/Core"
)

# =========================
# Visual Studio file grouping
# =========================
source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/src
  PREFIX "Source Files"
  FILES ${OPENLIB_CORE_SOURCES}
)

source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/include
  PREFIX "Header Files"
  FILES ${OPENLIB_CORE_HEADERS}
)
