from datetime import date
from calendar import monthrange


def meetup_day(year, month, weekday, order):
    fwd = first_weekday(year, month, weekday)
    if order == "teenth":
        if fwd < 6:
            day = fwd + 14
        else:
            day = fwd + 7

    elif order == "last":
        if fwd + 28 in monthrange(year, month):
            day = fwd + 28
        else:
            day = fwd + 21
    else:
        week = int(order[0])
        day = first_weekday(year, month, weekday) + 7 * (week - 1)
    return date(year, month, day)


def first_weekday(year, month, weekday):
    for day in range(1, 8):
        if date(year, month, day).isoweekday() == weekday_to_int(weekday):
            return day


def weekday_to_int(weekday):
    conversor_table = {"Monday": 1, "Tuesday": 2, "Wednesday": 3,
                       "Thursday": 4, "Friday": 5, "Saturday": 6, "Sunday": 7}
    if weekday in conversor_table:
        return conversor_table[weekday]
    raise Exception(weekday + " is not a valid weekday")
