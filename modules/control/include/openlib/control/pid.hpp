#pragma once

namespace openlib::control
{

  struct PidGains
  {
    double kp{0.0};
    double ki{0.0};
    double kd{0.0};
  };

  class PID final
  {
  public:
    PID(PidGains gains, double out_min = -1e9, double out_max = 1e9);

    void reset();
    void set_gains(PidGains g);

    // dt in seconds
    double update(double setpoint, double measurement, double dt);

  private:
    PidGains g_;
    double out_min_;
    double out_max_;
    double integral_{0.0};
    double prev_error_{0.0};
    bool has_prev_{false};
  };

}  // namespace acme::control
