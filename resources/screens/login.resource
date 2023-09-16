*** Settings ***
Documentation            Elementos e ações da tela de login

Library       AppiumLibrary

*** Variables ***
${API_IP}         192.168.68.116


*** Keywords ***
Do login
    Input Text       xpath=//*[@resource-id="apiIp"]       ${API_IP}
    Click Element    xpath=//*[@resource-id="signInButton"]