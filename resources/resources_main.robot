*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/variables.py

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${url}    ${browser_name}
    open browser    ${url}    ${browser_name}
    maximize browser window
    log    Starting test in ${browser_name}
    log    Test URL: ${url}

Login to the Webpage
    [Arguments]    ${user_email}    ${password}
    click element    //*[@id="personal_block"]/div[2]/span
    wait until element is visible    id:wrap_ajax_auth
    input text    id:USER_LOGIN_POPUP    ${user_email}
    input password    id:USER_PASSWORD_POPUP    ${password}
    click button    name:Login

Choosing the "protein"
    mouse over    class:menu_item_l1
    page should contain element    class:dropdown-menu
    mouse down    xpath=//li[contains(.,'Протеин')]
    click element    xpath://li[contains(.,'Протеин')]
    location should be    https://vitaminof.ru/catalog/
    click link    //*[@id="content"]/ul/li[84]/a
    location should be    https://vitaminof.ru/catalog/proteiny/

Sorting the category
    click link    //*[@id="right_block_ajax"]/div/div[2]/div[1]/a[2]
    location should be    https://vitaminof.ru/catalog/proteiny/?sort=PRICE&order=desc

The most expensive products
    click link    //*[@id="bx_3966226736_14050_pict"]
    click element    //*[@id="content"]/div[1]/div[4]/div[2]/div/div/div[2]/div[2]/div[1]/div[5]/div
    go back
    click link    //*[@id="basket_line"]/div/div[2]/a

CLose Browser and Log
    close browser
    log    The test is finished!


