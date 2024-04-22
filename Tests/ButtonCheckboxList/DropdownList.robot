*** Settings ***
Documentation  To jest test, w którym testujemy keywordy dla Dropdown List
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***

*** Test Cases ***
Dropdown List Check
    [Tags]           dropdown   chrome
    Open Browser     https://demowebshop.tricentis.com/books  chrome
    Maximize Browser Window
    Sleep             3s

    # Verifies Dropdown list is found from current page
    Page Should Contain List    //*[@id="products-orderby"]
    Sleep             3s

    # Verifies Dropdown list is not found from current page.
    Page Should Not Contain List    //*[@id="dropdown0"]
    Sleep             3s

    @{AllItems}     Get List Items    //*[@id="products-orderby"]
    ${ListLabels}   Get Selected List Labels    //*[@id="products-orderby"]
    ${ListValues}   Get Selected List Values    //*[@id="products-orderby"]

    # Verifies if List doesn't have selections but our list does so it is commented out
#    List Should Have No Selections      //*[@id="products-orderby"]

    # Verifies if List has specified selections
    List Selection Should Be    //*[@id="products-orderby"]     Position

    # Selects option from List by given index
    Select From List By Index    //*[@id="products-orderby"]    2
    ${SelectedLabel1}    Get Selected List Labels   //*[@id="products-orderby"]
    ${SelectedValue1}    Get Selected List Values   //*[@id="products-orderby"]
    Sleep   3s

    # Selects option from List by given value
    Select From List By Value    //*[@id="products-orderby"]    https://demowebshop.tricentis.com/books?orderby=15
    ${SelectedLabel2}    Get Selected List Labels   //*[@id="products-orderby"]
    ${SelectedValue2}    Get Selected List Values   //*[@id="products-orderby"]
    Sleep   3s

    Close Browser

    #For multi-selection lists you can use also below keywords:
#    Select/Unselect All From List    locator
#    Select/Unselect From List By Index    locator
#    Select/Unselect From List By Value    locator
#    Select/Unselect From List By Label    locator

