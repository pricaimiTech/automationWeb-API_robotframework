*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${HOST}         https://restful-booker.herokuapp.com
${_ping}        ping
${_auth}        auth
${_book}        booking
${_token}       value
${_pint_statusCode}    201
${PayloadCreateBook}    { "firstname" : "Jim","lastname" : "Brown","totalprice" : 111, "depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01", "checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}  
${PayloadUpdateBook}    { "firstname" : "James","lastname" : "Brown","totalprice" : 111, "depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01", "checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}  
${payloadCreateToken}    {"username":"admin", "password": "password123"}
${headers}        {'content-type': 'application/json', 'Accept':'application/json'}
${headersUpdate}    {'content-type': 'application/json', 'Accept':'application/json', 'Cookie': 'token=${_token}'}

*** Keywords ***
Validar status do servidor 
    ${response}    GET    ${HOST}/${_ping}
    Log To Console    response = ${response.content}
    Should Be Equal As Strings   ${response.status_code}  ${_pint_statusCode}
    Should Be Equal As Strings   ${response.content}  Created

Gerar Token
    Create Session    GerarToken    ${HOST}    headers=${headers} 
    ${response}    POST On Session    GerarToken    /${_auth}    data=${payloadCreateToken} 
    Log To Console    response = ${response.content}
    Should Be Equal As Strings   ${response.status_code}  200
    Set Suite Variable   ${_token}    ${response.json()}[token]





    