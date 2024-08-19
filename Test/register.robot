*** Settings ***
Library     AppiumLibrary
Resource    ../Resources/android-res.robot
Resource    ../Resources/testData.robot

*** Test Cases ***
register and verify data able to login
    [Tags]  valid_register    main
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

register without input name
    [Tags]  register_without_name    main
    Open register page
    Input Email         ${DATAEMAIL}
    Enter Password      ${DATAPASSWORD}
    Input Reconfirm Password    ${DATARECONFIRMPASSWORD}
    Submit register button
    Error Message Disaplayed under section name

register without input email
    [Tags]  register_without_email    main
    Sleep    2s
    Input Full Name     ${DATANAME}
    Clean email on register form
    Submit register button
    Error Message Disaplayed under section email

register without password
    [Tags]  register_without_pass    main
    Sleep    2s
    Input Email         ${DATAEMAIL}
    Clean pasword on register form
    Input Reconfirm Password    ${DATARECONFIRMPASSWORD}
    Submit register button
    Error Message Disaplayed under section password

register without re input password
    [Tags]  register_without_reinputpass   main
    Sleep    2s
    Enter Password      ${DATAPASSWORD}
    Clean re input password
    Sleep    2s
    Submit register button
    Error Message displayed under section reinput pass

register with diferent password and re input pass
    [Tags]  register_without_notmatchpass   main
    Sleep    5s
    Input Reconfirm Password    ${INVALIDPASS}
    Sleep    2s
    Submit register button
    Error Message displayed under section reinput pass





