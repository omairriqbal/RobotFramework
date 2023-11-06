*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Library             BuiltIn
Resource            GenericResource.robot

*** Variables ***
${Customer_Balance}                         xpath=  (//*[@text='Rs.'])[1]/following-sibling::*[1]
${Transfer_Money}                           //*[@text='Transfer Money']
${Initial_Balance_Amount}
*** Keywords ***
check Home Page is open after Login
    Wait Until Page Contains Element                    ${Customer_Balance}                 timeout=50
    ${Initial_Balance_Amount}        Get Text           ${Customer_Balance}
    Set Global Variable                                 ${Initial_Balance_Amount}
    Log                                                 ${Initial_Balance_Amount}
    Should Be True                                      ${Initial_Balance_Amount}           >=0

Open Transfer Money
    Wait Until Page Contains Element                    ${Transfer_Money}
    Click Element                                       ${Transfer_Money}
Check balance is updated after transaction on Home Page
    [Arguments]                                         ${Entered_Amount}
    Wait Until Page Contains Element                    ${Customer_Balance}                 timeout=30
    ${New_Balance}                   Get Text           ${Customer_Balance}
    Log     ${New_Balance}
    ${Updated_Balance}               Evaluate            ${Initial_Balance_Amount} - ${Entered_Amount}
    Log     ${Updated_Balance}
    Should Be Equal As Strings                          ${New_Balance}       ${Updated_Balance}
