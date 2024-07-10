*** Settings ***
Resource    FakeRESTApi_test.resource


*** Variables ***
${activitiesID}    value




*** Test Cases ***
Buscar todas as Activities
    ${responseActivities}    GET    ${baseURL}/${path_Activities}
    Log To Console    activitiesID=${responseActivities.json()}[0][id]
    Should Be Equal As Strings   ${responseActivities.status_code}  200
    Set Suite Variable    ${activitiesID}    ${responseActivities.json()}[0][id]

Buscar uma Active
    ${responseActive}    GET    ${baseURL}/${path_Activities}/${activitiesID}
    Log To Console    active=${responseActive.json()}
    Should Be Equal As Strings   ${responseActive.status_code}  200
    Log To Console    active=${responseActive.json()}[title]
    Should Be Equal As Strings   ${responseActive.json()}[title]  Activity 1

