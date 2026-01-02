option(OPENLIB_WARNINGS_AS_ERRORS "Treat warnings as errors" OFF)

add_library(openlib_project_options INTERFACE)

target_compile_features(openlib_project_options INTERFACE cxx_std_20)

# Warnings
include(Warnings)
openlib_set_project_warnings(
  openlib_project_options
  ${OPENLIB_WARNINGS_AS_ERRORS}
)
