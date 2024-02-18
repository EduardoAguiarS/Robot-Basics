*** Settings ***
Library     Browser    timeout=30


*** Variables ***
${URL_GLOBO}        https://www.globo.com/
${URL_YOUTUBE}      https://www.youtube.com/
${BROWSER}          chromium
${HEADLESS}         false
${WAIT_UNTIL}       load


*** Test Cases ***
Cenário 1: Abrir e fechar o site da Globo
    Abrir Navegador
    Abrir Pagina    ${URL_GLOBO}    WAIT=${WAIT_UNTIL}
    Tirar Print    globo.png
    Fechar Navegador

Cenário 2: Abrir e fechar o site do YouTube
    Abrir Navegador
    Abrir Pagina    ${URL_YOUTUBE}    WAIT=${WAIT_UNTIL}
    Tirar Print    youtube.png
    Fechar Navegador


*** Keywords ***
Abrir Navegador
    New Browser    ${BROWSER}    ${HEADLESS}

Abrir Pagina
    [Arguments]    ${URL}    ${WAIT}
    New Page    ${URL}    ${WAIT}

Tirar Print
    [Arguments]    ${FILENAME}
    Take Screenshot    filename=${FILENAME}

Fechar Navegador
    Close Browser
