*** Settings ***
Documentation       Tables tests

Library             SeleniumLibrary
Resource            ../resources/pages/home_page.resource
Resource            ../resources/pages/simple_table_page.resource
Resource            ../resources/test_data/users.resource

Suite Setup         Run keywords    Open Home Page
...                     AND    Login As User    &{default_user}
Suite Teardown      Close Browser


*** Variables ***
@{product_headers}          Name    Type    Cost    Weight
@{simlpe_table_values}      Asserter    TestNG, JUnit, Custom    MSTest, NUnit, Epam
@{user_table_values}        1    Admin    Roman    Wolverine


*** Test Cases ***
Product table header test
    Select Menu Option    Service
    Select Menu Option    Simple Table
    Title Should Be    Simple Table
    Verify product table headers    @{product_headers}

Simple table content test
    Select Menu Option    Service
    Select Menu Option    Simple Table
    Title Should Be    Simple Table
    Verify simple table row    3    @{simlpe_table_values}

User table content test
    Select Menu Option    Service
    Select Menu Option    User Table
    Title Should Be    User Table
    Verify user table row    1    @{user_table_values}
