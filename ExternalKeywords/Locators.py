import json
import jsonpath


# Create a function (Method will accept JSON Path from the test case)
def read_locator_from_json(locatorname):
    f = open('C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/JsonFiles/Elements.json')
    response = json.loads(f.read())
    # Methods (Fetch JSON Path value from the file and return the value)
    value = jsonpath.jsonpath(response, locatorname)
    return value[0]
