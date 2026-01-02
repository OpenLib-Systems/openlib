include_guard(GLOBAL)

message(STATUS "Configuring for Windows")

add_compile_definitions(
  NOMINMAX
  WIN32_LEAN_AND_MEAN
)

set(OPENLIB_PLATFORM_NAME "windows")

if(MSVC)
  add_compile_options(/W4 /permissive-)
  add_compile_definitions(_CRT_SECURE_NO_WARNINGS)
endif()
