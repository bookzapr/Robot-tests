*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://futureskill.co/
${BROWSER}    chrome
${EMAIL}    johndoe123@example.com
${FIRST_NAME}    John
${LAST_NAME}    Doe
${PHONE}    0812345689
${PASSWORD}    SecurePassword123
${CONFIRM_PASSWORD}    SecurePassword123

*** Test Cases ***

Test User Registration
    [Documentation]    ทดสอบการสมัครสมาชิกใหม่
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//button[contains(text(), 'สมัครสมาชิก')]    10s
    Click Element    xpath=//button[contains(text(), 'สมัครสมาชิก')]
    
    # กรอกข้อมูลในฟอร์มสมัครสมาชิก
    Wait Until Page Contains Element    xpath=//input[@placeholder='อีเมล']    10s
    Input Text    xpath=//input[@placeholder='อีเมล']    ${EMAIL}
    Input Text    xpath=//input[@placeholder='ชื่อ']    ${FIRST_NAME}
    Input Text    xpath=//input[@placeholder='นามสกุล']    ${LAST_NAME}
    Input Text    xpath=//input[@placeholder='เบอร์โทรศัพท์']    ${PHONE}
    Input Text    xpath=//input[@placeholder='รหัสผ่าน']    ${PASSWORD}
    Input Text    xpath=//input[@placeholder='ยืนยันรหัสผ่าน']    ${CONFIRM_PASSWORD}
    
    # คลิกเลือก checkbox ยอมรับข้อตกลงการใช้งาน
    Click Element    xpath=//input[@type='checkbox']
    
    # คลิกปุ่ม "สมัครสมาชิก"
    Click Element    xpath=//button[contains(text(), 'สมัครสมาชิก')]
    
    Capture Page Screenshot
    [Teardown]    Close Browser
