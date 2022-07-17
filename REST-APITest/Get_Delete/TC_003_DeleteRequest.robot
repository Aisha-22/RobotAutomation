*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../../RobotAutomation/Resources/UserKeywordsAPI.robot


*** Variables ***
${base_url}  https://thetestingworldapi.com/


*** Test Cases ***
TC_003 Validate Delete
    [Setup]  Welcome User
    [Teardown]  End Test Case
    [Tags]  Smoke  Regression
    create session  AppAccess  ${base_url}
    ${response}=  delete request  AppAccess  api/studentsDetails/32
    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  200
    ${jsonresponse}=  to json  ${response.content}
    @{status_list}=  get value from json  ${jsonresponse}  status
    ${status}=  get from list  ${status_list}  0
    should be equal  ${status}  false