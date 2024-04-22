*** Settings ***
Library     SeleniumLibrary
Library     DataDriver   ../TestData/TestData.xlsx   sheet_name=Sheet1

Test Template   Login complete

*** Keywords ***
Login complete
    [Arguments]     ${login}    ${password}   ${page_message}
    Open Browser    https://practicetestautomation.com/practice-test-login/     chrome
    Input Text      //*[@id="username"]    ${login}
    Input Text      //*[@id="password"]    ${password}
    Click Element   //*[@id="submit"]
    Sleep    3s
    Page Should Contain    ${page_message}
    Close Browser

*** Variables ***

*** Test Cases ***
Login Functionality With Excel
    Login complete   ${login}    ${password}   ${page_message}
