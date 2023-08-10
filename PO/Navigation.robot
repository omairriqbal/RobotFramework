*** Settings ***

Documentation       All the page objects and keywords of Navigation Bar
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Home_Button}       //*[@text='HOME']
${Payments_Button}   //*[@text='PAYMENTS']
*** Keywords ***
Open Home Page from Navigation Bar
    Wait Until Page Contains Element        ${Home_Button}      timeout=40
    Click Element    ${Home_Button}
Open Payments Page By Clicking On Payments Button
    Wait Until Page Contains Element        ${Home_Button}      20s
    Click Element                           ${Payments_Button}
