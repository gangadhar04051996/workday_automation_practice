*** Settings ***
Library     Selenium2Library
Library     OperatingSystem

*** Test Cases ***
Google Devops And Find Eficode
    Load JSON Data
    Sleep    2
    Open Browser To Google
    # Search For Devops
*** Variables ***

@{mailid}  gangadhar.pydev@gmail.com
${data}    Load Json Data
*** Keywords ***
Load JSON Data
    ${json}=  Get file  data.json
    ${object}=   Evaluate    json.loads('''${json}''')  json
    Set Global Variable   ${data}   ${object}

    log  Hello, my name is ${object["email"]} and address is ${object["address"]} | WARN
    [return]  ${data}
    
Open Browser To Google
    ${res}=  Load JSON Data
    Open Browser  ${res["url"]}     browser=edge
    Maximize Browser Window
    Sleep    2
    Google Should Be Open
    Enter value in Workday
    Click submit button

Enter value in Workday
    ${res}=  Load JSON Data
    Wait Until Element Is Visible        xpath: //*[@id="input-4"]
    Input Text                       xpath: //*[@id="input-4"]    ${res["email"]}
    Wait Until Element Is Visible        id=input-5
    Input Password                   id=input-5    ${res["address"]}
    # Sleep    15
    

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