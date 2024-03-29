Feature: as a site admin I should be able to set site brand either to NCI, no title or custom title

    Scenario: User is setting site name to no title
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        When user clicks on "Configuration" tab
        And user clicks on "Site Branding" sub tab
        And browser title name is set to "NCI" by default
        When user selects "No Title" option
        And user saves the content page

    Scenario: Verify no title option on FE
        Given user is navigating to "/"
        Then the title tag should be "Comprehensive Cancer Information"

    Scenario: User is setting site name to custom
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        When user clicks on "Configuration" tab
        And user clicks on "Site Branding" sub tab
        When user selects "Custom Title" option
        And user clears custom title field
        And user types "Test" in the custom title field
        And user saves the content page

    Scenario: Verify custom option on FE
        Given user is navigating to "/"
        Then the title tag should be "Comprehensive Cancer Information - Test"


    Scenario: clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        When user clicks on "Configuration" tab
        And user clicks on "Site Branding" sub tab
        When user selects "NCI" option
        And user saves the content page

    Scenario: Verify default option on FE
        Given user is navigating to "/"
        Then the title tag should be "Comprehensive Cancer Information - NCI"


    Scenario Outline: Only siteadmin can change the site brand
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "<user>"
        And user clicks "Log in" button
        Then user is logged in and the user name "<user>" is displayed in the toolbar
        When user is navigating to bad url "/admin/config/sitebranding/settings"
        Then status code is 403 on "/admin/config/sitebranding/settings"
        And text "You are not authorized to access this page." is shown on the page

        Examples:
            | user      |
            | author    |
            | editor    |
            | adveditor |
