*** Settings ***
Library     SeleniumLibrary                                                          


*** Variables ***
${browser}    chrome
${url}    https://google.com
${campo_de_busca}    q
${botao_de_pesquisa}    btnK
${resultado_busca}    search


*** Test Cases ***
Abrir Navegador
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Capture Page Screenshot
   
Fazer uma busca
    Wait Until Element Is Visible    name=q
    Input Text    name=q    google
    Capture Page Screenshot
    Press Keys    name=q    ENTER

Validar o resultado da pesquisa
    Wait Until Element Is Visible    id=${resultado_busca}
Tirar um print do resultado
    Capture Element Screenshot    id=${resultado_busca}

Fechar Navegador
    Close Browser
 