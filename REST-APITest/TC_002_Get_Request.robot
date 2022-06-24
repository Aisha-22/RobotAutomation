*** Settings ***
Library  RequestsLibrary



*** Variables ***
${App_Base_URL}  https://thetestingworldapi.com/
${StudentID}  28


*** Test Cases ***
TC_002_Fetch_student_details_by_id
    create session  FetchData  ${App_Base_URL}
    ${Response}=  get request  FetchData  api/studentsDetails/${StudentID}
    ${actual_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_code}  200
