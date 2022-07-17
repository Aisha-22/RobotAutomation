import json


def read_request_content():
    file = open('C:/Users/Aisha/Postman/Request.json','r')
    jsonfile = file.read()
    json_content = json.loads(jsonfile)
    return json_content

x = read_request_content()
print(x)