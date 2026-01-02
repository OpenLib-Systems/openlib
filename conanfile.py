from conan import ConanFile
from conan.tools.cmake import cmake_layout

class OpenLibConan(ConanFile):
    name = "openlib"
    version = "0.1.0"
    settings = "os", "arch", "compiler", "build_type"
    generators = ("CMakeToolchain", "CMakeDeps")

    options = {
        "with_vision": [True, False],
        "with_control": [True, False],
    }
    default_options = {
        "with_vision": True,
        "with_control": True,
    }

    def layout(self):
        cmake_layout(self)

    def requirements(self):
        # Core
        self.requires("fmt/12.0.0")
        self.requires("spdlog/1.16.0")
        self.requires("eigen/3.4.0")

        # Tests
        self.requires("catch2/3.5.4")

        # Vision (optional)
        if self.options.with_vision:
            self.requires("opencv/4.9.0")

    def configure(self):
        self.options["opencv"].with_ffmpeg = False
        self.options["spdlog"].header_only = False
        self.options["spdlog"].use_fmt = True
