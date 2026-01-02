@echo off
setlocal

REM ============================
REM Argumente
REM ============================
set "BUILD_TYPE=%~1"
if "%BUILD_TYPE%"=="" set "BUILD_TYPE=Debug"

set "CONAN_PROFILE=%~2"
if "%CONAN_PROFILE%"=="" set "CONAN_PROFILE=default"

REM ============================
REM Verzeichnisse
REM ============================
set "SRC_DIR=%CD%"
set "BUILD_DIR=%SRC_DIR%\build\vs"

echo ============================
echo Build type    : %BUILD_TYPE%
echo Conan profile : %CONAN_PROFILE%
echo Build dir     : %BUILD_DIR%
echo ============================

REM ============================
REM Build-Verzeichnis
REM ============================
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

REM ============================
REM Conan install
REM ============================
conan install "%SRC_DIR%" ^
  -pr "%CONAN_PROFILE%" ^
  -s build_type=%BUILD_TYPE% ^
  -of "%BUILD_DIR%" ^
  -g CMakeToolchain -g CMakeDeps ^
  --build=missing || exit /b 1

REM ============================
REM CMake configure
REM ============================
cmake -S "%SRC_DIR%" -B "%BUILD_DIR%" ^
  -G "Visual Studio 17 2022" -A x64 ^
  -DCMAKE_TOOLCHAIN_FILE="%BUILD_DIR%\build\generators\conan_toolchain.cmake" || exit /b 1

REM ============================
REM Build
REM ============================
cmake --build "%BUILD_DIR%" --config %BUILD_TYPE% || exit /b 1

echo ============================
echo Build succeeded (%BUILD_TYPE%)
echo ============================

endlocal
