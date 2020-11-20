@arrivals
Feature: Arrivals images
    As a customer
    I want the Arrivals images do its works

    Background: Images in Arrivals should navigate
        Given get to the testing page
        When user in Shop Menu and click on Home Menu button and click image in Arrivals
        Then image should be clickable and should navigate to next page where user can add that book to his basket

    @description
    Scenario: Arrivals images description
        Then click on the description tab and there should be a description regarding that book customer clicked on

    @reviews
    Scenario: Arrivals images reviews
        Then click on the reviews tab and there should be a reviews regarding that book customer clicked on

    @addtobasket
    Scenario: Arrivals images add to basket
        Then click on the Add to basket button and user can see the book in the Menu item with price
