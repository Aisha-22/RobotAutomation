import  os, json, datetime
from datetime import timedelta
from datetime import datetime
import random


class CustomFunctionsLibrary(object):
    ROBOT_LIBRARY_VERSION = 1.0
    def write_json_to_file(self, jsonToWrite,jsonFilePath):
        with open(jsonFilePath, 'w') as outfile:
            import json
            json.dump(json.loads(jsonToWrite), outfile, indent=4)

    def random_choice(list_terms):
        del list_terms[0]
        rand_item = random.choice(list_terms)
        return rand_item


    def get_dateOfBirth(self,yearToSubtract):
        today = datetime.today()
        today = today - timedelta(days=(int(yearToSubtract) * 365))
        today = today.__format__('%Y-%m-%d')
        return  today


    def calculate_numbers_letters_space_and_characters(self,text):
        s = text
        numbers = sum(c.isdigit() for c in s)
        words = sum(c.isalpha() for c in s)
        spaces = sum(c.isspace() for c in s)
        others = len(s) - numbers - words - spaces
        totalNumberOfCharectors = numbers + words + spaces + others
        return totalNumberOfCharectors

    def get_next_weekday_from_past_date(self,dateToUse,weekday):
        from datetime import datetime, date, timedelta
        dateToUse = int(dateToUse)
        weekday = int(weekday)
        counter = 0
        today = date.today()
        expireDate = date.today()

        today -= timedelta(dateToUse)
        expireDate -= timedelta(29)
        print('Purchase Date  ' + str(today))
        print("Today's Date " + str(expireDate))

        while expireDate.weekday() != weekday:
            expireDate += timedelta(1)
            print('Is Cover Expired?  ' + str(expireDate))
            counter =   counter+1

        expireDate += timedelta(1)
        print('Cover Expires  ' + str(expireDate))

        return counter




    def get_next_weekday_from_future_date(self, dateToUse, weekday):
        from datetime import date, datetime
        counter = 0
        today = datetime.date.today()
        print('Purchase Date  ' + str(today))

        print("Today's Date " + str(today))

        today += datetime.timedelta(dateToUse)
        while today.weekday() != weekday:
            today += datetime.timedelta(1)
            print('Is Cover Expired?  ' + str(today))
            counter + 1

        today += datetime.timedelta(1)
        print('Cover Expires  ' + str(today))

        return counter


    def get_cover_expire_date_using_past_date(self,dateToUse):
        from datetime import datetime, date, timedelta
        dateToUse = int(dateToUse)
        counter = 0
        today = date.today()
        expireDate = date.today()
        coveredday = dateToUse - 29
        today -= timedelta(dateToUse)
        expireDate -= timedelta(coveredday)
        print('Purchase Date  ' + str(today))
        print("30 Day's Date " + str(expireDate))

        while expireDate.weekday() != 2:
            expireDate += timedelta(1)
            print('Is Cover Expired?  ' + str(expireDate))
            counter = counter+1

        #Inculde the day of expirey
        counter = counter + 1

        expireDate += timedelta(1)
        print('Cover Expired On  ' + str(expireDate))
        coveredday = coveredday - counter
        print('Cover Expired In ' + str(coveredday) + ' Days In The Past')

        return coveredday

    def generateRandomIntEleven(self):
        randInt = random.randint(0,11)
        return str(randInt)

    def generateRandomIntThirty(self):
        randInt = random.randint(1,30)
        return str(randInt)


    def roundOfNumberCustom(self, num, noOfDecimals):
        from decimal import Decimal
        num = Decimal(str(num))
        return round(num, int(noOfDecimals))

    def get_random_effective_date():
        rand_num = random.randint(10, 60)
        date = datetime.today()
        date = date - timedelta(days=rand_num)
        date = date.__format__('%Y-%m-%dT%H:%M:%S.%fZ')
        return date

