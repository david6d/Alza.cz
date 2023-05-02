*** Settings ***
Library     Browser
Resource    Input_Data.robot
Resource    Selectors.robot

*** Keywords ***
Start Web Test
    New Browser    ${BROWSER}    headless=False
    sleep   10s
    New Page       ${BASE_URL}



Cookie test
    ${cookie}  Get Cookie   language
    Log To Console    ${cookie}
    Should Be Equal    ${cookie.value}    cs-CZ
    Should Be Equal    ${cookie.expires}    ${None}

Verify Page Loaded
    Get Title    contains    ${URL_TITLE}

Close cookies
    ${acceptAll} =  Get Text    ${SEL_ACCEPT_COOKIE_BUTTON}
    IF   "${acceptAll}" == "Povolit všechny"
        Click    ${SEL_ACCEPT_COOKIE_BUTTON}
    ELSE
        Click    ${SEL_DECLINE_COOKIE_BUTTON}
    END

    sleep  3s

End Web Test
    Close Browser
    sleep  3s

