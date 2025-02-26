@smoke
Feature: Basic checks to ensure CCG production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "Research,Access Data,Funding,News & Events,About CCG,Contacts & Help"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                    | title                                      |
            | /access-data           | Access CCG Data                            |
            | /funding-opportunities | CCG Funding Opportunities                  |
            | /blog                  | Updates & Insights Blog                    |
            | /about                 | About The Center for Cancer Genomics (CCG) |
            | /contacts              | OCG Contacts and Help                      |


    Scenario: English 404 page
        Given user is navigating to "/chicken" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed

