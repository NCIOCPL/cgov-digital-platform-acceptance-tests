@smoke
Feature: Basic checks to ensure TTC production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "Available Technologies,Partnering,Investigators,Fellowships & Training,News & Events,About TTC"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                     | title                                           |
            | /partnering             | Partnering with NCI Through Technology Transfer |
            | /investigators          | Investigators                                   |
            | /news-events            | News & Events                                   |

    Scenario: English 404 page
        Given user is navigating to "/chicken" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed

    Scenario: Abstract Details
        Given user is navigating to "/available-technologies?abstract=TAB-4453"
        Then content is displayed