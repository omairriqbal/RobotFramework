*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
#Resource            GenericResource.robot

*** Variables ***
${Enter_Number}                        //*[@text='Mobile Number']/following-sibling :: *[1]//*[1]
${Enter_Pin}                          //*[@text='PIN']/following-sibling :: *[1]//*[1]
${Login-Button}                      //*[@text='Login']
${Allow-Button}                     xpath=(//android.widget.ScrollView/descendant::*)[position()=last()-1]
${Forgot_Pin}                      //*[@text='FORGOT PIN?']
${Enter_Cnic}                     //*[@text='CNIC'] /following-sibling :: *[1]/child :: *[1]/child :: *[1]
${Submit_Button}                 //android.widget.Button[@text='Allow']
${Reset_Page_Title}             //*[@text='RESET LOGIN PIN']
${New_Pin}                     //*[@text='New PIN']//following-sibling::*[1]/child::*[last()-4]
${Confirm_New_Pin}            //*[@text='Confirm New PIN']//following-sibling::*[1]/child::*[last()-4]
${Change_Button}             //*[@text='CHANGE NOW']
${Notification-Popup}       //android.widget.Button[@text='Allow']



*** Keywords ***
Open Zindigi Application
    Open Application              http://localhost:4723/wd/hub       platformName=Android        platformVersion=13       deviceName=RFCT41PV3EN        automationName=uiautomator2      appPackage=com.wallet.zindigi       appActivity=Views.SN_VNCA
Fill the Login form
    [Arguments]                                ${User_Number}         ${User_Pin}
    Check Visibility Of Notification Pop-Up
    Wait Until Element Is Visible              ${Enter_Number}        timeout=10
    Input Text                                 ${Enter_Number}        ${User_Number}
    Input Password                             ${Enter_Pin}           ${User_Pin}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}

Check Visibility Of Notification Pop-Up
    ${Noti-Popup}=  Run Keyword And Return Status    Element Should Be Visible  ${Notification-Popup}

   IF  (${Noti-Popup} == ${True})
        Click Element   ${Notification-Popup}
#        Wait Until Page Contains Element       ${SPLASH-LOGIN-BUTTON}
#        Click Element       ${SPLASH-LOGIN-BUTTON}
        Log To Console    Inside First If Condition
   END


Click on Forgot Pin on Login Page
    Click Element    ${Forgot_Pin}
Enter Mobile Number and CNIC of User
    [Arguments]                               ${User_Number}         ${User_Cnic}
    Wait Until Page Contains Element          ${Enter_Number}
    Input Text                                ${Enter_Number}           ${User_Number}
    Input Text                                ${Enter_Cnic}             ${User_Cnic}

Click on Submit Button and Allow Permissions
    Click Element       ${Submit_Button}
    Wait Until Page Contains Element           ${Allow-Button}        timeout=10
    Click Element                              ${Allow-Button}
    Wait Until Page Contains Element    ${Submit_Button}    10s
    Click Element       ${Submit_Button}
    Sleep       25s

Verify OTP Is Auto-fetched and Reset Login Pin Screen is Open
    Wait Until Page Contains Element    ${Reset_Page_Title}     timeout=30
    ${Title_Text}       Get Text        ${Reset_Page_Title}
    Should Be Equal As Strings                          ${Title_Text}       RESET LOGIN PIN

Enter New Pin And Confirm It
    [Arguments]       ${Pin}            ${Cnfrm_Pin}
    Input Text        ${New_Pin}            ${Pin}
    Input Text        ${Confirm_New_Pin}        ${Cnfrm_Pin}
    Click Element    ${Change_Button}
Verify Pin is Reset successfully

    
