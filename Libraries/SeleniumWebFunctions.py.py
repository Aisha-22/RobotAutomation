from datetime import date
from robot.api.deco import keyword
import selenium


@keyword('todays number date')
def get_todays_date():
    today = str(date.today())
    day = today[-2:]
    return day


@keyword('yesterdays number date')
def get_yesterdays_date():
    today = str(date.today())
    day = today[-2:]
    day = int(day)
    day = day - 1
    day = str(day)
    day = '0' + day
    return day


# print(get_todays_date())
# print(get_yesterdays_date())

