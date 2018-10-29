*** Settings ***
Library    Dialogs  

*** Variables ***
${dialog_value}    ${EMPTY}
${user_value}    Default  

*** Test Cases ***
Open Dialog And Compare Values
    Open Dialog
    Compare Values
           
*** Keywords ***
Open Dialog
    ${dialog_value}=    Get Value From User    Please Insert Value For Comparison
    Set Global Variable    ${dialog_value}    
    
Compare Values
    Should Be Equal As Strings    ${dialog_value}    ${user_value}    Values are not equal   