*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla Checkboxów
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***

*** Test Cases ***
Checkbox Check
    [Tags]           checkbox   chrome
    Open Browser     https://demoqa.com/automation-practice-form  chrome
    Maximize Browser Window
    Sleep             3s

    # Verifies checkbox is found from current page
    Page Should Contain Checkbox    id:hobbies-checkbox-1
    Sleep             3s

    # Verifies checkbox is not found from current page.
    Page Should Not Contain Checkbox    id:hobbies-checkbox-10
    Sleep             3s

    # Selects checkbox
#   Select Checkbox    id:hobbies-checkbox-1 -> to powinno działać, ale czasem nie łapie tego, czy obiekt jest checkboxem lub nakada jeden obiekt na drugi
#   zostawiam do nauki, może wam się przydać w pracy, gdzie możecie ustalić z developerami ustawienia kodu html
    Click Element    //*[@id="hobbiesWrapper"]/div[2]/div[1]
    Sleep             3s

    # Selects checkbox
#   Select Checkbox    id:hobbies-checkbox-2
    Click Element     //*[@id="hobbiesWrapper"]/div[2]/div[2]
    Sleep             3s

    # Unselects checkbox
#   Unselect Checkbox    id:hobbies-checkbox-2
    Click Element     //*[@id="hobbiesWrapper"]/div[2]/div[2]
    Sleep             3s

    # Verifies checkbox is selected
    Checkbox Should Be Selected    id:hobbies-checkbox-1
    Sleep             3s

    # Verifies checkbox is unselected
    Checkbox Should Not Be Selected    id:hobbies-checkbox-2
    Sleep             3s

    Close Browser
