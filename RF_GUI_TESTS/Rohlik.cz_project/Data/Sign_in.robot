*** Settings ***
Library    Browser

Resource   Selectors.robot

*** Keywords ***
Click On "Účet"
    Click    ${SEL_USER_LOGIN_BUTTON}

Verify "Přihlášení" Page Loaded
    ${login_title}  Get Text    data-test=login-box-wrapper
    Log To Console    ${login_title}
    Should Contain    ${login_title}    Přihlášení

Login
    [Arguments]  ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}
    Fill "E-mail" Field       ${LOGIN_EMAIL}
    Fill "Password" Field     ${LOGIN_PASSWORD}
    Click On "Přihlásit se"

Fill "E-mail" Field
    [Arguments]  ${LOGIN_EMAIL}
    Fill Text    id=email     ${LOGIN_EMAIL}
    sleep  1s

Fill "Password" Field
   [Arguments]  ${LOGIN_PASSWORD}
   Fill Text    id=password    ${LOGIN_PASSWORD}
   sleep  1s

Click On "Přihlásit se"
   Click    data-test=btnSignIn
   sleep  1s

Verify Login
    ${login_icon}   Get Text    css=[class="sc-c54407f5-6 gYYdTT"]
    Should Contain    ${login_icon}    DK
    
Logout
    Click    css=[class="sc-c54407f5-6 gYYdTT"]
    Click    data-test=user-box-logout-button
    sleep  1s

Verify Logout
    ${login_icon_out}  Get Text     data-test=header-user-icon
    Should Not Contain    ${login_icon_out}    DK
    Should Contain        ${login_icon_out}    Účet

    Sleep    5s
