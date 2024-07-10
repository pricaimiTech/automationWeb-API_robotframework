*** Settings ***
Resource    Booking.resource
Documentation
...             repositório com dicas https://github.com/asyrjasalo/RESTinstance 
...             Este teste é para fazer a criação de um registro no Booking

*** Settings ***
Suite Setup    Gerar Token

*** Variables ***
${_bookingid}    value
${_token}        value


*** Test Cases ***
Criar novo registro
    Create Session    CreateBook    ${HOST}    headers=${headers}
    ${response}    POST On Session    CreateBook    /${_book}    data=${PayloadCreateBook} 
    Log To Console    response = ${response.json()}   
    Should Be Equal As Strings   ${response.status_code}  200
    Set Suite Variable   ${_bookingid}    ${response.json()}[bookingid]


Update registro
    Create Session    UpdateBook    ${HOST}    headers= {'content-type': 'application/json', 'Accept':'application/json', 'Cookie': 'token=${_token}'}
    ${response}    PUT On Session    UpdateBook    /${_book}/${_bookingid}    data=${PayloadUpdateBook} 
    Log To Console    response = ${response.json()}
    Should Be Equal As Strings   ${response.status_code}  200

