*** Settings ***
Documentation  To jest test, w którym testujemy otwieranie przeglądarki i wyszukiwarkę
...            1. Otwieramy przeglądarkę na stronie ebay
...            2. Użytkownik klika na pole do wyszukiwania i wpisuje zadany tekst
...            3. Użytkownik klika na przycisk "SZUKAJ" aby wyświetlić rezultaty
...            4. Weryfikujemy, czy pojawiły się wyniki
...            5. Zaznaczamy opcję, aby były wyświetlane wyniki dla opcji "kup teraz"
...            6. Zaznaczamy opcję z checkboxa "Nowy"
...            7. Wpisujemy w pole Maks zł - 100, aby wyświetlić wyniki dla cen do 100 zł
...            8. Klikamy przycisk zatwierdź zakres cen - strzałka przy polu z ceną Maks
...            9. Zamykamy przeglądarkę
Library        SeleniumLibrary
Resource       ../../Resources/zasoby_ebay.resource
Resource       ../../Resources/common.resource

*** Keywords ***

*** Variables ***
${xpath1}   //*[@id="gh-ac"]
*** Test Cases ***
EBAY
    [Tags]          ebay  chrome  selenium   search
    Open Browser    https://www.ebay.pl/     chrome      options=add_argument("--incognito")
    Sleep           2s
    Maximize Browser Window
    Sleep           1s
    Input Text      ${xpath1}   klocki
    Sleep           2s
    Click Element   //*[@id="gh-btn"]
    Sleep           3s
    Page Should Contain    Wyniki dla klocki   TRACE
    Click Element    //*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[1]/div/ul/li[3]/a/span
    Sleep           2s
    Select Checkbox  //*[@id="x-refine__group__1"]/ul/li[1]/div/a/div/span/input
    Sleep           2s
    Input Text       //*[@id="s0-53-16-0-1-2-6-2-8[2]-0-textrange-endParamValue-textbox"]    100
    Sleep           3s
    Press Keys      //*[@id="s0-53-16-0-1-2-6-2-8[2]-0-textrange-endParamValue-textbox"]    RETURN
    Sleep           6s
    Close Browser