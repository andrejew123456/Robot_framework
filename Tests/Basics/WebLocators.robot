*** Settings ***
Library        SeleniumLibrary

*** Keywords ***

*** Variables ***



*** Test Cases ***
EBAY
    [Tags]          ebay  chrome  selenium   search   weblocators
    Open Browser    https://www.ebay.pl/     chrome     options=add_argument("--incognito")
    Maximize Browser Window
    Sleep           1s
    #użycie id
    Input Text      id:gh-ac   klocki
    Sleep           3s

    #użycie name
    Input Text      name:_nkw   lego
    Sleep           3s

    #użycie xpath
    Input Text      //*[@id="gh-ac"]   klocki
    Sleep           3s

    #użycie css selector
    Input Text      css:#gh-ac   lego
    Sleep           3s

    #użycie link
    Click Link      link:Kolekcje i Sztuka
    Sleep           3s

    #uzycie partial link
    Click Link      partial link:Komiksy
    Sleep           3s
    Close Browser
