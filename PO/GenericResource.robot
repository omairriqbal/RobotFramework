*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here for our own domain specific language.
...              They utilize keywords provided by the imported SeleniumLibrary
Library          AppiumLibrary
Resource            ../PO/HomePage.robot
Resource            ../PO/Navigation.robot


*** Variables ***
${ValidUser_Number}             3327864321
${ValidUser_Pin}                1234
${Receiver_Mobile_Number}       03365570751
${Receiver_Nick}                Ahmad
${Entered_Amount}               1
${Account_IBAN}                 03441008311753
${Raast_Id}                     03129761208
${User_Cnic}                    3420145124443
${Pin}                          3690
${Confirm_Pin}                  3690
${Load_Amount}                  80
${Elec_Consumer_Num}            12345678901234

*** Keywords ***
Validate Account Balance is Update on Home Page After Transaction
    Navigation.Open Home Page from Navigation Bar
    HomePage.Check balance is updated after transaction on Home Page    ${Entered_Amount}
