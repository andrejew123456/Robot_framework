*** Settings ***
Library    SeleniumLibrary

#Test Setup   Open Browser   https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
#Library   DataDriver  ../TestData/TestData.xlsx   sheet_name=Sheet1
#Library   DataDriver  ../TestData/testsklep.xlsx   sheet_name=Sheet1
#Test Template  login to test page
*** Variables ***
${dobre_kursy}   https://dobrekursy.it/tester-automatyzujacy/
${test_sklep}   https://skleptest.pl/

*** Keywords ***
login to test page
    [Arguments]   ${email}   ${haslo}
    Open Browser   ${test_sklep}   chrome
    Click Link    https://skleptest.pl/my-account/
    Input Text    id:username    ${email}
    Input Password    password    ${haslo}
    Close Browser
    
*** Test Cases ***
testci
    Open Browser   https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    sleep  5
    Page Should Contain Checkbox    id:RESULT_CheckBox-8_0


Test 1
     Page Should Contain Checkbox    id:RESULT_CheckBox-8_0
#    Select Checkbox    //*[@id="RESULT_CheckBox-8_3"]
    Sleep  5
    Click Element    //*[@id="q15"]/table/tbody/tr[4]/td/label
    sleep  5
    Checkbox Should Be Selected    id:RESULT_CheckBox-8_3
    Checkbox Should Not Be Selected    id:RESULT_CheckBox-8_0
    Sleep  5

Test2
    sleep  3
    Page Should Contain Radio Button    id:RESULT_RadioButton-7_1
    Radio Button Should Not Be Selected    RESULT_RadioButton-7
    Click Element    //*[@id="q26"]/table/tbody/tr[1]/td/label
#    Radio Button Should Be Set To    group_name    Radio-0
    sleep  5
    
Test3
    sleep   3
    Page Should Contain List    id:RESULT_RadioButton-9
    Select From List By Value    id:RESULT_RadioButton-9    Radio-0
    ${list_value}   Get Selected List Value    id:RESULT_RadioButton-9
    ${list_labels}   Get Selected List Labels    id:RESULT_RadioButton-9
    Log   ${list_value}
    Log   label is: ${list_labels}


Test4
    sleep  3
    Input Text    id:RESULT_TextField-1    Kasia
    Input Text    id:RESULT_TextField-3    10203040506
    sleep  3
    Clear Element Text    id:RESULT_TextField-3
    sleep  3
    ${text}   Get Text    id:q2_label
    Log   text z pola: ${text}


Test5_przegladarki
    Open Browser   ${dobre_kursy}   chrome
    Log  opening chrome
    Maximize Browser Window
    sleep  3
    Close Browser
    sleep  3
    Open Browser  ${dobre_kursy}   edge
    Log  opening edge
    sleep  3
    Open Browser   ${dobre_kursy}  chrome
    Log  opening chrom
    sleep  3
    Close All Browsers
    Log  closing all bowsers
    sleep   3
    Open Browser   ${dobre_kursy}   chrome  alias=chromedobre
    Log  opening chrome with alias
    Open Browser   ${dobre_kursy}   edge    alias=edgedobre
    Log  opening edge with alias
    sleep  3
    &{alias}    Get Browser Aliases
    Log   ${alias}
    @{browser_id}   Get Browser Ids
    Log  ${browser_id}
    sleep  3

    Close All Browsers



Test6
    Open Browser   ${test_sklep}   chrome
    Maximize Browser Window
    sleep  3
    Mouse Over    id:menu-item-123
    sleep   3

    Mouse Out    id:menu-item-123
    sleep  3
    
    Mouse Down    id:menu-item-108
    sleep  2
    Mouse Up    id:menu-item-108
    sleep  3

    Mouse Down On Link    https://skleptest.pl/tag/all/
    sleep  3
    Mouse Down On Image    xpath://*[@id="tyche_products-1"]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/img[2]
    sleep  3



Test7
    @{LIST}   Create List   1  2  3  4  a  5  c
    Log Many   @{LIST}

    FOR    ${element}    IN    @{LIST}
        Log    ${element}

    END





Tes8

    FOR    ${counter}    IN RANGE    0    10    2
        Log    ${counter}

    END


Test9
    @{LIST}   Create List   1  2  3  4  a  5  c
    FOR    ${index}    ${element}    IN ENUMERATE    @{LIST}
        Log    ${index}: ${element}

    END



Test10
    @{LIST}   Create List   1  2  3  4  a  5  c
    IF    ${LIST}[0] == 1
          Log   to element listy
          Log   ${LIST}[0]

    END

Test11
    @{LIST}   Create List   1  2  3  4  a  5  c
    IF    ${LIST}[1] == 1
        Log  ${LIST}[1]
    ELSE
         Log   to nie byl pierwszy element listy
    END

Test12
     @{LIST}   Create List   1  2  3  4  a  5  c
    IF    ${LIST}[1] == 1
        Log  ${LIST}[1]
    ELSE IF   ${LIST}[0] == 1
        Log  ${LIST}[1] to o ten element chodzi
    ELSE
    Log   to nie jest element listy

    END
 
Test13
    FOR    ${counter}    IN RANGE    0    10    2
        Log    ${counter}
        IF    ${counter} == 2
             Log   wyswietl counter ${counter}
        END

    END


Test14
    FOR    ${counter}    IN RANGE    0    10    2
        Log    ${counter}
        Run Keyword If    ${counter} == 2   Log    wyswietl counter ${counter}

    END

Test15
    FOR    ${counter}    IN RANGE    0    10    2
        Log    ${counter}
        FOR    ${counter}    IN RANGE    0    5
            Log    ${counter} + 1
        END
    END


Test6create list
    @{lista_temperatur}  Create List  -5  0  10  15  35   40
    Log   ${lista_temperatur}

    FOR    ${element}    IN    @{lista_temperatur}
        IF    ${element} <= -5
            Log   mróz
        ELSE IF   ${element} <=0 and ${element} > -5
            Log   zimno
        ELSE IF   ${element} <=10 and ${element} > 0
                Log  dodatnia
        ELSE IF   ${element} <=15 and ${element} > 10
                Log  cieplej
        ELSE IF   ${element} <=35 and ${element} > 40
                Log  goraco

        ELSE
             log  parzy
        END

    END

#Test15
#    login to test page  ${email}  ${haslo}