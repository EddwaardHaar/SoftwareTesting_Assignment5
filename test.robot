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
    ${startin}=    Select From List By Value    name:fromPort    Boston
    ${startin}=    Get Selected List Value    name:fromPort
    Set Suite Variable    ${starting_city}    ${startin}
    
    Click Element    name:toPort
    ${destin}=    Select From List By Value    name:toPort    Cairo   
    ${destin}=    Get Selected List Value    name:toPort
    Set Suite Variable    ${destination_city}    ${destin}

Check FindFlights button is selectable
    Page Should Contain Button    xpath://input[@value='Find Flights']
    Click Button    xpath://input[@value='Find Flights']

Check that the page says Flights from Boston to Cairo
    Page Should Contain   Flights from ${starting_city} to ${destination_city}:
    Page Should Contain Element    xpath://html/body/div[2]/table/tbody/tr[1]

Check that you have at least one flight choice visible
    Page Should Contain Element    xpath:/html/body/div[2]/table/tbody/tr[5]/td[6]
    
Select one of the flights
    ${flight_price} =  Get Text  xpath://table[@class='table']/tbody/tr[1]/td[6]
    ${flight_number} =  Get Text  xpath://table[@class='table']/tbody/tr[1]/td[2]
    ${airline_name} =  Get Text  xpath://table[@class='table']/tbody/tr[1]/td[3]

    Click Button    xpath://html/body/div[2]/table/tbody/tr[5]/td[1]/input