*** Settings ***
Documentation  To jest test, w którym testujemy otwieranie przeglądarki i wyszukiwarkę
...            1. Otwieramy przeglądarkę na stronie ebay
...            2. Użytkownik klika na pole do wyszukiwania i wpisuje zadany tekst
...            3. Użytkownik klika na przycisk "SZUKAJ" aby wyświetlić rezultaty
...            4. Weryfikujemy, czy pojawiły się wyniki
...            5. Zamykamy przeglądarkę
Library        SeleniumLibrary
Resource       ../../Resources/zasoby_ebay.resource
Resource       ../../Resources/common.resource

*** Keywords ***

*** Variables ***

*** Test Cases ***
EBAY
    [Tags]          ebay  chrome  selenium   search
    Open Browser    https://www.ebay.pl/     chrome
    Sleep           2s
    Maximize Browser Window
    Sleep           1s
    Input Text      //*[@id="gh-ac"]   klocki
    Sleep           2s
    Click Element   //*[@id="gh-btn"]
    Sleep           3s
    Page Should Contain    Wyniki dla klocki   TRACE
    Close Browser
