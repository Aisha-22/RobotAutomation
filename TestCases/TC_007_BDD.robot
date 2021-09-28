*** Settings ***
Resource    C:/Users/user/PycharmProjects/pythonProject/pythonProject/RobotAutomation/Resources/Resources1.robot


*** Variables ***


*** Test Cases ***
Test Case in BDD Format
    Given Start Browser and Maximize  http://www.thetestingworld.com
    When Read Element Locator  JsonPath
    Then Close Browser and get Page source



