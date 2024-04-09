*** Settings ***
Documentation       Login form tests

Library             SeleniumLibrary
Resource            ../resources/pages/home_page.resource
Resource            ../resources/test_data/users.resource

Suite Setup         Open Home Page


*** Test Cases ***
Valid login
    Login As User    &{default_user}
    ${user_name}    Get Logged In User
    Should Be Equal    ${user_name}    ROMAN IOVLEV
