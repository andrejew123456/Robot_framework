*** Settings ***
Library     SeleniumLibrary


*** Variables ***

${url}          https://www.ebay.pl/
${browser}      chrome
${incognito}    options=add_argument("--incognito")


*** Keywords ***
Open And Maximize Browser
    Open Browser    ${url}     ${browser}      ${incognito}
    Sleep           2s
    Maximize Browser Window
    Sleep           1s

Close Browser After Test
    Close Browser


zaloguj uzytkownika
        [Arguments]   ${USERNAME}  ${USERNAME2}
        Log   loguj uzytkonika
        Log   ${USERNAME}
        Log Many  ${USERNAME}   ${USERNAME2}


drugi keyword
    [Arguments]   ${USERNAME}
    zaloguj uzytkownika   ${USERNAME}  ${USERNAME}
    Log  uzyjemy keyworda