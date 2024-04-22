*** Settings ***
Documentation     Test

Library    OperatingSystem

*** Variables ***

${zmienna1}   pierwsza zmienna
@{lista}      1  2  6
&{slownik}    klucz=tak  kluicz2=nie


*** Test Cases ***
Test1
    Log  Test1
    Count Files In Directory     \Tests\\Basics
    Log  ${zmienna1}
    Log  ${lista}
    Log  ${slownik}


Test2
    Log   ${zmienna1}
    ${zmienna3}  Ste
