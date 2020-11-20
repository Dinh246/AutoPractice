@homepage
Feature: Homepage
    In order to make sure the page works
    As a tester
    I want Homepage has all features below

    Background: Go to the page
        Given get to the testing page
        When user in Shop Menu and click on Home Menu button

    @3sliders
    Scenario: Only three Sliders on Home menu
        Then the Homepage must contains three Sliders only

    @3arrivals
    Scenario: Only three Arrivals on Home menu
        Then the Homepage must contains three Arrivals only
