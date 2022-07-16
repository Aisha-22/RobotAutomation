*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}  https://thetestingworldapi.com/


*** Test Cases ***
TC_005 Create New Resource
    create session  AddData  ${base_url}
    &{body}=  create dictionary  id=2678210  first_name=Kevin  middle_name=Hearts  last_name=July  date_of_birth=12/12/1992
    &{header}=  create dictionary  Content-Type=application/json

    ${response}=  put request  AddData  /api/studentsDetails/2678210  data=${body}  headers=${header}
    log to console  ${response.status_code}
#    ${code}=  convert to string  ${response.status_code}
#    should be equal  ${code}  201
    log to console  ${response.content}

    ${response1}=  get request  AddData  /api/studentsDetails/2678210
    log to console  ${response1.content}