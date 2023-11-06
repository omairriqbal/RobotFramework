*** Settings ***
Documentation       To validate the login form
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/MoveMoneyPage.robot
Resource            ../PO/ReviewDetailsPage.robot
Resource            ../PO/Authentication.robot
Resource            ../PO/Receipt.robot
Resource            ../PO/HomePage.robot
Resource            ../PO/GenericResource.robot


*** Variables ***


*** Test Cases ***
#Open Login Page From Splash Screen
    #SplashScreen.Open Login Screen
Validate Successful Login
    LoginPage.Open Zindigi Application
    LoginPage.Fill the Login form       ${ValidUser_Number}         ${ValidUser_Pin}
Validate Zindigi Homepage is Open after Successfull Login
    HomePage.check Home Page is open after Login

Open Trasnfer Money
    HomePage.Open Transfer Money

Open Zindigi to Zindigi page
    MoveMoneyPage.Open Zindigi to Zindigi page
Enter Mobile Number ,Name and Amount
    MoveMoneyPage.Enter Mobile Number ,Name and Amount      ${Receiver_Mobile_Number}   ${Receiver_Nick}    ${Entered_Amount}
Click Next Button
    MoveMoneyPage.Click Next Button

Verify the Data on Review Details Page

    Wait Until Page Contains Element                      ${Proceed-Button}        timeout=40
    ReviewDetailsPage.Click Send Money On Review Details Page
    Authentication.Enter PIN                              ${ValidUser_Pin}
    Wait Until Page Contains Element                      ${Done_Button}          timeout=30
    Receipt.Click Done Button on Receipt
#Verify User Can Reset The PIN
    #LoginPage.Click on Forgot Pin on Login Page
    #LoginPage.Enter Mobile Number and CNIC of User      ${ValidUser_Number}         ${User_Cnic}
    #LoginPage.Click on Submit Button and Allow Permissions
    #LoginPage.Verify OTP Is Auto-fetched and Reset Login Pin Screen is Open
    #LoginPage.Enter New Pin And Confirm It      ${Pin}      ${Confirm_Pin}
    #LoginPage.Verify Pin is Reset successfully