*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${var1}    http://www.thetestingworld.com
${var2}    http://www.google.com

*** Test Cases ***
TC_006 Handle Muliple Browser
    Open Browser    ${var1}    Chrome
    Maximize Browser Window
    Open Browser    ${var2}    Chrome
    Maximize Browser Window
    switch browser    1
    ${url1} =    get location
    log to console    ${url1}
    switch browser    2
    ${url2} =    get location
    log to console    ${url2}
    close all browsers