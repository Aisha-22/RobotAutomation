*** Settings ***
Library    SeleniumLibrary
Library    C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/ExternalKeywords/Locators.py
Library  C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/TestData/ExcelReader.py


*** Variables ***


*** Keywords ***
Start Browser and Maximize
    [Documentation]    This Keyword is for start Browser and Maximize its Window
    [Arguments]    ${UserURL}
    Open Browser    ${UserURL}    Chrome
    Maximize Browser Window
#Validation (Page Contains & Page should not contains)
    page should contain    VIDEOS
    go to    http://www.thetestingworld.com/testings
    Maximize Browser Window

# Define locatorts in the from of key and value from a JSON File
Read Element Locator
    [Arguments]    ${JsonPath}
    ${result} =    read_locator_from_json  ${JsonPath}
    [Return]    ${result}

# Creating Data Sheet
*** Keywords ***
Read Number of Row
    [Arguments]  ${sheetname}
    ${maxr} =  fetch_number_of_rows  ${sheetname}
    [Return]  ${maxr}

#Fetch Data @ Runtime - Fetch source
Close Browser and get Page source
    ${PageHTML} =    get source
    log    ${PageHTML}
    close browser