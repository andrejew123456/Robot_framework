*** Settings ***
Library     SeleniumLibrary
Resource    ../TestData/TestData.resource
Library     DataDriver  ../TestData/TestData.xlsx   sheet_name=Sheet1

Test Template   Login complete
#przed kazdy  suitem bedzie odpalal to
Suite Setup     TestData.Open And Maximize Browser
Suite Teardown  TestData.Close Browser After Tests
#to po wszytskich testach

*** Keywords ***
Login complete
    [Arguments]     ${login}    ${password}   ${page_message}
    Input Text      ${login_locator}    ${login}
    Input Text      ${password_locator}    ${password}
    Sleep    3s
    Click Element   ${submit_locator}
    Sleep    3s
    Page Should Contain    ${page_message}

*** Variables ***

*** Test Cases ***
Login Functionality With Excel
    Login complete   ${login}    ${password}   ${page_message}