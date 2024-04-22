*** Settings ***
Documentation  To jest test, w którym testujemy otwieranie przeglądarki i wyszukiwarkę
...            1. Otwieramy przeglądarkę na stronie allegro
...            2. Użytkownik klika na pole do wyszukiwania i wpisuje zadany tekst
...            3. Użytkownik klika na przycisk "SZUKAJ" aby wyświetlić rezultaty
...            4. Weryfikujemy, czy pojawiły się wyniki
...            5. Zamykamy przeglądarkę
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***

*** Test Cases ***
ALLEGRO
    [Tags]          allegro  chrome  selenium   search
    Open Browser    https://allegro.pl/     chrome      options=add_argument("--incognito")
    Sleep           4s
    Click Button    //*[@id="opbox-gdpr-consents-modal"]/div/div[2]/div/div[2]/button[2]
    Sleep           5s
    Input Text      xpath://html/body/div[2]/div/div/div/div[3]/header/div[1]/div/div/div/form/input    klocki
    Sleep           10s
    Click Element   xpath:/html/body/div[2]/div/div/div/div[3]/header/div[1]/div/div/div/form/button
    Sleep           10s
    Page Should Contain    klocki   TRACE
    Sleep           10s
    Close Browser