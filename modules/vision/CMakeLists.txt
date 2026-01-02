# =========================
# OpenLib Vision Library
# =========================
add_library(openlib_vision)
add_library(openlib::vision ALIAS openlib_vision)

# =========================
# Sources & Headers
# =========================
file(GLOB_RECURSE OPENLIB_VISION_SOURCES
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
)

file(GLOB_RECURSE OPENLIB_VISION_HEADERS
  CONFIGURE_DEPENDS
  ${CMAKE_CURRENT_SOURCE_DIR}/include/openlib/vision/*.hpp
)

target_sources(openlib_vision
  PRIVATE
    ${OPENLIB_VISION_SOURCES}
  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include
    FILES ${OPENLIB_VISION_HEADERS}
)

target_include_directories(openlib_vision
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

find_package(OpenCV CONFIG REQUIRED)

# =========================
# Dependencies
# =========================
target_link_libraries(openlib_vision
  PUBLIC openlib::core opencv::opencv
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
set_target_properties(openlib_vision PROPERTIES
  FOLDER "OpenLib/Modules/Vision"
)

# =========================
# Visual Studio file grouping
# =========================
source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/src
  PREFIX "Source Files"
  FILES ${OPENLIB_VISION_SOURCES}
)

source_group(
  TREE ${CMAKE_CURRENT_SOURCE_DIR}/include
  PREFIX "Header Files"
  FILES ${OPENLIB_VISION_HEADERS}
)
