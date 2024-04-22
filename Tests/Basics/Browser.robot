*** Settings ***
Documentation  To jest test, w którym testujemy otwieranie przeglądarki
...            Tutaj mamy miejsce na drugą linię
Library  SeleniumLibrary
*** Keywords ***

*** Variables ***

*** Test Cases ***
Otwieramy przeglądarkę
    [Documentation]  To jest test, w którym testujemy otwieranie przeglądarki
    ...              Tutaj mamy miejsce na drugą linię
    [Tags]           chrome  google  browser
    Open Browser     https://www.google.com/  chrome
#    sleep  3s
#    Click Element     xpath://*[@id="W0wltc"]/div
#    Click Element    xpath:/html/body/div[1]/div[3]/form/div[1]/div[1]/div[4]/center/input[1]
    Close Browser
