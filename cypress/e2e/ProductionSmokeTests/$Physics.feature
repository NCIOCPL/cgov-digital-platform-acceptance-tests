@smoke
Feature: Basic checks to ensure Physics production site is up and running

    Scenario: Physics Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "About,Research & Funding,Advocacy & Outreach,News & Events"
        And footer is displayed

    Scenario Outline: Physics different content pages are loaded correctly
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                            | title                       |
            | /research-funding/moffitt-psoc | Moffitt Cancer Center PS-OC |

    Scenario: Physics English 404 page
        Given user is navigating to "/chicken " with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed

