@echo off
setlocal

if not exist build (
    echo Build folder not found. Run build.cmd first.
    exit /b 1
)

cd build
ctest --output-on-failure

endlocal
