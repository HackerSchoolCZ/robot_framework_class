*** Settings ***
Library    ../../../Libraries/Library.py    

*** Test Cases ***
First Test Case
    Just Call
    Log Input    Sent from our awesome test!!!!
    Compare Something    4
    ${from_outside}=    Add Values    4    5
    Log To Console    ${from_outside}    