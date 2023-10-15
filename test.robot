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

Select Starting City and Destination
    
    Click Element    name:fromPort
    ${startin_city}=    Select From List By Value    name:fromPort    Boston
    ${startin_city}=    Get Selected List Value    name:fromPort
    
    Click Element    name:toPort
    ${destination}=    Select From List By Value    name:toPort    Cairo   
    ${destination}=    Get Selected List Value    name:toPort