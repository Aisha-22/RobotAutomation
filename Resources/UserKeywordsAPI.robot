*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../ReadContent/ReadJsonContent.py


*** Variables ***
${base_url}  https://thetestingworldapi.com/


*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]  ${stdentId}  ${expectedStatusCode}
    [Documentation]  This test cases is to get and Validate Student Details
    create session  SessionName  ${base_url}
    ${response}=  get request  SessionName  api/studentsDetails/${stdentId}
    ${statusCode}=  convert to string  ${response.status_code}
    should be equal  ${expectedStatusCode}  ${statusCode}

Fetch and Return Get Response
    [Arguments]  ${stdentId}
    create session  SessionName  ${base_url}
    ${response}=  get request  SessionName  api/studentsDetails/${stdentId}
    ${statusCode}=  convert to string  ${response.status_code}
    [Return]  ${statusCode}

Fetch Request Content
    ${jsonBody}=  read_request_content
    [Return]  ${jsonBody}

Welcome User
    [Documentation]  Executing New Test Case
    log to console  This is Starting of TestCase

End Test Case
    [Documentation]  TestCase Completed
    log to console  This is Ending of TestCase