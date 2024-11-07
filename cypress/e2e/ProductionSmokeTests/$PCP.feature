@smoke
Feature: Basic checks to ensure PCP production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "Members,About,Reports & Meetings,National Cancer Plan"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url               | title                                                                               |
            | /reports-meetings | Reports and Meetings                                                                |
            | /ncp/report       | Report: The President’s Cancer Panel Initial Assessment Of The National Cancer Plan |
            | /about/blogs      | Blogs                                                                               |

    Scenario: English 404 page
        Given user is navigating to "/chicken" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed
