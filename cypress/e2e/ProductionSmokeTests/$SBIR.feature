@smoke
Feature: Basic checks to ensure production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "Small Business Funding,Commercialization,Portfolio,Events,About"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                            | title                |
            | /small-business-funding/grants | NCI SBIR/STTR Grants |

    Scenario: English 404 page
        Given user is navigating to "/chicken" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for, but don’t let that stop your entrepreneurial journey! Follow the links below for some key information on the NCI SBIR/STTR program." is displayed

    # Scenario: SBIR events
    #     Given user is navigating to "/events"
    #     Then all displayed events have a future date or text "We have no events posted right now, but check back soon for a listing of upcoming events and meetings." is displayed 