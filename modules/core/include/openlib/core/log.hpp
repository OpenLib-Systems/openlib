#pragma once
#include <memory>
#include <string_view>

#include <spdlog/logger.h>

namespace openlib::core
{

class Log final
{
  public:
    static void init();
    static std::shared_ptr<spdlog::logger> get();

    static void set_level_info();
    static void set_level_debug();

 private:
  static std::shared_ptr<spdlog::logger> logger_;
};

}  // namespace acme::core

// Komfort-Makros
#define OPENLIB_LOG_DEBUG(...) ::openlib::core::Log::get()->debug(__VA_ARGS__)
#define OPENLIB_LOG_INFO(...)  ::openlib::core::Log::get()->info(__VA_ARGS__)
#define OPENLIB_LOG_WARN(...)  ::openlib::core::Log::get()->warn(__VA_ARGS__)
#define OPENLIB_LOG_ERROR(...) ::openlib::core::Log::get()->error(__VA_ARGS__)
