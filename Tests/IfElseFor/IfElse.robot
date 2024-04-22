*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Keyword 1
    Log    Keyword 1 was run
    Close Browser

Keyword 2
    Log    Keyword 2 was run
    Close Browser

Keyword 3
    Log    Keyword 3 was run
    Close Browser

*** Variables ***
&{slownik_login}    username1=admin     password1=security
...                 username2=user      password2=first

*** Test Cases ***
Test1
    IF    "${slownik_login}[username1]" == "admin"
        Log    ${slownik_login}[username1]
    ELSE
        Log    This is not the right answear
    END

Test2
    Open Browser    https://demowebshop.tricentis.com/jewelry   chrome
    ${list_of_items}=   Get Element Count   class:product-item
    Run Keyword If    ${list_of_items}==10    Keyword 1
    ...  ELSE IF    ${list_of_items}<10     Keyword 2
    ...  ELSE   Keyword 3
