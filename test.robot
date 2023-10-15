*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Firefox

*** Test Cases ***
Open BlazeDemo webpage
    [Documentation]    Open the BlazeDemo webpage
    Open Browser    http://blazedemo.com/    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    Welcome to the Simple Travel Agency!
