add_executable(openlib_vision_tests test_vision.cpp)

find_package(Catch2 CONFIG REQUIRED)

target_link_libraries(openlib_vision_tests
  PRIVATE
    openlib_project_options
    openlib::vision
    Catch2::Catch2WithMain)

add_test(NAME vision COMMAND openlib_vision_tests)

# =========================
# IDE Organization
# =========================
set_target_properties(openlib_vision_tests PROPERTIES
  FOLDER "OpenLib/Modules/Vision"
)
