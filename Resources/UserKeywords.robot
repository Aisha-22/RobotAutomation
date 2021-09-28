*** Settings ***
Library  C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/TestData/ReadData.py


*** Keywords ***
Read Number of Row
    [Arguments]  ${sheetname}
    ${maxr} =  fetch_number_of_rows  ${sheetname}
    [Return]  ${maxr}

