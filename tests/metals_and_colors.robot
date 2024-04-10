*** Settings ***
Documentation       Metals and colors tests

Library             SeleniumLibrary
Resource            ../resources/pages/home_page.resource
Resource            ../resources/pages/metals_and_colors_page.resource
Resource            ../resources/test_data/users.resource

Suite Setup         Run keywords    Open Home Page
...                     AND    Login As User    &{default_user}
...                     AND    Select Menu Option    Metals & Colors
...                     AND    Title Should Be    Metal and Colors
Suite Teardown      Close Browser


*** Test Cases ***
Summary form test
    Fill Summary    3    6
    Submit Metals And Colors Form
    Verify result    Summary=9

Dropdowns test
    Fill Color    Yellow
    Fill Metals    Bronze
    Submit Metals And Colors Form
    Verify result    Color=Yellow    Metal=Bronze

Vegetables test
    Verify Vegetables Value    Vegetables
    Deselect Vegetables    Vegetables
    Select Vegetables    Cucumber    Onion
    Verify Vegetables Value    Cucumber    Onion
    Submit Metals And Colors Form
    Verify result    Vegetables=Cucumber, Onion

Checkbox test
    Select Elements    Water    Wind
    Deselect Elements    Wind
    Select Elements    Fire
    Submit Metals And Colors Form
    Verify result    Elements=Water, Fire
