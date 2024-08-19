*** Settings ***
Library     AppiumLibrary
Resource    testData.robot

*** Variables ***
#-- installing appium and apk ---
${PLATFORM_NAME}    Android
${DEVICE_NAME}      emulator-5554
${APP_PACKAGE}      com.loginmodule.learning
${APP_ACTIVITY}     com.loginmodule.learning.activities.LoginActivity
${AUTOMATION_NAME}  Uiautomator2
${GRANT_PERMISSION}        true
${AUTO_CLOSE_PROMPT}    //android.widget.Button[@text='OK']
${TIMEOUT}          300
${APPIUM_SERVER}       http://localhost:4723/wd/hub
${APP_PATH}            ${CURDIR}/app/Sample Android App - Login Tes_4.0_APKPure.apk
${APPIUM_URL}        http://localhost:4723/wd/hub

#-- reister element --
${BUTTON_REGISTER}      id=com.loginmodule.learning:id/textViewLinkRegister
${USER_NAME}            id=com.loginmodule.learning:id/textInputEditTextName
${USER_EMAIL}           id=com.loginmodule.learning:id/textInputEditTextEmail
${PASSWORDS}            id=com.loginmodule.learning:id/textInputEditTextPassword
${REINPUTPASSWORD}      id=com.loginmodule.learning:id/textInputEditTextConfirmPassword
${SUBMIT_DATA_REGISTER}     id=com.loginmodule.learning:id/appCompatButtonRegister
${DATASUBMITTED}        id=com.loginmodule.learning:id/snackbar_text
${ERORFIELONAME}        //android.widget.TextView[@text="Enter Full Name"]
${ERRORONEMAIL}         //android.widget.TextView[@text="Enter Valid Email"]
${ERRORONPASS}          //android.widget.TextView[@text="Enter Password"]
${ERRREINPTPASS}        //android.widget.TextView[@text="Password Does Not Matches"]

# --- Login process ----
${LOGINPAGE}            id=com.loginmodule.learning:id/appCompatTextViewLoginLink
${EMAIL_LOGIN}          id=com.loginmodule.learning:id/textInputEditTextEmail
${PASS_LOGIN}           id=com.loginmodule.learning:id/textInputEditTextPassword
${BUTTON_LOGIN}         id=com.loginmodule.learning:id/appCompatButtonLogin
${VERIFYSUCCESSLOGIN}   //android.widget.TextView[@resource-id="com.loginmodule.learning:id/textViewEmail" and @text="ikirfan60@gmail.com"]
${ERRORLOGIN}           id=com.loginmodule.learning:id/snackbar_text

*** Keywords ***
Open app
    Open Application    http://localhost:4723   platformName=${PLATFORM_NAME}         deviceName=${DEVICE_NAME}        app=${APP_PATH}         appPackage=${APP_PACKAGE}     appActivity=${APP_ACTIVITY}       automationName=${AUTOMATION_NAME}    autoGrantPermissions=${GRANT_PERMISSION}      newCommandTimeout=${TIMEOUT}
    Wait Until Element Is Visible    ${AUTO_CLOSE_PROMPT}    5 seconds
    Click Element    ${AUTO_CLOSE_PROMPT}
Open register page
    Click Element    ${BUTTON_REGISTER}
    Sleep    3s
Input Full Name
    [Arguments]     ${NAME}
    Input Text    ${USER_NAME}      ${NAME}
    Hide Keyboard   ${USER_NAME}
Input Email
    [Arguments]     ${EMAIL}
    Input Text    ${USER_EMAIL}    ${EMAIL}
    Hide Keyboard   ${USER_EMAIL}
Enter Password
    [Arguments]     ${PASSWORD}
    Input Text    ${PASSWORDS}    ${PASSWORD}
    Hide Keyboard   ${PASSWORDS}
Input Reconfirm Password
    [Arguments]     ${REINPUTPASS}
    Input Text    ${REINPUTPASSWORD}    ${REINPUTPASS}
    Hide Keyboard
Submit register button
    Click Element    ${SUBMIT_DATA_REGISTER}
Success Registered
     Sleep    2s
     ${element_text}=    Get Text    ${DATASUBMITTED}
     Log    The actual text in the user name field is: ${element_text}
     Should Be Equal    ${element_text}    ${SUCESS_REGISTER}

Error Message Disaplayed under section name
     Sleep    2s
     ${element_text}=    Get Text    ${ERORFIELONAME}
     Log    The actual text in the user name field is: ${element_text}
     Should Be Equal    ${element_text}    ${EROR_SECTIONNAME}

Error Message Disaplayed under section email
     Sleep    2s
     ${element_text}=    Get Text    ${ERRORONEMAIL}
     Log    The actual text in the user name field is: ${element_text}
     Should Be Equal    ${element_text}    ${ERROR_SECTIONEMIAL}

Error Message Disaplayed under section password
     Sleep    2s
     ${element_text}=    Get Text    ${ERRORONPASS}
     Log    The actual text in the user name field is: ${element_text}
     Should Be Equal    ${element_text}    ${EROR_SECTIONPASSWORD}

Error Message displayed under section reinput pass
     Wait Until Element Is Visible   ${ERRREINPTPASS}   10 seconds
     ${element_text}=    Get Text    ${ERRREINPTPASS}
     Log    The actual text in the user name field is: ${element_text}
     Should Be Equal    ${element_text}    ${ERROR_SECTIONREINPUTPASS}

Input email login
    Sleep    2s
    [Arguments]     ${MAIL_TO_LOGIN}
    Input Text    ${EMAIL_LOGIN}    ${MAIL_TO_LOGIN}

Input Password login
    [Arguments]       ${TO_PASS_LOGIN}
    Input Text    ${PASS_LOGIN}    ${TO_PASS_LOGIN}

Button Login
    Click Element    ${BUTTON_LOGIN}

User success login
    Sleep    2s
    ${element_text}=    Get Text    ${VERIFYSUCCESSLOGIN}
    Log    The actual text in the user name field is: ${element_text}
    Should Be Equal    ${element_text}    ${DATAEMAIL}

open login page
    Click Element    ${LOGINPAGE}

Failed To Login
    Sleep    2s
    ${element_text}=    Get Text    ${ERRORLOGIN}
    Log    The actual text in the user name field is: ${element_text}
    Should Be Equal    ${element_text}    ${ERROR_MESSAGE_LOGIN}


Clean email
    Clear Text    ${EMAIL_LOGIN}

Clean Password
    Clear Text    ${PASS_LOGIN}

Clean email on register form
    Clear Text    ${USER_EMAIL}

Clean pasword on register form
    Clear Text    ${PASSWORDS}

Clean re input password
    Clear Text    ${REINPUTPASSWORD}
















