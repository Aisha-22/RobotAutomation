*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}  https://thetestingworldapi.com/


*** Test Cases ***
TC_004 Create New Resource
    create session  AddData  ${base_url}
    &{body}=  create dictionary  first_name=Plane  middle_name=Jane  last_name=July  date_of_birth=12/12/1991
    &{header}=  create dictionary  Content-Type=application/json

    ${response}=  post request  AddData  api/studentsDetails  data=${body}  headers=${header}
    log to console  ${response.content}
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201
