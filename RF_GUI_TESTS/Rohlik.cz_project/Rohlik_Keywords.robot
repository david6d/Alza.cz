*** Settings ***
Library    Browser

Resource  ./Data/Landing_Page.robot
Resource  ./Data/Sign_in.robot

*** Keywords ***
Open Website "Rohlik.cz"
    Landing_Page.Cookie test
    Landing_Page.Close cookies
    Landing_Page.Verify Page Loaded


Login With Valid Credentials
    [Arguments]  ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}
    Open Website "Rohlik.cz"
    Sign_in.Click On "Účet"
    Sign_in.Verify "Přihlášení" Page Loaded
    Sign_in.Login    ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}
    Sign_in.Verify Login
    Sign_in.Logout
    Sign_in.Verify Logout

