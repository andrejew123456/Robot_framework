*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}                   https://practicetestautomation.com/practice-test-login/
${browser}               chrome
${login_locator}         //*[@id="username"]
${password_locator}      //*[@id="password"]
${submit_locator}        //*[@id="submit"]

*** Keywords ***
Open And Maximize Browser
    Open Browser    ${url}  ${browser}
    Maximize Browser Window

Close Browser After Tests
    Close Browser