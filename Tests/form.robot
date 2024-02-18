*** Settings ***
Library     Browser    timeout=30


*** Variables ***
${URL}              https://demoqa.com/automation-practice-form
${BROWSER}          chromium
${HEADLESS}         false
${WAIT_UNTIL}       load

${FIRST_NAME}       Robot
${LAST_NAME}        Framework
${EMAIL}            ${FIRST_NAME}.${LAST_NAME}@robotframework.org
${PHONE}            1234567890
${GENDER}           Male

${INPUT_FNAME}      id=firstName
${INPUT_LNAME}      id=lastName
${INPUT_EMAIL}      id=userEmail
${INPUT_GENDER}     //label[contains(.,'${GENDER}')]
${INPUT_NUMBER}     id=userNumber
${INPUT_SUBMIT}     id=submit


*** Test Cases ***
Cenário 1: Preencher formulário
    Abrir Navegador
    Acessar o Site
    Preencher Formulário
    Enviar Formulário
    Fechar Navegador


*** Keywords ***
Abrir Navegador
    New Browser    ${BROWSER}    ${HEADLESS}

Acessar o Site
    New Page    ${URL}    ${WAIT_UNTIL}

Preencher Formulário
    Type Text    ${INPUT_FNAME}    ${FIRST_NAME}
    Type Text    ${INPUT_LNAME}    ${LAST_NAME}
    Type Text    ${INPUT_EMAIL}    ${EMAIL}
    Click    ${INPUT_GENDER}
    Type Text    ${INPUT_NUMBER}    ${PHONE}

Enviar Formulário
    Click    ${INPUT_SUBMIT}

Fechar Navegador
    Take Screenshot
    Close Browser
