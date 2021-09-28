*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${var1}    http://www.thetestingworld.com

*** Test Cases ***
Robot First Test Case
    Open Browser    ${var1}    Chrome
    go to    https://www.google.com
    Maximize Browser Window
    ${URL1} =    get location
    log to console    ${URL1}
    go back
    ${URL1} =    get location
    log to console    ${URL1}

