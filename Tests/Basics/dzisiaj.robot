*** Settings ***
Library  SeleniumLibrary
Test Tags       web
#Test Setup
#Test Teardown

*** Variables ***
${zmienna}   ala ma kota
@{lista}    1   6   3   6
&{slownik}   k=ala  o=ma

*** Keywords ***
nowy keyword
    Log    nowy keyword
    Log   nowy step

*** Test Cases ***
test1
    [Tags]      hello
    Log  dzien dobry
    Log   ${lista}
    Log  ${zmienna}
    Log   ${slownik}
    nowy keyword



test 2
    log   hej

test3
    Open Browser   https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    sleep  5
    Page Should Contain Checkbox    id:RESULT_CheckBox-8_0
#    Select Checkbox    id:RESULT_CheckBox-8_0
#    sleep  5
    Click Element    //*[@id="q15"]/table/tbody/tr[1]/td/label
    sleep  5
    Checkbox Should Be Selected    id:RESULT_CheckBox-8_0

test4
    Open Browser    https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    sleep  3
    Page Should Contain Radio Button    id:RESULT_RadioButton-7_0
    Click Element    //*[@id="q26"]/table/tbody/tr[1]/td/label
    Radio Button Should Be Set To    RESULT_RadioButton-7    Radio-0
    
test5
    Open Browser    https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    sleep  3
    Page Should Contain List    id:RESULT_RadioButton-9
    Select From List By Value    id:RESULT_RadioButton-9   Radio-0
    sleep   5

Test6
    Open Browser    https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    sleep  3
    Input Text    id:RESULT_TextField-1    Lola
    Input Text    id:RESULT_TextField-3    12345679
    Input Text    xpath://*[@id="q26"]/table/tbody/tr[1]/td/label    12345679
    sleep  2
    Clear Element Text    id:RESULT_TextField-3
    sleep  2
    ${pobranytext}   Get Text    id:q2_label
    Log    ${pobranytext}

Test7
    Open Browser    https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome
    Maximize Browser Window
    Close Browser
    Sleep      3
    Open Browser   https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407   chrome   alias=chromealias
    Open Browser  https://dobrekursy.it/tester-automatyzujacy/   edge   alias=edgealias
    sleep  3
    @{ids}   Get Browser Ids
    &{alias}   Get Browser Aliases
    Log   ${ids}
    Log   ${alias}
    Close All Browsers


Test8
    Open Browser  https://sklepzbugami.pl   chrome
    Maximize Browser Window
    sleep  10
    Click Element    //a[@data-product_id=104]
    sleep  5

#    sleep  3
#    Mouse Over    id:menu-item-123
#    sleep  3
#    Mouse Out    id:menu-item-123
#    sleep  3
#    Mouse Down    id:menu-item-108
#    sleep   3
#    Mouse Up    id:menu-item-108
#    sleep  3
#    Mouse Down On Link    https://skleptest.pl/tag/all/
#    Sleep    3
#    Click Element    //a[@class="et_pb_button et_pb_more_button et_pb_button_one"]

#    Select From List By Value   id:billing_country   PT



Test10
    @{LISTA}  Create List  1  2  9   8  5
#    FOR    ${element}    IN    @{LISTA}
#        Log    ${element}
#
#    END

#    FOR    ${counter}    IN RANGE    0    10    2
#        Log    ${counter}
#
#    END

    FOR    ${index}    ${element}    IN ENUMERATE    @{LISTA}
        Log    ${index}: ${element}

    END

Test11
    @{LISTA}  Create List  1  2  9   8  5
#    IF    ${LISTA}[0] == 1
#        Log  prawda
#
#    END

    IF    ${LISTA}[0] == 2
        Log  to jest [prawda
    ELSE IF   ${LISTA}[0] == 1
        Log  weszlismy e else if
    ELSE
         Log   to jest falsz
    END
#
#    FOR    ${element}    IN    @{LISTA}
#
#        IF    ${LISTA}[0] == 1
#             Log   wartosc jest prawidlowa
#             Log    ${element}
#        END
#    END

    FOR    ${element}    IN    @{LISTA}
        Log    ${element}
        IF    ${element} == 1
             Log   ${element
        END
        FOR    ${counter}    IN RANGE    1    5
            Log    ${counter}

        END

    END
