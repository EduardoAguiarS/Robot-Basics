*** Settings ***
Library     Browser    timeout=30


*** Variables ***
# Config
${URL}                  https://www.youtube.com/
${BROWSER}              chromium
${HEADLESS}             false
${WAIT_UNTIL}           load

# Dados do site
${VIDEO_NAME}           BDD: muito além de escrita de cenários

# Elementos
${SEARCH_INPUT}         //input[@id='search']
${SEARCH_BUTTON}        //button[@id='search-icon-legacy']
${VIDEO}                (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${SUBSCRIBE_BUTTON}     //span[contains(.,'Inscrever-se')]


*** Test Cases ***
Cenário 1: Executar video no site do YouTube
    Dado que eu acesso o site do YouTube
    Quando digito o nome de um video no campo de pesquisa
    E clico no botão de pesquisa
    E clico no primeiro video
    Então o video deverá ser exibido


*** Keywords ***
Dado que eu acesso o site do YouTube
    New Browser    ${BROWSER}    ${HEADLESS}
    New Page    ${URL}    ${WAIT_UNTIL}

Quando digito o nome de um video no campo de pesquisa
    Type Text    ${SEARCH_INPUT}    ${VIDEO_NAME}

E clico no botão de pesquisa
    Click    ${SEARCH_BUTTON}

E clico no primeiro video
    Wait For Elements State    ${VIDEO}    visible    10
    Click    ${VIDEO}

Então o video deverá ser exibido
    Wait For Elements State    ${SUBSCRIBE_BUTTON}    visible    10
    Get Element States    ${SUBSCRIBE_BUTTON}    contains    visible
    Take Screenshot    filename=youtubevideo.png
    Close Browser
