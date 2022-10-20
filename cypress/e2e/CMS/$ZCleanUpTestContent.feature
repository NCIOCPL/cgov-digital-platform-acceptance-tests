 Feature: delete all content created for testing purposes, that is shared across features
 
 Scenario: Clean up related resources test content
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user deletes test article with url "article"
        And the content item with url "article" does not exist in the list of content
        And user clicks on "Media" sub tab
        And user deletes test file with url "test-file"
        And the content item with url "test-file" does not exist in the list of content
