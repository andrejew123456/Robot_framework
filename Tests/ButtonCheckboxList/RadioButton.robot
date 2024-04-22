*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla Radio Button
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***

*** Test Cases ***
Radio Button Check
    [Tags]           radio  button  chrome
    Open Browser     https://demoqa.com/automation-practice-form  chrome
    Maximize Browser Window
    Sleep             3s

    # Verifies radio button locator is found from current page
    Page Should Contain Radio Button    //*[@id="gender-radio-2"]
    Sleep             3s

    # Verifies radio button group group_name has no selection
    Radio Button Should Not Be Selected    gender
    Sleep             3s

    # Verifies radio button locator is not found from current page.
    Page Should Not Contain Radio Button    //*[@id="gender-radio-20"]
    Sleep             3s

    # Sets the radio button group group_name to value.
    # Select Radio Button    gender    Male    -> to powinno działać, ale czasem nie łapie tego, czy obiekt jest radio buttonem
    # zostawiam do nauki, może wam się przydać w pracy, gdzie możecie ustalić z developerami ustawienia kodu html
    Click Element    //*[@id="genterWrapper"]/div[2]/div[1]
    Sleep             3s
#
#    # Verifies radio button group group_name is set to value
    Radio Button Should Be Set To    gender    Male
    Sleep             3s


#    Select Radio Button    gender    Male
    
    Close Browser