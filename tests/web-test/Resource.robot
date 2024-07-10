*** Settings ***                                                                     
Library     SeleniumLibrary                                                          

*** Variables ***
${browser}    chrome
${url}    https://www.google.com/
${campo_de_busca}    textarea[name='q']
${botao_de_pesquisa}    input[name='btnK']
${resultado_busca}    div[id='search']


*** Keywords ***
Abrir Navegador
    Open Browser    ${url}    ${browser}
   
Fazer uma busca
    Input Text    ${campo_de_busca}    google
    Click Element    ${botao_de_pesquisa}

Validar o resultado da pesquisa
    Wait Until Element Is Visible    ${resultado_busca}
Tirar um print do resultado
    Capture Element Screenshot    ${resultado_busca}

Fechar Navegador
    Close Browser