@smoke
Feature: Basic checks to ensure production site is up and running

    Scenario Outline: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "ABOUT DCEG,OUR RESEARCH,FELLOWSHIPS & TRAINING,TOOLS & RESOURCES,NEWS & EVENTS"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                                                     | title                     |
            | /news-events/events                                     | Meetings & Events         |
            | /about/diversity-inclusion/inclusivity-minute?year=2019 | 2019 - Inclusivity Minute |