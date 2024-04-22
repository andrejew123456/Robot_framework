*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla przeglądarek internetowych
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***
${url}  https://dobrekursy.it/tester-automatyzujacy/
${browser}  chrome

*** Test Cases ***
Browser Testing
    [Tags]           browser  edge  chrome
    Open Browser     ${url}  ${browser}
    Maximize Browser Window
    Sleep             3s
    Close Browser
    Open Browser     ${url}  edge
    Maximize Browser Window
    Sleep             3s
    Close Browser

    # Assign aliases for current sessions
    Open Browser      https://robotframework.org/SeleniumLibrary/  ${browser}   alias=ChromeSeleniumLibrary
    Sleep             3s
    Open Browser      https://robotframework.org/SeleniumLibrary/  edge   alias=EdgeSeleniumLibrary
    Set Browser Implicit Wait    3
    Sleep             3s

    # Reads aliases and assigns them to alias variable (this is dictionary)
    &{alias}    Get Browser Aliases
    Log    ${alias}

    # Reads browser IDs and assigns them to browserId variable (this is list)
    @{browserId}    Get Browser Ids
    Log    ${browserId}

    # Switches between opened browsers by index or alias
    Switch Browser    ChromeSeleniumLibrary

    Close All Browsers