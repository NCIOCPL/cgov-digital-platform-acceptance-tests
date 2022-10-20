 Feature: Adding any necessary test resources
 
 Scenario: Create article and file to test related resources functionality
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                                | field_name             |
            | Pretty URL       | article                                              | field_pretty_url       |
            | Page Title       | Article to test Related Resources                    | title[0][value]        |
            | Browser Title    | Article to test Related Resources                    | field_browser_title    |
            | Meta Description | Article to test Related Resources - Meta Description | field_page_description |
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value                           | field_name          |
            | Pretty URL    | test-file                       | field_pretty_url    |
            | Name          | Test File for Related Resources | name[0][value]      |
            | Browser Title | Test File for Related Resources | field_browser_title |
        And user uploads test file "text.txt"
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page