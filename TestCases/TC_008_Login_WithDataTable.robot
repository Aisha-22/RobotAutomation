*** Settings ***
Library    SeleniumLibrary
Resource  C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/Resources/UserKeywords.robot


*** Variables ***
${var1}    http://www.thetestingworld.com

*** Test Cases ***
TC_008_Login Logout Functionality
    Open Browser    ${var1}    Chrome
    maximize browser window
    click element  xpath://a[contains(text(),'Login')]

    ${row} =  Read Number of Row  Sheet1

     FOR    ${i}    IN RANGE    1    ${row}+1
            ${username} =  Read Excel Data of Cell  Sheet1  ${i}  1
            ${password} =  Read Excel Data of Cell  Sheet1  ${i}  2
            input text  id:username  ${username}
            input text  id:password  ${password}
            click button  xpath://button[contains(text(),'Log in')]
            sleep  5 seconds
     END
    capture page screenshot    ./SnapShots/Login.png
    close browser

*** Keywords ***
Read Excel Data of Cell
    [Arguments]  ${sheetname}  ${row}  ${cell}
    ${celldata} =  fetch_cell_data  ${sheetname}  ${row}  ${cell}
    [Return]  ${celldata}