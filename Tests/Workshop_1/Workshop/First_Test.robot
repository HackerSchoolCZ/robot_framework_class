*** Settings ***
Test Setup  Log    Setup      
Test Teardown    Log    Teardown 
Library    SeleniumLibrary 

*** Variables ***
${initial_variable}    Initial Value

*** Test Cases ***
First Test
    Get Time And Print To Log
        
*** Keywords ***
Get Time And Print To Log
    ${local_variable}=    Get Time
    Log    ${local_variable}
    Log    ${initial_variable}    