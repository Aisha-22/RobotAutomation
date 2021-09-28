*** Settings ***
Library  RequestsLibrary


*** Variables ***
${App_Base_URL}  http://thetestingworldapi.com/
${StudentID}  28


*** Test Cases ***
TC_009_Fetch_Student_details_by_id
    Create Session  FetchData  ${App_Base_URL}
    ${response} =  GET On Session  FetchData  studentsDetails/${StudentID}
    ${actual_code} =  convert to string  ${response.status_code}
    should be equal  ${actual_code}  200


