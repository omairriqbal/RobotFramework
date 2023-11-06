*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
#Resource            GenericResource.robot

*** Variables ***
${Enter_Number}                         //*[@text='Enter your mobile number'] /following-sibling :: *[2]/child::*[1]
${Enter_Pin}                          //*[@text='Enter PIN'] /following-sibling :: *[1]/child::*[1]
${CreateAccountButton}                //*[@text='Create Account']
${Login-Button}                      //*[@text='Login']
${Allow_Button}                     //android.widget.Button[@text='Allow']
${Forgot_Pin}                      //*[@text='FORGOT PIN?']
${Enter_Cnic}                     //*[@text='CNIC'] /following-sibling :: *[1]/child :: *[1]/child :: *[1]
${Submit_Button}                 //android.widget.Button[@text='Allow']
${Reset_Page_Title}             //*[@text='RESET LOGIN PIN']
${New_Pin}                     //*[@text='New PIN']//following-sibling::*[1]/child::*[last()-4]
${Confirm_New_Pin}            //*[@text='Confirm New PIN']//following-sibling::*[1]/child::*[last()-4]
${Change_Button}             //*[@text='CHANGE NOW']
${Call_Noti-Popup}          //android.widget.Button[@text='Allow']
${Sms_Noti-Popup}           //android.widget.TextView[@text='Allow']



*** Keywords ***
Open Zindigi Application
    Open Application              http://localhost:4723/wd/hub       platformName=Android        platformVersion=13       deviceName=RFCT41PV3EN        automationName=uiautomator2      appPackage=com.wallet.zindigi      appActivity=.AuthenticationActivity
Fill the Login form
    [Arguments]                                ${User_Number}         ${User_Pin}
    Check Visibility Of First Screen
    Check Visibility Of Notification Pop-Up
    Wait Until Page Contains Element            ${Enter_Number}        timeout=20
    Input Text                                 ${Enter_Number}        ${User_Number}
    Input Password                             ${Enter_Pin}           ${User_Pin}
    Wait Until Page Contains Element           ${Allow_Button}        timeout=10
    Click Element                              ${Allow_Button}
    Wait Until Page Contains Element           ${Allow_Button}        timeout=10
    Click Element                              ${Allow_Button}

Check Visibility Of First Screen
        ${First_Screen}=    Run keyword And Return Status   Wait Until Page Contains Element    ${CreateAccountButton}   timeout=10

    IF  (${First_Screen} == ${True})
        Click Element    ${Login-Button}
        Log To Console    Inside Splash Screen
    END


Check Visibility Of Notification Pop-Up
    ${Noti-Popup}=      Run Keyword And Return Status    Element Should Be Visible      ${Call_Noti-Popup}

   IF  (${Noti-Popup} == ${True})
        Click Element   ${Call_Noti-Popup}
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
    Wait Until Page Contains Element           ${Allow_Button}        timeout=10
    Click Element                              ${Allow_Button}
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

    
