*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***


*** Test Cases ***
TC_004 Variable Test
#Define and Display Variables
    ${Var1} =    set variable    HelloWorld
    log to console    ${Var1}

#Define and Using List
    @{List1}    create list    Hello    22    23.23    World    Abcd1234
    ${List_Length}    get length    ${List1}
    log to console    ${List_Length}

#Getting data from the list
    ${List_Data} =    get from list    ${List1}    3
    log to console    ${List_Data}

#Running a For Loop
    :FOR    ${i}    IN RANGE    1    10
     \      Log to console    ${i}

    @{List1}    create list    Hello    22    23.23    World    Abcd1234
    :FOR    ${i}    IN    ${List1}
     \      Log to console    ${i}


#Conditionally RunKeyword
#    Storing keyword to a variable
    ${Key_var} =    set variable    log to console
#    Run keyword stored into the variable
    run keyword    ${Key_var}    ash.hlatshwayo22@gmail.com

#   Run Keyword if
    ${var} =    set variable    YES
    run keyword if    '${var}'=='YES'    log to console    Value Found
    run keyword if    '${var}'=='NO'  log toconsole  Value not Found

    ${var} =    set variable    NO
    run keyword if    '${var}'=='YES'    log to console    Value Found
    run keyword if    '${var}'=='NO'  log toconsole  Value not Found

*** Keywords ***


