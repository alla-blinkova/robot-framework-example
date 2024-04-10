*** Settings ***
Library         SeleniumLibrary
Library         ../../libraries/string_utils.py
Resource        login_form.resource
Variables       ../locators/home_page.py
Variables       ../../config/config.py


*** Keywords ***
Open Home Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Home Page

Login As User
    [Arguments]    &{user}
    Open Login Form
    Fill Username    ${user.login}
    Fill Password    ${user.password}
    Click Enter

Open Login Form
    Click Element    ${profile_icon}

Select Menu Option
    [Arguments]    ${name}
    ${menu_option}    Format Locator    ${menu_link}    ${name}
    Click Element    ${menu_option}

Get Logged In User
    Wait Until Element Is Visible    ${user_name}
    ${actual_user_name}    Get Text    ${user_name}
    RETURN    ${actual_user_name}
