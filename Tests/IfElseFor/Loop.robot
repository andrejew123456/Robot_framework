*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

*** Variables ***
@{LIST}     Tomek   Basia   Janek   Franek

${imie}     Basia

*** Test Cases ***
Test1
    FOR    ${element}    IN    @{LIST}
        Log    ${element}
    END

Test2
    FOR    ${i}    IN RANGE    0    5
        Log    ${i}
    END

Test3
    FOR    ${i}    IN   0 1 2 3 4 5
        Log    ${i}
    END

Test4
    FOR    ${i}    IN   0  1  2  3  4  5
        Log    ${i}
        #Exit For Loop If    ${i}==3
    END

Test5
    Open Browser    https://demowebshop.tricentis.com/books  chrome
    ${ListValues}   Get List Items    //*[@id="products-orderby"]   values=True
    FOR    ${i}    IN    @{ListValues}
        Log    ${i}
        Log    ${ListValues}
        Select From List By Value   //*[@id="products-orderby"]    ${i}
        Capture Page Screenshot
    END
    Close Browser


Test 6
    FOR  ${element}  IN    @{LIST}
        Run Keyword if   "${LIST}[1]" == "Basia"    Log   Basia

    END


Test 7
    FOR    ${element}    IN    @{LIST}
        Log    ${element}
        IF    "${LIST}[1]" == "Basia"
             Log  Basia
        END
    END

