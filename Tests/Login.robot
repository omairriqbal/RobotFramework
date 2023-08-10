*** Settings ***
Documentation       To validate the login form
Library             Collections
Library             AppiumLibrary
Resource            ../PO/LoginPage.robot
Resource            ../PO/SplashScreen.robot
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
#Verify User Can Reset The PIN
    #LoginPage.Click on Forgot Pin on Login Page
    #LoginPage.Enter Mobile Number and CNIC of User      ${ValidUser_Number}         ${User_Cnic}
    #LoginPage.Click on Submit Button and Allow Permissions
    #LoginPage.Verify OTP Is Auto-fetched and Reset Login Pin Screen is Open
    #LoginPage.Enter New Pin And Confirm It      ${Pin}      ${Confirm_Pin}
    #LoginPage.Verify Pin is Reset successfully