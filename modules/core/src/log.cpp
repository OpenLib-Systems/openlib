#include "openlib/core/log.hpp"

#include <spdlog/sinks/stdout_color_sinks.h>
#include <spdlog/spdlog.h>

namespace openlib::core
{

  std::shared_ptr<spdlog::logger> Log::logger_{};

  void Log::init()
  {
    if (logger_) return;

    auto sink = std::make_shared<spdlog::sinks::stdout_color_sink_mt>();
    sink->set_pattern("[%Y-%m-%d %H:%M:%S.%e] [%^%l%$] %v");

    logger_ = std::make_shared<spdlog::logger>("openlib", sink);
    logger_->set_level(spdlog::level::info);
    logger_->flush_on(spdlog::level::warn);

    spdlog::register_logger(logger_);
  }

  std::shared_ptr<spdlog::logger> Log::get()
  {
    if (!logger_) init();
    return logger_;
  }

  void Log::set_level_info() { get()->set_level(spdlog::level::info); }
  void Log::set_level_debug() { get()->set_level(spdlog::level::debug); }

}  // namespace openlib::core
