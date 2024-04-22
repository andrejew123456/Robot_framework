*** Settings ***
Documentation       Nasz pierwszy prosty test

*** Keywords ***
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
    Log             ${USERNAME}     FAIL
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

*** Test Cases ***
TEST1
    [Tags]  Kurs2
    Log     ${MOJA_ZMIENNA}
    Log     ${MOJA_ZMIENNA2}
    Log     ${MOJA_LISTA}
    Log     ${MOJA_LISTA}[:2]
    Log     ${MOJ_SLOWNIK}[login]
    Log     ${MOJ_SLOWNIK}[haslo]
    Zaloguj użytkownika 1
    Zaloguj użytkownika 2
    Zaloguj wybranego użytkownika   ${MOJ_SLOWNIK}[login]   ${MOJ_SLOWNIK}[haslo]
    Zaloguj wybranego użytkownika   ${MOJ_SLOWNIK2}[login]  ${MOJ_SLOWNIK2}[haslo]
    Zaloguj wybranego użytkownika2  ${MOJ_SLOWNIK}[login]   ${MOJ_SLOWNIK}[haslo]

