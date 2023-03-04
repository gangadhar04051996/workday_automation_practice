*** Settings ***
Library     Selenium2Library

*** Test Cases ***
Google Devops And Find Eficode
    Open Browser To Google
    # Search For Devops
    # Result Should Contain Eficode

*** Keywords ***
Open Browser To Google
    Open Browser    https://michaels.wd5.myworkdayjobs.com/External/login?redirect=%2FExternal%2Fjob%2FIrving-Irving-Corporate-Office-3939-West-John-Carpenter-Freeway%2FAssociate-Category-Manager_R00207772%2Fapply%3Fsource%3DLinkedin    browser=edge
    Maximize Browser Window
    Google Should Be Open
    Enter value in Workday
    Click submit button

Enter value in Workday
    Wait Until Element Is Visible        xpath: //*[@id="input-4"]
    Input Text                       xpath: //*[@id="input-4"]    Admin
    Wait Until Element Is Visible        id=input-5
    Input Password                   id=input-5    admin123 
    

Click submit button
    Wait Until Element Is Visible  xpath://div[@data-automation-id="click_filter"]
    # Click Button  xpath://button[@data-automation-id="signInSubmitButton"]
    Click Element At Coordinates    xpath://button[@data-automation-id="signInSubmitButton"]    ${0}    ${0}

Search For Devops
    Input Text    name=q  helloworld
    Press Keys    name=q   ENTER

Result Should Contain Eficode
    Wait Until Page Contains    myworkdayjobs  

Google Should Be Open
    Location Should Contain    myworkdayjobs