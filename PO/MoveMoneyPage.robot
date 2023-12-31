*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Resource            GenericResource.robot

*** Variables ***
${Move_Money_Button}            (//android.widget.TextView[@text='Move Money'])[last()]
${Z_Z_Button}                   //*[@text='Zindigi']
${Enter_Mobile_Number}          //*[@text='Mobile Number']/following-sibling :: *[1]//*[1]//*[1]
${Enter_Nick}                   //*[@text='Name']/following-sibling :: *[1]//*[1]//*[1]
${Enter_Amount}                 //*[@text='Amount']/following-sibling :: *[1]//*[1]//*[1]
${Next_Button}                  //*[@text='Next']
${Bank_Account_Button}          //*[@text='Bank Account']
${click_dropdown}               //*[@text='Bank']/following-sibling :: *[1]//*[1]
${Select_Bank}                  //*[@text='ALFALAH']
${Enter_IBAN}                   //*[@text='Account Number / IBAN'] /following-sibling :: *[1]/child :: *[1]/child :: *[1]
${Raast_Button}                 //*[@text='Raast']
${Raast_Input}                  //*[@text='RAAST ID']/following-sibling :: *[1]//*[1]
${Link_Raast}                   //*[@text='NO']

${Home_More_Icon}               xpath=  (//android.widget.ImageView)[last()]

*** Keywords ***
Open Move Money Page
    Wait Until Page Contains Element    ${Home_More_Icon}        timeout=20
    Click Element                       ${Home_More_Icon}
Open Zindigi to Zindigi page
    Wait Until Page Contains Element    ${Z_Z_Button}       timeout=15
    Click Element                       ${Z_Z_Button}
Enter Mobile Number ,Name and Amount
    [Arguments]                                ${Receiver_Number}         ${Receiver_Nick}      ${Entered_Amount}
    Input Text                          ${Enter_Mobile_Number}          ${Receiver_Number}
    Wait Until Page Contains Element    ${Enter_Nick}
    Input Text                          ${Enter_Nick}                   ${Receiver_Nick}
    Input Text                          ${Enter_Amount}               ${Entered_Amount}
Click Next Button
    Wait Until Page Contains Element    ${Next_Button}      timeout=35
    Click Element                       ${Next_Button}
Click Bank Account On Move Money to transfer money through IBFT
    Wait Until Page Contains Element        ${Bank_Account_Button}          20s
    Click Element                           ${Bank_Account_Button}
Select Bank from drop down
    Wait Until Page Contains Element        ${click_dropdown}                30s
    Click Element                           ${click_dropdown}
    Click Element                           ${Select_Bank}
Enter Account Number ,Amount and Nick
    [Arguments]         ${IBAN}           ${Entered_Amount}     ${Receiver_Nick}
    Input Text          ${Enter_IBAN}       ${IBAN}
    Input Text          ${Enter_Amount}                  ${Entered_Amount}
    Wait Until Page Contains Element    ${Enter_Nick}
    Input Text                          ${Enter_Nick}                   ${Receiver_Nick}
Click Raast On Move Money Page to transfer money through Raast
    Wait Until Page Contains Element        ${Raast_Button}     timeout=25
    Click Element    ${Raast_Button}
Enter Raast_Id ,Amount and Nick
    [Arguments]         ${Raast}                      ${Entered_Amount}
    Input Text          ${Raast_Input}      ${Raast}
    Wait Until Page Contains Element        ${Enter_Amount}         timeout=30
    Input Text          ${Enter_Amount}     ${Entered_Amount}
Link Zindigi Account to Raast
    Wait Until Page Contains Element    ${Link_Raast}
    Click Element      ${Link_Raast}
verify balance is updated after transaction on Home Page












