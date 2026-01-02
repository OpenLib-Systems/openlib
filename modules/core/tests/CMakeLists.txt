add_executable(openlib_core_tests test_core.cpp)

find_package(Catch2 CONFIG REQUIRED)

target_link_libraries(openlib_core_tests
  PRIVATE
    openlib::core
    Catch2::Catch2WithMain)

add_test(NAME core COMMAND openlib_core_tests)

# =========================
# IDE Organization
# =========================
set_target_properties(openlib_core_tests PROPERTIES
  FOLDER "OpenLib/Modules/Core"
)
