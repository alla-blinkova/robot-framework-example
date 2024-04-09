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

Logout
    Click Element    ${logout_button}
    Element Should Be Visible    ${login_field}

Get Error Message
    Wait Until Element Is Visible    ${error_message}
    ${actual_error}    Get Text    ${error_message}
    RETURN    ${actual_error}
