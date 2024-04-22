*** Settings ***
Documentation       Nasz pierwszy prosty test
Library             OperatingSystem
Library    SeleniumLibrary

*** Keywords ***
zaloguj wybranego uzytkowinka
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Log             ${USERNAME}
    Log Many        ${USERNAME}     ${PASSWORD}


*** Variables ***
${Mojazmienna}      Hello variable
@{MOJA_LISTA}       test1   test2   test3
&{MOJ_SLOWNIK1}     login=janek    haslo=12345
&{MOJ_SLOWNIK2}     login=franek    haslo=6789

*** Test Cases ***
TEST2
    [Tags]  Kurs67  slajd23
    Log     Dzien dobry kursanci, hello test, ${Mojazmienna}
    Log     ${Mojazmienna}
    zaloguj wybranego uzytkowinka   ${MOJ_SLOWNIK1}[login]  ${MOJ_SLOWNIK1}[haslo]
    zaloguj wybranego uzytkowinka   ${MOJ_SLOWNIK2}[login]  ${MOJ_SLOWNIK2}[haslo]
    Log Many


