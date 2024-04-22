*** Settings ***
Documentation       Nasz drugi prosty test
Resource            ../../Resources/zasoby.robot

*** Test Cases ***
TEST1
    [Tags]  Kurs2   zasoby
    Zaloguj wybranego użytkownika2  ${MOJ_SLOWNIK}[login]   ${MOJ_SLOWNIK}[haslo]

