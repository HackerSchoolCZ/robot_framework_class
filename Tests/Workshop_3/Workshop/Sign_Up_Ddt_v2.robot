*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../../Keywords/Automation_Practice/Automation_Practice_Keywords.txt
Variables    ../../../Resources/Automation_Practice/Sign_Up_Data.py
Variables    ../../../Objects/Automation_practice/Automation_Practice.py
Test Setup    Open Eshop Registration Form    ${email}
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${email}    test@hackershool.cz

*** Test Cases ***
Invalid Password
    [Template]    Invalid Value Should Fail
    :FOR    ${pwd}    IN    @{invalid_passwords}
    \    password    ${pwd}    &{valid_data}

Invalid Zip Code
    [Template]    Invalid Value Should Fail
    :FOR    ${zip_code}    IN    @{invalid_zip_codes}
    \    postcode    ${zip_code}    &{valid_data}

Invalid Phone Number
    [Template]    Invalid Value Should Fail
    :FOR    ${phone_num}    IN    @{invalid_phone_numbers}
    \    phone    ${phone_num}    &{valid_data}

*** Keywords ***
Invalid Value Should Fail
    [Arguments]    ${key}    ${value}    &{test_data}
    Set To Dictionary    ${test_data}   ${key}=${value}
    Log    ${test_data}
    Fill In Registration Form    &{test_data}
    Click Button    id=submitAccount
    Page Should Contain    ${invalid_messages["${key}"]}