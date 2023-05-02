*** Settings ***

Resource    ./Data/Landing_Page.robot
Resource    Rohlik_Keywords.robot
Resource    ./Data/Input_Data.robot

Test Setup      Landing_Page.Start Web Test
Test Teardown   Landing_Page.End Web Test

*** Test Cases ***
The website "Rohlik.cz" should load
    Rohlik_Keywords.Open Website "Rohlik.cz"

User Should Be Able To Login And Logout
    [Tags]  2
    Rohlik_Keywords.Login With Valid Credentials    ${LOGIN_EMAIL}    ${LOGIN_PASSWORD}




