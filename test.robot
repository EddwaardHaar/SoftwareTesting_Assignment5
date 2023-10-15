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
    Page Should Contain Element    xpath:/html/body/div[2]/table/tbody/tr[4]/td[1]
    
Select one of the flights

    ${flight_price} =  Get Text    xpath:/html/body/div[2]/table/tbody/tr[4]/td[6]
    ${flight_number} =  Get Text    xpath:/html/body/div[2]/table/tbody/tr[4]/td[2]
    ${airline_name} =  Get Text    xpath:/html/body/div[2]/table/tbody/tr[4]/td[3]

    

    Set Suite Variable  ${selected_flight_price}  ${flight_price}
    Set Suite Variable  ${selected_flight_number}  ${flight_number}
    Set Suite Variable  ${selected_airline_name}  ${airline_name}

    Log To Console    Company: ${selected_airline_name}

    Click Button    xpath://html/body/div[2]/table/tbody/tr[4]/td[1]/input

Check Stored Flight Information on the Page
    ${flight_price} =  Get Text    xpath://html/body/div[2]/p[3]
    ${flight_number} =  Get Text    xpath://html/body/div[2]/p[2]
    ${airline_name} =  Get Text    xpath://html/body/div[2]/p[1]

    Log To Console    Price: ${flight_price}, Flight no: ${flight_number}, Company: ${airline_name}

    ${price}=    Get Text    xpath://html/body/div[2]/p[5]/em
    Set Suite Variable    ${total_price}    ${price}