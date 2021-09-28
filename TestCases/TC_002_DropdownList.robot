*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Resources1.robot
Library    C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/ExternalKeywords/Locators.py



*** Variables ***


*** Test Cases ***
Robot First Test Case
    [Documentation]    This test cases is to check registration functionality of Application
    Start Browser and Maximize    http://www.thetestingworld.com
#Validate Titel of the page
#    title should be     Login & Sign Up Forms
    ${Title} =    Get Title
    log    ${Title}
#Implicitly Wait
    ${default_T} =    get selenium implicit wait
    log to console    ${default_T}
    set selenium implicit wait    20 seconds
    ${default_T} =    get selenium implicit wait
    log to console    ${default_T}
# EndToEnd Process =: Test case is going to pass JSON Path, to user defind KEYWORD which is 'Read Element Locator' keyword will use the JSON Path and call Python fuction read_locator_from_json
    ${row} =  Read Number of Row  Sheet1

    FOR    ${i}    IN RANGE    1    ${row}+1
            ${username1} =  Read Excel Data of Cell  Sheet1  ${i}  1
            ${email1} =  Read Excel Data of Cell  Sheet1  ${i}  2
            ${password1} =  Read Excel Data of Cell  Sheet1  ${i}  3
            ${password2} =  Read Excel Data of Cell  Sheet1  ${i}  4
            ${dateofbirth} =  Read Excel Data of Cell  Sheet1  ${i}  5
            ${contact} =  Read Excel Data of Cell  Sheet1  ${i}  6
            ${address} =  Read Excel Data of Cell  Sheet1  ${i}  7
            ${zipcode} =  Read Excel Data of Cell  Sheet1  ${i}  8
            ${username} =    Read Element Locator    Registration.username_textbox_name
            Input Text    name:${username}    ${username1}
            ${email} =    Read Element Locator    Registration.email_textbox_name
            Input Text    name:${email}    ${email1}
            ${password} =    Read Element Locator    Registration.password_textbox_name
            Input Text    name:${password}    ${password1}
            Input Text    xpath://*[@id="tab-content1"]/form/input[5]    ${password2}
            Input Text    //input[@name="dob"]    ${dateofbirth}
            Input Text    xpath://*[@id="tab-content1"]/form/input[7]    ${contact}
            Input Text    xpath://*[@id="tab-content1"]/form/input[8]    ${address}
            Select Radio Button    add_type    home
            Select From List By Label    name:sex    Female
            Select From List By Value    //select[@name="country"]    202
            Select From List By Value    //select[@name="state"]    3240
            Select From List By Value    //select[@name="city"]    38049
            Input Text    //input[@name="zip"]    ${zipcode}
            capture page screenshot    ./SnapShots/TC1.png
            Select Checkbox    name:terms
#Validate checkbox is selected
            checkbox should be selected    name:terms
#Execute JavaScript at Runtime
            execute javascript    window.scrollTo(0,200)
#    Click Link    xpath://a[text()='Read Detail']
            capture page screenshot    ./SnapShots/TC2.png
            Click Button    xpath://input[@type='submit']
            sleep  5 seconds
     END

#Take Screenshot at Runtime
    capture page screenshot    ./SnapShots/TC3.png

#Fetch Data @ Runtime - Fetch source
    Close Browser and get Page source

*** Keywords ***
Read Excel Data of Cell
    [Arguments]  ${sheetname}  ${row}  ${cell}
    ${celldata} =  fetch_cell_data  ${sheetname}  ${row}  ${cell}
    [Return]  ${celldata}

