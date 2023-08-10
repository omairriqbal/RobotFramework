*** Settings ***

Documentation       All the page objects and keywords of loginPage page
Library             AppiumLibrary
Library             BuiltIn
Resource            GenericResource.robot

*** Variables ***
${Load_Bundle_Button}      //*[@text='Mobile Load & Bundles']
${Load_Button}              //*[@text='Load']
${Network_Button}           //*[@text='Select Network']/following-sibling::*[1]/child::*[2]
${Enter_Number_Field}       //*[@text="Enter Receiver's Number"]/following-sibling::*[1]/child::*[1]
${Enter_Load_Amount}        //*[@text='Enter Amount to Load']/following-sibling::*[1]/child::*[1]
${Name_Field}                     //*[@text='Name']/following-sibling::*[1]/child::*[1]
${Next_Button}                  //*[@text='NEXT']
${Pay_Bills/Fees_Button}        //*[@text='Pay Bills and Fees']
${Category_DropDown}            //*[@text='Category']/following-sibling::*[1]/child::*[1]
${Categories}                     //*[@text='Make a Transaction']/following-sibling::*[1]/child::*[last()]/child::*[1]/child::*/child::*/child::*
${Select_Company_dropdown}                 //*[@text='Make a Transaction']/following-sibling::*[2]/child::*[2]/child::*[1]
${Electricity_Company}                     //*[@text='IESCO']
${Enter_Consumer_Number}                   //*[@text='Consumer Number']/following-sibling::*[1]/child::*[1]/child::*[1]
${Consumer_Nick}                           //*[@text='Nick']/following-sibling::*[1]/child::*
${Okay_Button}                              //*[@text='OKAY']
${Gas_Company}                              //*[@text='SNGPL']




*** Keywords ***
Click Mobile Load and Bundles Button on Payments Page
    Wait Until Element Is Visible       ${Load_Bundle_Button}        15s
    Click Element        ${Load_Bundle_Button}
Click on Load Button on Mobile Loads And Bundles Page
    Wait Until Page Contains Element    ${Load_Button}              15s
    Click Element        ${Load_Button}
Select the Network
    Wait Until Page Contains Element    ${Network_Button}           10s
    Click Element    ${Network_Button}
Enter Receiver's Number, Amount and Name for Selected Network
    [Arguments]    ${Number}    ${Load}      ${Name}
    Input Text    ${Enter_Number_Field}      ${Number}
    Wait Until Page Contains Element    ${Enter_Load_Amount}        10s
    Input Text    ${Enter_Load_Amount}       ${Load}
    Input Text    ${Name_Field}              ${Name}
Click Next Button
    Click Element    ${Next_Button}
Click Pay Bills and Fees on Payments Page
    Wait Until Page Contains Element    ${Pay_Bills/Fees_Button}              15s
    Click Element    ${Pay_Bills/Fees_Button}
#Select Category From Drop Down
#    [Arguments]    ${Elec_Con_Num}      ${Con_Nick}
#    Wait Until Page Contains Element    ${Category_DropDown}        15s
#    Click Element    ${Category_DropDown}
#    Wait Until Page Contains Element    ${Categories}
#    @{Categories_List}      Get Webelements      ${Categories}
#    FOR    ${Category}    IN    @{Categories_List}
#        ${Category_Text}=     Get Text        ${Category}
#        Log     ${Category_Text}
#        IF         '${Category_Text}' == 'Electricity'
#            Click Element    ${Category}
#            Wait Until Page Contains Element    ${Select_Company_dropdown}
#            Click Element                       ${Select_Company_dropdown}
#            Wait Until Page Contains Element    ${Electricity_Company}
#            Click Element           ${Electricity_Company}
#            Wait Until Page Contains Element   ${Enter_Consumer_Number}
#            Input Text    ${Enter_Consumer_Number}      ${Elec_Con_Num}
#            Wait Until Page Contains Element    ${Consumer_Nick}
#            Input Text    ${Consumer_Nick}      ${Con_Nick}
#            Click Element    ${Next_Button}
#            Wait Until Page Contains Element   ${Okay_Button}   20s
#            Click Element    ${Okay_Button}
#            Click Element    ${Category_DropDown}
#            Log    ${Categories_List}
#        ELSE IF     '${Category_Text}' == 'Gas'
#            Click Element   ${Category}
#            Wait Until Page Contains Element    ${Select_Company_dropdown}     20s
#            Click Element                       ${Select_Company_dropdown}
#            Wait Until Page Contains Element    ${Gas_Company}          20s
#            Click Element      ${Gas_Company}
#            Wait Until Page Contains Element   ${Enter_Consumer_Number}     20s
#            Input Text    ${Enter_Consumer_Number}      ${Elec_Con_Num}
#            Wait Until Page Contains Element    ${Consumer_Nick}    20s
#            Input Text    ${Consumer_Nick}      ${Con_Nick}
#            Click Element    ${Next_Button}
#            Wait Until Page Contains Element   ${Okay_Button}       30s
#            Click Element    ${Okay_Button}
#            Click Element    ${Category_DropDown}
#        END
#
#    END
Perform Specific Action
    [Arguments]    ${selected_item}     ${Elec_Con_Num}      ${Con_Nick}
     IF        '${selected_item}' == 'Electricity'
        Wait Until Page Contains Element    ${Select_Company_dropdown}
        Click Element                       ${Select_Company_dropdown}
        Wait Until Page Contains Element    ${Electricity_Company}
        Click Element           ${Electricity_Company}
        Wait Until Page Contains Element   ${Enter_Consumer_Number}
        Input Text    ${Enter_Consumer_Number}      ${Elec_Con_Num}
        Wait Until Page Contains Element    ${Consumer_Nick}
        Input Text    ${Consumer_Nick}      ${Con_Nick}
        Click Element    ${Next_Button}
        Wait Until Page Contains Element   ${Okay_Button}   20s
        Click Element    ${Okay_Button}
     ELSE IF        '${selected_item}' == 'Gas'
        Wait Until Page Contains Element    ${Select_Company_dropdown}     20s
        Click Element                       ${Select_Company_dropdown}
        Wait Until Page Contains Element    ${Gas_Company}          20s
        Click Element      ${Gas_Company}
        Wait Until Page Contains Element   ${Enter_Consumer_Number}     20s
        Input Text    ${Enter_Consumer_Number}      ${Elec_Con_Num}
        Wait Until Page Contains Element    ${Consumer_Nick}    20s
        Input Text    ${Consumer_Nick}      ${Con_Nick}
        Click Element    ${Next_Button}
        Wait Until Page Contains Element   ${Okay_Button}       30s
        Click Element    ${Okay_Button}


Select Category From Drop Down
    Wait Until Page Contains Element    ${Category_DropDown}        15s
    Click Element    ${Category_DropDown}
    Wait Until Page Contains Element    ${Categories}
    ${Categories_List}      Get Webelements      ${Categories}
    ${items_to_select}    Create List    Electricity    Gas
    FOR    ${Category}    IN    @{Categories_List}
        ${Categort_text}    Get Text    ${Category}
        Run Keyword If    '${Categort_text}' IN @{items_to_select}      Click Element    ${Category}
            Perform Specific Action    ${Categort_text}     ${Elec_Consumer_Num}    ${Receiver_Nick}
    END


















