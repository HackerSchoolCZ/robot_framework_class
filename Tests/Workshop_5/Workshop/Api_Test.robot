*** Settings ***
Library    ../../../Libraries/Api.py    

*** Test Cases ***
Get Request
    Get Request    https://jsonplaceholder.typicode.com/users 
    ${status_code}=    Get Status Code
    ${json_response}=    Get Response Json
    ${names}=    Get Names 
    Log To Console    ${names}     
    
Get Request With Param
    Get Request    https://jsonplaceholder.typicode.com/users     {"id" : 2}    
    ${status_code}=    Get Status Code
    ${json_response}=    Get Response Json
    ${names}=    Get Names
    Log To Console    ${names}
    
Instance test
    ${names}=    Get Names