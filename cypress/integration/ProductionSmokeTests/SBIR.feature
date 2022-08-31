@smoke
Feature: Basic checks to ensure production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "SMALL BUSINESS FUNDING,COMMERCIALIZE YOUR TECHNOLOGY,PORTFOLIO,EVENTS,ABOUT"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                            | title                |
            | /small-business-funding/grants | NCI SBIR/STTR Grants |