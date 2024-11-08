@smoke
Feature: Basic checks to ensure NCP production site is up and running

    Scenario: Home page is loading on all sites
        Given user is navigating to "/"
        Then mega menu is displayed
        And main categories titles are "About the Plan,Goals,Get Involved"
        And footer is displayed

    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed

        Examples:
            | url    | title                      |
            | /goals | National Cancer Plan Goals |


    Scenario: English 404 page
        Given user is navigating to "/chicken" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed

    Scenario: Verify favicons
        Given user is navigating to "/"
        Then the following favicons links are present
            | rel              | href                                                                                              | sizes | type          |
            | icon             | https://nationalcancerplan.cancer.gov/sites/g/files/xnrzdm281/files/favicons/favicon.ico          | 32x32 | none          |
            | icon             | https://nationalcancerplan.cancer.gov/sites/g/files/xnrzdm281/files/favicons/favicon.svg          | none  | image/svg+xml |
            | apple-touch-icon | https://nationalcancerplan.cancer.gov/sites/g/files/xnrzdm281/files/favicons/apple-touch-icon.png | none  | none          |
            | manifest         | https://nationalcancerplan.cancer.gov/sites/g/files/xnrzdm281/files/favicons/manifest.webmanifest | none  | none          |