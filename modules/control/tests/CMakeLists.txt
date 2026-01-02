# =========================
# Control Module Tests
# =========================

find_package(Catch2 CONFIG REQUIRED)

add_executable(openlib_control_tests
  test_control.cpp
)

target_link_libraries(openlib_control_tests
  PRIVATE
    openlib::control
    Catch2::Catch2WithMain
)

add_test(NAME control COMMAND openlib_control_tests)

# =========================
# IDE Organization
# =========================
set_target_properties(openlib_control_tests PROPERTIES
  FOLDER "OpenLib/Modules/Control"
)
