*** Settings ***
Documentation       Login form tests

Library             SeleniumLibrary
Resource            ../resources/pages/home_page.resource
Resource            ../resources/pages/login_form.resource
Resource            ../resources/test_data/users.resource

Test Setup          Open Home Page
Test Teardown       Close Browser


*** Test Cases ***
Valid login test
    Login As User    &{default_user}
    ${user_name}    Get Logged In User
    Should Be Equal    ${user_name}    ROMAN IOVLEV

Invalid login test
    Login As User    &{invalid_user}
    ${error_message}    Get Error Message
    Should Be Equal    ${error_message}    * Login Faild

Logout test
    Login As User    &{default_user}
    Logout
