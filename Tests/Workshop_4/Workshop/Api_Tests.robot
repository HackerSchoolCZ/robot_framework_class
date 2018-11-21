*** Settings ***
Library    REST    https://jsonplaceholder.typicode.com
Test Teardown    Teardown
Variables    ../../../Resources/Api/new_users.py

*** Variables ***
${new_user}    {"id": 11,"name": "John Doe"}

*** Keywords ***
Template For New Users
    [Arguments]    ${new_user}
    POST    /users    ${new_user}
    Integer    response status    201
    
Teardown
    Output    response body    ${OUTPUTDIR}/Tests/Workshop_4/Workshop/response.json
    Output    request    ${OUTPUTDIR}/Tests/Workshop_4/Workshop/request.json
    
*** Test cases ***
Many New Users
    [Template]    Template For New Users
    :FOR    ${user}    IN   @{new_test_users}
    \    ${user}

Update User
    PATCH    /users/2    {"name":"John Doe"}
    String    response body name    John Doe


Add New Fields To User
    PUT    /users/1    {"new_field":"123234", "money": 100, "single" : true}
    Integer    response body money    100
    Boolean    response body single    true

Create New User
    POST    /users    ${new_user}
    
Delete A User
    DELETE    /users/1
    Integer    response status    200    202    204
    
Verify Required Fields
    GET    /users/1
    Object    response body    required=["id", "name"]
    Expect Response Body    {"required":["id","name"]}
    Clear Expectations

Get One User
    GET    /users/1
    Object    response body
    String    response body name    Leanne Graham
    Integer    response status    200
    
Simple Get
    Set Headers    {"authorization":"dasdasda"}
    GET    /users