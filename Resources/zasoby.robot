*** Settings ***
Documentation       Nasze zasoby
Library             OperatingSystem

*** Keywords ***
jakis keword
    [Arguments]   ${zmienna_ztetsu}
    ${HASLO}   Set Variable   moje haslo
    log   jakas informacja
    Log  ${MOJ_SLOWNIK}[login]
    Log Many  ${MOJ_SLOWNIK}[login]   ${HASLO}
    Log  ${zmienna_ztetsu}


Wpisz login
    Log     ${MOJ_SLOWNIK}[login]

Wpisz haslo
    Log     ${MOJ_SLOWNIK}[haslo]

Wpisz wybrany login
    [Arguments]     ${UZYTKOWNIK}
    Log             ${UZYTKOWNIK}

Wpisz wybrane haslo
    [Arguments]     ${HASLO}
    Log             ${HASLO}

Zaloguj użytkownika 1
    Log     ${MOJ_SLOWNIK}[login]
    Log     ${MOJ_SLOWNIK}[haslo]

Zaloguj użytkownika 2
    Wpisz login
    Wpisz haslo

Zaloguj wybranego użytkownika
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Log             ${USERNAME}
    Log             ${PASSWORD}
    Log Many        ${USERNAME}     ${PASSWORD}

Zaloguj wybranego użytkownika2
    [Arguments]             ${USERNAME}   ${PASSWORD}
    Wpisz wybrany login     ${USERNAME}
    Wpisz wybrane haslo     ${PASSWORD}

*** Variables ***
${MOJA_ZMIENNA}     Hello variable
${MOJA_ZMIENNA2}    Hello second variable

@{MOJA_LISTA}       test1   test2   test3   test4

&{MOJ_SLOWNIK}      login=janek     haslo=12345
&{MOJ_SLOWNIK2}     login=franek    haslo=6789