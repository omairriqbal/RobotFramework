*** Settings ***

Documentation       All the page objects and keywords of Authentication Dialog Box
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Enter_User_Pin}       //*[@text='Enter your 4 Digits MPIN']/following-sibling:: *[1]/child::*[1]
${Next_Button}          //*[@text='NEXT']
*** Keywords ***
Enter PIN
    [Arguments]                                ${Authentication_Pin}
    Wait Until Page Contains Element            ${Enter_User_Pin}       timeout=35
    Input Text      ${Enter_User_Pin}          ${Authentication_Pin}
