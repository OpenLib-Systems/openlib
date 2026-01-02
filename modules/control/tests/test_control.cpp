#include <catch2/catch_test_macros.hpp>

#include "openlib/control/pid.hpp"

TEST_CASE("PID output responds to constant error")
{
  openlib::control::PID pid({.kp = 2.0, .ki = 1.0, .kd = 0.0}, -100.0, 100.0);

  const double setpoint = 10.0;
  double y = 0.0;

  const double u1 = pid.update(setpoint, y, 0.1);
  const double u2 = pid.update(setpoint, y, 0.1);

  REQUIRE(u1 > 0.0);
  REQUIRE(u2 >= u1);
}
