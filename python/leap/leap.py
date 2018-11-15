def is_leap_year(year):
    ret = False
    if year % 4 == 0:
        if year % 400 == 0:
            ret = True
        elif year % 100 == 0:
            pass
        else:
            ret = True
    return ret
