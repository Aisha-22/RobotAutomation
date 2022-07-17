*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../../RobotAutomation/Resources/UserKeywordsAPI.robot
Documentation  This suite is for Making Get Request and fetch student details
Suite Setup  Welcome User
Suite Teardown  End Test Case
Force Tags  Hello


*** Variables ***
${App_Base_URL}  https://thetestingworldapi.com/
${StudentID}  28


*** Test Cases ***
TC_002_Fetch_student_details_by_id
    [Tags]  Smoke  Sanity
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200

    ${json_res}=  to json  ${Response.content}

    @{first_name_list}=  get value from json  ${json_res}  data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  Test Student

    @{last_name_list}=  get value from json  ${json_res}  data.last_name
    ${last_name}=  get from list  ${last_name_list}  0
    log to console  ${last_name}
    should be equal  ${last_name}  Automation

TC_002_Fetch_student_details_by_Name
    [Tags]  Smoke
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
