*** Settings ***
Documentation       Nasz pierwszy prosty test
Library             OperatingSystem
Resource            ../../Resources/common.resource

*** Keywords ***

#zaloguj uzytkownika
#        [Arguments]   ${USERNAME}  ${USERNAME2}
#        Log   loguj uzytkonika
#        Log   ${USERNAME}
#        Log Many  ${USERNAME}   ${USERNAME2}
#
#
#drugi keyword
#    [Arguments]   ${USERNAME}
#    zaloguj uzytkownika   ${USERNAME}  ${USERNAME}
#    Log  uzyjemy keyworda

*** Variables ***
${Mojazmienna}      Hello variable
${Mojazmienna2}      Hello second variable
&{MOJ_SLOWNIK}      login=janek    hasl=12345

*** Test Cases ***
TEST2
    [Tags]  Kurs
    Log     Dzien dobry kursanci, hello test, ${Mojazmienna}
    Log     ${Mojazmienna2}
    Log    ${MOJ_SLOWNIK}[login]
    zaloguj uzytkownika         ${MOJ_SLOWNIK}[login]  ${Mojazmienna2}
    drugi keyword               ${Mojazmienna}

