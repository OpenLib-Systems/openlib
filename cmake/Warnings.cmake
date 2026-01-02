# cmake/Warnings.cmake
include_guard(GLOBAL)

function(openlib_set_project_warnings target WARNINGS_AS_ERRORS)
  if(MSVC)
    target_compile_options(${target} INTERFACE
      /W4
      /permissive-
      /w14242
      /w14254
      /w14263
      /w14265
    )

    if(WARNINGS_AS_ERRORS)
      target_compile_options(${target} INTERFACE /WX)
    endif()

  elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
    target_compile_options(${target} INTERFACE
      -Wall
      -Wextra
      -Wpedantic
      -Wconversion
      -Wsign-conversion
    )

    if(WARNINGS_AS_ERRORS)
      target_compile_options(${target} INTERFACE -Werror)
    endif()
  endif()
endfunction()
