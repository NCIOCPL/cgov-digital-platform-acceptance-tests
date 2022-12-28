@smoke
Feature: Basic checks to ensure DCEG production site is up and running

    Scenario: DCEG home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "About DCEG,Our Research,Fellowships & Training,Tools & Resources,News & Events"
        And footer is displayed

    Scenario Outline: DCEG different content pages are loaded
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                                                     | title                     |
            | /news-events/events                                     | Meetings & Events         |
            | /about/diversity-inclusion/inclusivity-minute?year=2019 | 2019 - Inclusivity Minute |

    Scenario: DCEG English 404 page
        Given user is navigating to "/chicken " with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed