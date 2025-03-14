Feature: Basic checks to ensure DCEG connect production site is up and running

    Scenario: Home page is loading on DCEG connect
        Given user is navigating to "/connect-prevention-study"
        Then mega menu is displayed
        And main categories titles are "Who Can Join,What to Expect,About the Study,Your Privacy,Study News"
        And all mega menu sections have the correct "/connect-prevention-study"
        And footer is displayed

    Scenario: Different contents are loaded on all sites
        Given user is navigating to "/connect-prevention-study/what-to-expect "
        And page title is "What to Expect"
        And page options are displayed
        And content is displayed
       