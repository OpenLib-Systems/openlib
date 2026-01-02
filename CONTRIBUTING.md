# Contributing to This Project

Thank you for your interest in contributing!
This project is a modular C++ ecosystem for control engineering, image processing, and machine learning.
We follow modern C++ design principles, clean architecture, reproducible builds, and automated testing.

Please read this guide before submitting code, issues, or pull requests.

---

## 🧱 Project Structure

Each module contains:

- `include/` → public headers
- `src/` → implementation
- `tests/` → Catch2 unit tests
- `CMakeLists.txt` → module-level build file

---

## 🛠️ Development Requirements

To contribute, you need:

- **C++20 or newer**
- **CMake 3.20+**
- **Conan 2.x**
- **Docker** (optional, for CI‑equivalent builds)
- **Catch2** (installed automatically via Conan)

---

## 🧪 Building the Project

### Standard local build

```bash
mkdir build
cd build
conan install .. --build=missing
cmake ..
cmake --build .
```

---

## 🔀 Branching Model

We use a simple Git workflow:

- main → stable, production-ready
- develop → active development
- feature branches → `feature/<name>`
- bugfix branches → `fix/<name>`
Please never commit directly to main.

---

## 📥 Pull Requests

Before opening a PR:

- Create a feature branch
- Ensure the code builds without warnings
- Add or update unit tests
- Run all tests locally
- Follow the coding style (see below)
- Ensure commits are clean and meaningful
PRs are automatically tested via GitHub Actions.
