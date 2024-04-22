*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla operacji myszą
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***
${url}  https://dobrekursy.it/tester-automatyzujacy/
${browser}  chrome

*** Test Cases ***
Browser Testing
    [Tags]           browser  mouse  chrome
    Open Browser     ${url}  ${browser}
    Maximize Browser Window
    Sleep             3s

    # Simulates mouse down on object (highlights object)
    Mouse Over    xpath://*[@id="menu-item-680"]
    Sleep    5s

    # Simulates mouse out of object (unhighlights object)
    Mouse Out    xpath://*[@id="menu-item-680"]
    Sleep    5s

    # Simulates clicking mouse - pressing (down) and releasing (up) left key on mouse
    Mouse Down    xpath://*[@id="menu-item-680"]
    Mouse Up      xpath://*[@id="menu-item-680"]
    Sleep    5s

    # Simulates mouse down on link (highlights link)
    Mouse Down On Link    link:Blog
    Sleep    10s

    Close Browser

    # Simulates mouse down on image
    Open Browser      https://dobrekursy.it/    ${browser}
    Mouse Down On Image    xpath:/html/body/div[2]/div[2]/div[1]/img[2]


    Close Browser