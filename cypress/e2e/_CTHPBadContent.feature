Feature: as a content editor, I want to ensure that unpublished content does not display on front end
    Scenario: Bad CTHP content- guide card with broken links
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user is navigating to "/test/cthp/bad-guide-card-lists"
        Then page title is "CTHP List Test"
        And card titled "Unpub Page" has a link "Unpublished Page" with href "/test/unpublished-page"
        And card titled "Unpub File" has a link "Unpublished File" with href "/test/unpublished-file"

    Scenario: Verify that none of the links are displayed on front end
        When user is navigating to "/test/cthp/bad-guide-card-lists"
        Then page title is "CTHP List Test"
        And main content area does not have any links