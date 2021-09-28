*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${Browser}    Chrome
${URL}    http://www.thetestingworld.com/testings

*** Test Cases ***
Robot First Test Case
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    set selenium timeout    20 seconds
    ${tm} =    get selenium timeout
    log to console    ${tm}
    wait until page contains    Testing
    Input Text    name:fld_username    Aisha_H
    Input Text    xpath://input[@name='fld_email']    ash.hlatshwayo22@gmail.com
    Select Radio Button    add_type    office
    Select Checkbox    name:terms
#    Click Link    xpath://a[text()='Read Detail']
    Click Button    xpath://input[@type='submit']

