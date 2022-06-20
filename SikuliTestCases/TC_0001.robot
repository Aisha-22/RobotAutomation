*** Settings ***
Library            SikuliLibrary     mode=NEW

*** Variables ***


*** Test Cases ***
TC_0001 Start Browser on Windows
    Start Sikuli Process
    Add Image Path  C:\Users\Aisha\Desktop\SikuliImages
    #sleep  10 seconds
    Wait Until Screen Contain  Start.png  10
    Double Click  Start.png