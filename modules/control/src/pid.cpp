#include "openlib/control/pid.hpp"

#include <algorithm>
#include <stdexcept>


namespace openlib::control
{

  PID::PID(PidGains gains, double out_min, double out_max):
  g_(gains), out_min_(out_min), out_max_(out_max)
  {
    if (out_min_ > out_max_) throw std::invalid_argument("PID: out_min > out_max");
  }

  void PID::reset()
  {
    integral_ = 0.0;
    prev_error_ = 0.0;
    has_prev_ = false;
  }

  void PID::set_gains(PidGains g)
  {
    g_ = g;
  }

  double PID::update(double setpoint, double measurement, double dt)
  {
    if (dt <= 0.0) throw std::invalid_argument("PID: dt must be > 0");

    const double error = setpoint - measurement;

    integral_ += error * dt;
    const double deriv = has_prev_ ? (error - prev_error_) / dt : 0.0;
    has_prev_ = true;
    prev_error_ = error;

    const double u = g_.kp * error + g_.ki * integral_ + g_.kd * deriv;
    return std::clamp(u, out_min_, out_max_);

  }

}  // namespace openlib::control
