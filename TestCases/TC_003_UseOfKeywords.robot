*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Browser}    Chrome
${URL}    http://www.thetestingworld.com/testings

*** Test Cases ***
Robot First Test Case
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    2seconds
    Enter Username Password Email    Aisha_H    ash.hlatshwayo22@gmail.com    123456


*** Keywords ***
Enter Username Password Email
    [Arguments]    ${username}    ${email}    ${password}
    Input Text    name:fld_username    ${username}
    Input Text    xpath://input[@name='fld_email']    ${email}
    Input Text    xpath://*[@id="tab-content1"]/form/input[4]    ${password}

