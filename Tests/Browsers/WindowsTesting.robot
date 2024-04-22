*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla przeglądarek internetowych i ich okien oraz kart
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***
${url}  https://www.pepper.pl/
${browser}  chrome

*** Test Cases ***
Browser Testing
    [Tags]           browser   windows  chrome
    Open Browser     ${url}  ${browser}
    Sleep    2s
    Click Element    xpath:/html/body/div[1]/div[2]/div/section/div/div/div/div/div/div[2]/div[2]/button[1]
    Click Element    xpath://*[@id="toc-target-deals"]/div[2]/div[1]/div/section/div/div/div/div/div/div[1]/div[2]/a/span
    Maximize Browser Window
    Sleep             2s

    # Reads window handles and assigns them to windowHandles variable (this is list)
    @{windowHandles}    Get Window Handles
    Log    ${windowHandles}

    # Reads window identifiers and assigns them to windowIdentifier variable (this is list)
    @{windowIdentifier}    Get Window Identifiers
    Log    ${windowIdentifier}

    # Reads window names and assigns them to windowNames variable (this is list)
    @{windowNames}    Get Window Names
    Log    ${windowNames}

    # Reads window titles and assigns them to windowTitles variable (this is list)
    @{windowTitles}    Get Window Titles
    Log    ${windowTitles}
    Sleep  5

    # Sets window positions by x and y
    Set Window Position    200    300
    Sleep             3s
    
    ${x}    ${y}   Get Window Position
    Log    ${x}
    Log    ${y}

    # Sets window size by width and length
    Set Window Size    700    400
    Sleep             3s

    ${width}    ${height}   Get Window Size
    Log    ${width}
    Log    ${height}

#    Switch Window   @{windowHandles}[0]

    Close All Browsers