*** Settings ***
Library         SeleniumLibrary
Variables       ../locators/login_form.py


*** Keywords ***
Fill Username
    [Arguments]    ${login}
    Input Text    ${login_field}    ${login}

Fill Password
    [Arguments]    ${password}
    Input Text    ${password_field}    ${password}

Click Enter
    Click Element    ${login_button}
