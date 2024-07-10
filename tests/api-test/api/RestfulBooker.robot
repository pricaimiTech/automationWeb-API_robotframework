*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${HOST}         https://www.google.com
${STATUS_ESPERADO}  200


*** Keywords ***
Conecta ao WebService
    Create Session      consultaGoogle     ${HOST}

*** Test Cases ***

Quick Get Request Test
    ${RESPOSTA}=        GET  ${HOST}

Quick Get Request With Parameters Test
    ${response}=    GET  ${HOST}/search  params=query=ciao  expected_status=${STATUS_ESPERADO}

Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]