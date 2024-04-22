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
Test Setup     Open And Maximize Browser
Test Teardown  Close Browser After Test
#Variables      ../../Resources/WebElements.py

*** Keywords ***
Search given phrase in the search box
    Input Text       ${xpath_objects}[search_box]   ${search_phrase}
    Sleep            2s
    Click Element    ${xpath_objects}[search_button]
    Sleep            3s

Check if Page contains given element
    Page Should Contain    ${search_result_checker} ${search_phrase}  TRACE

Mark "Kup Teraz" button
    Click Element    ${xpath_objects}[kup_teraz_button]
    Sleep            2s

Mark "Stan:Nowy" in the checkbox
    Select Checkbox  ${xpath_objects}[stan_nowy]
    Sleep            2s

Limit results for price up to 100 zl
    Input Text       ${xpath_objects}[price_box]    ${price}
    Sleep            3s
    Press Keys       ${xpath_objects}[zakres_cen_button]   RETURN
    Sleep            3s

*** Variables ***
${search_phrase}    klocki
${url}              https://www.ebay.pl/
${browser}          chrome
${search_result_checker}    Wyniki dla
${price}            100

&{xpath_objects}     search_box=//*[@id="gh-ac"]
...                  search_button=//*[@id="gh-btn"]
...                  kup_teraz_button=//*[@id="mainContent"]/div[1]/div/div[2]/div[2]/div[1]/div/ul/li[3]/a/span
...                  stan_nowy=//*[@id="x-refine__group__1"]/ul/li[1]/div/a/div/span/input
...                  price_box=//*[@id="s0-53-16-0-1-2-6-2-8[2]-0-textrange-endParamValue-textbox"]
...                  zakres_cen_button=//*[@id="s0-53-16-0-1-2-6-2-8[2]-0-textrange-endParamValue-textbox"]

*** Test Cases ***
EBAY
    [Tags]           ebay  chrome  selenium   search
    Search given phrase in the search box
    Check if Page contains given element
    Mark "Kup Teraz" button
    Mark "Stan:Nowy" in the checkbox
    Limit results for price up to 100 zl