from datetime import date
from calendar import monthrange


def meetup_day(year, month, weekday, order):
    fstWeekDay = first_weekday(year, month, weekday)
    if order == "teenth":
        day = 13 + (fstWeekDay + 1 % 13)
        return date(year, month, day)

    if order == "last":
        day = last_weekday(year, month, weekday)
        return date(year, month, day)

    week = int(order[0])
    daysToMeetup = 7 * (week - 1)
    day = fstWeekDay + daysToMeetup
    return date(year, month, day)


def first_weekday(year, month, weekday):
    firstDayOfMonth = date(year, month, 1)
    diffWeekdays = weekday_to_int(weekday) - firstDayOfMonth.isoweekday()
    return diffWeekdays % 7 + 1


def last_weekday(year, month, weekday):
    fstWeekDay = first_weekday(year, month, weekday)
    if fstWeekDay + 28 in monthrange(year, month):
        return fstWeekDay + 28
    return fstWeekDay + 21


def weekday_to_int(weekday):
    try:
        return weekday_to_int_table[weekday]
    except:
        raise Exception(weekday + " is not a valid weekday")

weekday_to_int_table = {"Monday": 1, "Tuesday": 2, "Wednesday": 3,
                        "Thursday": 4, "Friday": 5, "Saturday": 6, "Sunday": 7}
