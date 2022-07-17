*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${base_url}  https://thetestingworldapi.com/
${original_first_name}  Kathie
${update_first_name}  Angie


*** Test Cases ***
TC_006 End_to_End_TestCase
    [Documentation]  This testcase is for E2E Scenario using Post | Put | Delete & Get
    create session  End to End Scenario  ${base_url}
    &{header}=  create dictionary  Content-Type=application/json
    &{body}=  create dictionary  first_name=${original_first_name}  middle_name=Debbie  last_name=Roland  date_of_birth=12/12/1993
    ${post_response}=  post request  End to End Scenario  api/studentsDetails  headers=${header}  data=${body}
    ${json_response}=  to json  ${post_response.content}
    @{id_list}=  get value from json  ${json_response}  id
    log to console  ${id_list}
    ${id}=  get from list  ${id_list}  0

    &{body1}=  create dictionary  id=${id}  first_name=${update_first_name}  middle_name=Debbie  last_name=Roland  date_of_birth=12/12/1993
    ${put_response}=  put request  End to End Scenario  api/studentsDetails/${id}  headers=${header}  data=${body1}
    log to console  ${put_response.content}
    log to console  ${put_response.status_code}

    Fetch Details and Validate  ${id}

    ${delete_response}=  delete request  End to End Scenario  api/studentsDetails/${id}
    ${json_delete}=  to json  ${delete_response.content}
    ${Message}=  get value from json  ${json_delete}  status
    ${statusM}=  get from list  ${Message}  0
    should be equal  ${statusM}  true


*** Keywords ***
Fetch Details and Validate
    [Arguments]  ${id}
    ${get_request}=  get request  End to End Scenario  api/studentsDetails/${id}
    ${json_response}=  to json  ${get_request.content}
    @{Lfirst_name}=  get value from json  ${json_response}  data.first_name
    ${first_name}=  get from list  ${Lfirst_name}  0
    should be equal  ${first_name}  ${update_first_name}