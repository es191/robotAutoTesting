*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources_main.robot
Variables   ../resources/variables.py

*** Test Cases ***
Our First Test Case
    #1. Preparation
    [Setup]    Open Browser and Maximize    ${url}    ${browser_name}
    [Teardown]    CLose Browser and Log
    Login to the Webpage    ${user_email}    ${password}
    set screenshot directory    ../screenshots

    #2.Choosing the category
    Choosing the "protein"

    #3. We must sort the category of protein by price
    Sorting the category

    #4. We're adding the 1 and 2 element to the cart
    The most expensive products

    #5. Moving to the cart
    location should be    https://vitaminof.ru/basket/

