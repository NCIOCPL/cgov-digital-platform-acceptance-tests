Feature: As a CMS user I should be able to login via SSO

    Scenario: SSO verification
        Given user is navigating to "/saml_login"
        When user logs in as a "ocpl-test" 
        Then user is logged in and the user name "ocpl-test" is displayed in the toolbar