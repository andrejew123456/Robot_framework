*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Chrome
    Open Browser    https://www.google.com/    chrome
    Sleep                               1s
    Close Browser