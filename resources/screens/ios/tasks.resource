*** Settings ***
Documentation            Elementos e ações da tela minhas tarefas

Library       AppiumLibrary

*** Variables ***
${new_task_input}        accessibility_id=newTask
${create_button}         accessibility_id=createTask


*** Keywords ***
Create a new task
    [Arguments]        ${task_name}

    Wait Until Element Is Visible       ${new_task_input}    5

    Input Text       ${new_task_input}      ${task_name}
    Click Element    ${create_button}

    Close keyboard

Should have task
    [Arguments]        ${task_name}
    
    Wait Until Element Is Visible
    ...    xpath=//*[@name="taskText"][@value="${task_name}"]
    ...    5

Remove task by name
    [Arguments]    ${task_name}

    Click Element        xpath=//*[@value="${task_name}"]/../..//*[@name="removeTask"]

    ${button}        Set Variable        xpath=//XCUIElementTypeButton[@name="Sim"]
    
    Wait Until Element Is Visible    ${button}    5
    Click Element                    ${button}

Finish task
    [Arguments]        ${task_name}
    
    Click Element     xpath=///*[@value="${task_name}"]/..//*[@name="taskTodo"]

Task should be done
    [Arguments]        ${task_name}

    Wait Until Element Is Visible       xpath=///*[@value="${task_name}"]/..//*[@name="taskFinished"]
    
# Helpers
Close keyboard
    ${return}    Set Variable        xpath=//XCUIElementTypeButton[@name="Return"]

    Wait Until Element Is Visible    ${return}    5
    Click Element                    ${return}