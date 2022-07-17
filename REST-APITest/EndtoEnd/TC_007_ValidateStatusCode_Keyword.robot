*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../../../RobotAutomation/Resources/UserKeywordsAPI.robot


*** Variables ***
${App_Base_URL}  https://thetestingworldapi.com/
${StudentID}  28


*** Test Cases ***
TC_002_Fetch_student_details_by_id
    Fetch and Validate Get Status Code  2678800  200
    ${response}=  Fetch and Return Get Response  2678800
    log to console  ${response.content}

