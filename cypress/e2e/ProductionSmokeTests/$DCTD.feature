@smoke
Feature: Basic checks to ensure DCTD production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "Funding;Research;Data, Tools & Biospecimens;Drug Discovery & Development Resources;Programs;About"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url                                                               | title                                  |
            | /programs/cip                                                     | Cancer Imaging Program (CIP)           |
            | /about/news-events                                                | News and Events                        |
            | /drug-discovery-development/assays/assay-cascade-characterization | Assay Cascade Characterization Service |

    Scenario: English 404 page
        Given user is navigating to "/chicken " with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed