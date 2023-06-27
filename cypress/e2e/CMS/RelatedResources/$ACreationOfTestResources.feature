Feature: Adding any necessary test resources

Scenario: create a new image
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on Image content type
        Then page title is "Add Image"
        And user fills out the following fields
            | fieldLabel   | value       | field_name             |
            | Name         | Test Image  | name[0][value]         |
            | Photo Credit | Test Credit | field_credit[0][value] |
        And user types "Test Caption" into Caption text field
        And user uploads test "main" image "main_image.jpg"
        And system waits for file upload process
        And user clicks on CROP IMAGE button
        And browser waits
        And user sets the following crops
            | crop      |cropcase| locator              |
            | Thumbnail |thumbnail| a[href*="thumbnail"] |
            | 4x3       |4x3| a[href*="4x3"]       |
            | 3x4       |3x4| a[href*="3x4"]       |
            | 1x1       |1x1| a[href*="1x1"]       |
            | 16x9      |16x9| a[href*="16x9"]      |
            | 9x16      |9x16| a[href*="9x16"]      |
        And user selects "Display" from "Display Enlarge" dropdown
        And user uploads test "feature" image "feature_card_image.jpg"
        And system waits for file upload process
        And user uploads test "thumbnail" image "thumbnail_image.jpg"
        And system waits for file upload process
        And user uploads test "social media" image "social_media_image.jpg"
        And system waits for file upload process
        And user uploads test "panoramic" image "panoramic_image.jpg"
        And system waits for file upload process
        Then user saves the content page

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
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page