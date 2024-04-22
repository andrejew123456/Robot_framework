*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

*** Variables ***

*** Test Cases ***
ProperLogin
    Open Browser    https://practicetestautomation.com/practice-test-login/     chrome
    Input Text      //*[@id="username"]    student
    Input Text      //*[@id="password"]    Password123
    Click Element   //*[@id="submit"]
    Page Should Contain    Logged In Successfully
    Sleep    3s
    Close Browser

WrongLogin
    Open Browser    https://practicetestautomation.com/practice-test-login/     chrome
    Input Text      //*[@id="username"]    studentka
    Input Text      //*[@id="password"]    Password123
    Click Element   //*[@id="submit"]
    Page Should Contain    Your username is invalid!
    Sleep    3s
    Close Browser

WrongPassword
    Open Browser    https://practicetestautomation.com/practice-test-login/     chrome
    Input Text      //*[@id="username"]    student
    Input Text      //*[@id="password"]    Pass
    Click Element   //*[@id="submit"]
    Page Should Contain    Your password is invalid!
    Sleep    3s
    Close Browser