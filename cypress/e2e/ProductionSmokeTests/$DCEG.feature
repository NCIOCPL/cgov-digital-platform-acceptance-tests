@smoke
Feature: Basic checks to ensure production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "About DCEG,Our Research,Fellowships & Training,Tools & Resources,News & Events"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                                                     | title                         |
            | /news-events/events                                     | Meetings & Events             |
            | /about/organization/tdrp/meb/tools                      | Tools, Methods, and Resources |

    Scenario: English 404 page
        Given user is navigating to "/chicken " with a 404 status
        Then page title is "Page Not Found"
        And the text "Sorry, we can't find the page you're looking for." is displayed