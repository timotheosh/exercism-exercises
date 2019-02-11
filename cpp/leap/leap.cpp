#include "leap.h"

bool leap::is_leap_year(const unsigned short year) {
  if ((year % 400 == 0) ||
      (year % 100 != 0 &&
       year % 4 == 0))
    return true;
  else
    return false;
}
