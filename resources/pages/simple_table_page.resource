*** Settings ***
Library         Collections
Library         SeleniumLibrary
Library         ../../libraries/string_utils.py
Variables       ../locators/simple_table.py


*** Keywords ***
Verify product table headers
    [Arguments]    @{header_values}
    FOR    ${header_value}    IN    @{header_values}
        Table Header Should Contain    ${product_table}    ${header_value}
    END

Verify simple table row
    [Arguments]    ${row_number}    @{row_values}
    Verify table row    ${support_table}    ${row_number}    @{row_values}

Verify user table row
    [Arguments]    ${row_number}    @{row_values}
    Verify table row    ${user_table}    ${row_number}    @{row_values}

Verify table row
    [Arguments]    ${table}    ${row_number}    @{row_values}
    FOR    ${row_value}    IN    @{row_values}
        Table Row Should Contain    ${table}    ${row_number}    ${row_value}
    END
