*** Settings ***
Library     Selenium2Library
Library     OperatingSystem

*** Test Cases ***
Open Edge and run the query
    Load JSON Data
    Sleep    2
    Open Browser To Google
    # Search For Devops
*** Variables ***

@{mailid}  gangadhar.pydev@gmail.com
${data}    Load Json Data
*** Keywords ***
Load JSON Data
    ${json}=  Get file  C:/Users/tilak/Desktop/GitProjects/workday/robotselenium/data.json
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
    Enter login in Workday
    

Enter login in Workday
    ${res}=  Load JSON Data
    Click login button at top
    Wait Until Element Is Visible        xpath: //*[@data-automation-id="email"]
    Input Text                       xpath: //*[@data-automation-id="email"]    ${res["email"]}
    Wait Until Element Is Visible        xpath: //*[@data-automation-id="password"]
    Input Password                   xpath: //*[@data-automation-id="password"]    ${res["password"]}
    Sleep    2
    Click submit button
    sleep   10
    
Click login button at top
    sleep   2
    Wait Until Element Is Visible    xpath://*[@data-automation-id="utilityButtonSignIn"]
    Click Element At Coordinates    xpath://*[@data-automation-id="utilityButtonSignIn"]    ${0}    ${0}
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