*** Settings ***
Documentation       Nasz pierwszy Test Suite
Library             OperatingSystem
#Library    SeleniumLi
Resource          ../../Resources/zasoby.robot
Resource       ../../Resources/common.resource
Test Tags           web
Test Setup    Open And Maximize Browser

Test Teardown  Close All Browsers

*** Variables ***

${zmienna3}   hello

*** Keywords ***
przywitanie
    [Arguments]   ${zmienna4}
    Log  dzien dobry
    Log  jak sie masz
    Log  do widzenia
    Log   ${zmienna3}
    Log   ${zmienna4}



*** Test Cases ***
TEST1
    [Tags]  hello   eng
    Log     Dzień dobry kursanci, hello test
    Log  ${zmienna3}

#TEST2
#    [Tags]  hello   pl
#    Set Tags    kot
#    Log     Witam w drugim teście
#    Remove Tags  hello
#    ${zmienna3}  Set Variable   zmienna lokalna
#    Log  ${zmienna3}
#    przywitanie  idzie wiosna
#    Wpisz login
#    Log   ${MOJA_ZMIENNA}
#    jakis keword  nowa zmienna z poziomu testu


Test3
    lOG  OTWIERAMIE PRZEGLADarki
#    Open Browser   https://skleptest.pl/my-account/   ch/rome
    Open Browser    www.google.com     chrome



#    Set Tags    kot