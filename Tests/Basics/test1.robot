*** Settings ***
Documentation  Test case number 1
Library    OperatingSystem
Library    SeleniumLibrary
Resource  ../../Resources/zasoby.robot
Resource   ../../Resources/common.resource


*** Keywords ***
otworz przegladarke
    [Arguments]   ${zmienna}  ${password}
    Log  otwieranie przegladarki
#    Open Browser   https://demoqa.com/automation-practice-form   Chrome
    Log Many   ${password}   ${zmienna}
    Log        ${zmienna}

drugi nasz kw
    [Arguments]   ${zmienna}
    Log  ${zmienna}


trzeci kw
    [Arguments]  ${zmienna}  ${password}   ${kolejna}
    otworz przegladarke   ${zmienna}  ${password}
    drugi nasz kw      ${kolejna}



*** Variables ***
${zmmienna}   testowa


*** Test Cases ***
Test 1
    Open Browser     https://skleptest.pl/my-account/  chrome
    Maximize Browser Window
    sleep  3
    otworz przegladarke   testy12345   haslo
    drugi nasz kw   ${zmmienna}
    trzeci kw   pierwsza   druga    trzeceia
    Wpisz login
    Wpisz haslo
#    Select Radio Button     gender    Male
#    Radio Button Should Not Be Selected    gender
    sleep  5
    ${text}    Get Text      //*[@id="customer_login"]/div[2]/h2
    Log  ${text}
#    Click Element    //*[@id="genterWrapper"]/div[2]/div[1]
#    Sleep             3s
#    Click Element    //*[@id="hobbiesWrapper"]/div[2]/div[1]


