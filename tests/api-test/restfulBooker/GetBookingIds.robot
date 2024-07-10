*** Settings ***
Resource    Booking.resource


*** Settings ***
Suite Setup    Validar status do servidor


*** Variables ***
${_bookingid}    value


*** Test Cases ***
Buscar todos os livros cadastrados
    ${responseBookers}    GET    ${HOST}/${_book}
    Log To Console    response = ${responseBookers.json()}[0]
    Set Suite Variable   ${_bookingid}    ${responseBookers.json()}[0][bookingid]
    Should Be Equal As Strings   ${responseBookers.status_code}  200


Buscar um único livro 
    ${responseBook}    GET    ${HOST}/${_book}/${_bookingid}
    Log To Console    response = ${responseBook.json()}
    Should Be Equal As Strings   ${responseBook.status_code}  200


