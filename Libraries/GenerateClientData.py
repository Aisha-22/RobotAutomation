import datetime
import random
import string
from pprint import pprint

from dateutil.relativedelta import relativedelta

from PolicyComponent.EnrollmentData import *


def read_names_file():
    with open('./Data/names.csv') as f:
        names = [tuple(line.rstrip().split(",")) for line in f]
    return names


# def generate_random_birth_date(start_year: int, end_year: int):
#     start_date = datetime.date(start_year, 1, 1)
#     end_date = datetime.date(end_year, 12, 31)
#
#     time_between_dates = end_date - start_date
#     days_between_dates = time_between_dates.days
#     random_number_of_days = random.randrange(days_between_dates)
#     random_date = start_date + datetime.timedelta(days=random_number_of_days)
#     return random_date.isoformat()


def get_random_name_for_index(names, idx: int):
    names_list = []
    for t in names:
        names_list.append(t[idx])
    return random.choice(names_list)


def get_random_client_data(start_year: int, end_year: int):
    names = read_names_file()
    birth_date = generate_random_birth_date(start_year, end_year)
    start_date = datetime.datetime.strptime(birth_date, "%Y-%m-%d")
    end_date = datetime.datetime.now()
    difference_in_years = relativedelta(end_date, start_date).years
    person = Person()
    person.name = get_random_name_for_index(names, random.randrange(0, 2, 1))
    person.surname = get_random_name_for_index(names, 2)
    person.birthdate = birth_date
    person.age = difference_in_years
    return convert2serialize(person)


def get_rwc_enrollment_data():
    data = RwcEnrollment()
    birth_date = generate_random_birth_date(1970, 2000)
    start_date = datetime.datetime.strptime(birth_date, "%Y-%m-%d")
    end_date = datetime.datetime.now()
    difference_in_years = relativedelta(end_date, start_date).years
    data.dateOfBirth = birth_date
    data.age = difference_in_years
    auto_boost = AutoBoost()
    auto_boost.boostNeed = 'Wholesale Hospital Cash Plan'
    auto_boost.boostAmount = Amount(150, 'UGX')
    data.autoBoosts.append(auto_boost)
    return convert2serialize(data)


def convert2serialize(obj):
    if isinstance(obj, dict):
        return {k: convert2serialize(v) for k, v in obj.items()}
    elif hasattr(obj, "_ast"):
        return convert2serialize(obj._ast())
    elif not isinstance(obj, str) and hasattr(obj, "__iter__"):
        return [convert2serialize(v) for v in obj]
    elif hasattr(obj, "__dict__"):
        return {
            k: convert2serialize(v)
            for k, v in obj.__dict__.items()
            if not callable(v) and not k.startswith('_')
        }
    else:
        return obj


def generate_enrollment_lines():
    names = read_names_file()
    name = get_random_name_for_index(names, random.randrange(0, 2, 1))
    surname = get_random_name_for_index(names, 2)
    birth_date = generate_random_birth_date(1950, 2010)
    start_date = datetime.datetime.strptime(birth_date, "%Y-%m-%d")
    end_date = datetime.datetime.now()
    age = relativedelta(end_date, start_date).years
    numbers = string.digits
    msisdn = '255' + ''.join(random.choice(numbers) for i in range(10))

    return ";".join([name, surname.upper(), str(age), birth_date, 'fre', msisdn, 'true', ''])


for x in range(100):
    print(generate_enrollment_lines())
