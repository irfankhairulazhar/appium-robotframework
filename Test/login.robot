*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/android-res.robot
Resource    ../Resources/testData.robot

*** Test Cases ***
Login with valid credential
    [Tags]    valid_credential  main
    Open app
    Open register page
    Input Full Name     ${DATANAME}
    Input Email         ${DATAEMAIL}
    Enter Password      ${DATAPASSWORD}
    Input Reconfirm Password    ${DATARECONFIRMPASSWORD}
    Submit register button
    Success Registered
    open login page
    Input email login       ${DATAEMAIL}
    Input Password login    ${DATAPASSWORD}
    Button Login
    User success login
    Go Back

Login with email not registered
    [Tags]    using_invalid_email main
    Input email login       ${INVALIDEMAILLOGIN}
    Input Password login    ${DATAPASSWORD}
    Button Login
    Failed To Login


Login with invalid password not registered
   [Tags]    invalid_password    main
    Sleep     2s
    Clean email
    Sleep    2s
    Input email login       ${DATAEMAIL}
    Clean Password
    Input Password login    ${INVALIDPASSWORD}
    Sleep    2s
    Button Login
    Failed To Login



