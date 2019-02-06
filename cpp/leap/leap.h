#if !defined(LEAP_H)
#define LEAP_H

#define EXERCISM_RUN_ALL_TESTS

namespace leap {
  bool leap(int year);

  bool is_leap_year(int year) {
    if ((year % 400 == 0) ||
        (year % 100 != 0 &&
         year % 4 == 0))
    return true;
  else
    return false;
  }
}
#endif
