*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser To Mahara
Test Teardown   Capture Screenshot And Close Browser
Resource    ../../../Keywords/Mahara/Mahara_Keywords.txt   
Variables    ../../../Settings/Mahara/Credentials.py
Variables    ../../../Objects/Mahara/Mahara_Page_Objects.py     

*** Test Cases ***
Mahara Invalid Login
    Login To Mahara    ${invalid_user}    ${invalid_password}
    Wait Until Page Contains Element    ${err_messages}
    Page Should Contain    You have not provided the correct credentials to log in. Please check your username and password are correct.
    Page Should Contain    There was an error with submitting this form. Please check the marked fields and try again. 
    
Mahara Admin Login
    Login To Mahara    ${admin_user}    ${admin_password}
    Verify User Logged In    ${admin_name} 
    
Mahara Student Login
    Login To Mahara    ${student_user}    ${student_password}
    Verify User Logged In    ${student_name}