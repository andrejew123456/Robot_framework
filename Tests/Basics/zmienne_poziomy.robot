*** Settings ***

*** Variables ***
${ZMIENNA_TEST_SUITE}   to jest zmienna dla test suite
${ZMIENNA_GLOBALNA}     Set Global Variable     to jest zmienna dla wszystkich testow

*** Keywords ***
Keyword dla zmiennych
    [Arguments]     ${zmienna_lokalna}=to jest zmienna lokalna keywordowa
    Log    ${ZMIENNA_GLOBALNA}

*** Test Cases ***
Pierwszy test
    ${zmienna_lokalna}  Set Variable   to jest zmienna lokalna
    Log    ${zmienna_lokalna}

Drugi test
    Log    ${ZMIENNA_GLOBALNA}

Trzeci test
    Keyword dla zmiennych