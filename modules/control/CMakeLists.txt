# =========================
# OpenLib Control Library
# =========================
add_library(openlib_control)
add_library(openlib::control ALIAS openlib_control)

# =========================
# Sources & Headers (recursive)
# =========================
file(GLOB_RECURSE OPENLIB_CONTROL_SOURCES
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

file(GLOB_RECURSE OPENLIB_CONTROL_HEADERS
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/include/openlib/control/*.hpp
)

target_sources(openlib_control
  PRIVATE
    ${OPENLIB_CONTROL_SOURCES}
  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include
    FILES ${OPENLIB_CONTROL_HEADERS}
)

target_include_directories(openlib_control
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

# =========================
# Dependencies
# =========================
target_link_libraries(openlib_control
  PUBLIC
    openlib_project_options
    openlib::core)

# =========================
# Tests
# =========================
if(OPENLIB_BUILD_TESTING)
  add_subdirectory(tests)
endif()

# =========================
# IDE Organization
# =========================
set_target_properties(openlib_control PROPERTIES
  FOLDER "OpenLib/Modules/Control"
)

# =========================
# Visual Studio file grouping
# =========================
source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/src
  PREFIX "Source Files"
  FILES ${OPENLIB_CONTROL_SOURCES}
)

source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/include
  PREFIX "Header Files"
  FILES ${OPENLIB_CONTROL_HEADERS}
)
