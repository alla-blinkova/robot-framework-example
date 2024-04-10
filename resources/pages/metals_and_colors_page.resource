*** Settings ***
Library         Collections
Library         SeleniumLibrary
Library         ../../libraries/string_utils.py
Library         ../../libraries/metals_and_colors.py
Variables       ../locators/metals_and_colors.py


*** Keywords ***
Fill Summary
    [Arguments]    @{values}
    ${odd_number}    Format Locator    ${odd_numbers}    ${values[0]}
    ${even_number}    Format Locator    ${even_numbers}    ${values[1]}
    Click Element    ${odd_number}
    Click Element    ${even_number}

Fill Color
    [Arguments]    ${color}
    Click Button    ${colors_dropdown_button}
    ${color_option}    Format Locator    ${colors_dropdown_option}    ${color}
    Click Link    ${color_option}
    Element Attribute Value Should Be    ${colors_dropdown_button}    title    ${color}

Fill Metals
    [Arguments]    ${metal}
    Click Element    ${metals_dropdown_toggle}
    ${metal_option}    Format Locator    ${metals_dropdown_option}    ${metal}
    Click Link    ${metal_option}
    Element Attribute Value Should Be    ${metals_dropdown_button}    title    ${metal}

Select Vegetables
    [Arguments]    @{vegetables}
    Click Element    ${vegetables_button}
    FOR    ${vegetable}    IN    @{vegetables}
        ${vegetable_option}    Format Locator    ${vegetable_checkbox}    ${vegetable}
        Click Element    ${vegetable_option}
    END
    Click Element    ${vegetables_label}

Deselect Vegetables
    [Arguments]    @{vegetables}
    Select Vegetables    @{vegetables}

Select Elements
    [Arguments]    @{elements}
    FOR    ${element}    IN    @{elements}
        ${element_to_select}    Format Locator    ${element_checkbox}    ${element}
        Click Element    ${element_to_select}
    END

Deselect Elements
    [Arguments]    @{elements}
    Select Elements    @{elements}

Submit Metals And Colors Form
    Click Button    ${submit_button}

Verify Vegetables Value
    [Arguments]    @{vegetables}
    ${expected_vegetables}    Get expected vegetables    @{vegetables}
    ${actual_vegetables}    Get Text    ${vegetables_button}
    Should Be Equal As Strings    ${actual_vegetables}    ${expected_vegetables}

Verify result
    [Arguments]    &{expected}
    @{result_lines_elements}    Get WebElements    ${result_line}
    @{result_lines_text}    Create List
    FOR    ${element}    IN    @{result_lines_elements}
        Append To List    ${result_lines_text}    ${element.text}
    END
    Log Many    Actual result:    @{result_lines_text}
    ${result}    Verify result lines    ${result_lines_text}    ${expected}
    Should Be True    ${result}
