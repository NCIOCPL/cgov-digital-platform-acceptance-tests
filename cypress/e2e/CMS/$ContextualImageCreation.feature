Feature: As a content editor I would like to be able to create contextual image and embed it in my content
    Scenario: Create a new contextual image
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "Contextual Image" content type
        Then page title is "Add Contextual Image"
        And user fills out the following fields
            | fieldLabel   | value                  | field_name             |
            | Name         | Test Contextual Image  | name[0][value]         |
            | Photo Credit | Test Credit            | field_credit[0][value] |
        And user types "Test Caption" into Caption text field
        And user uploads test file "contextual_image.jpeg"
        And system waits for file upload process
        And user clicks on CROP IMAGE button
        And user sets the following crops
            | crop      | locator              |
            | Freeform  | a[href*="freeform"]  |
        And user selects "Display" from "Display Enlarge" dropdown
        Then user saves the content page

    Scenario: Create test pages to test image overrides
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                    | field_name             |
            | Pretty URL       | article-to-test-contextual-image         | field_pretty_url       |
            | Page Title       | Article to test Contextual Image         | title[0][value]        |
            | Browser Title    | Article to test Contextual Image         | field_browser_title    |
            | Meta Description | Article to test Image - Meta Description | field_page_description |
        And user enters "Contextual Image Display: Article: Large,Center" as 1 body section heading
        And user clicks the "Insert Image" button 1 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And "Display as" dropdown defaults to "Image Display: Article: Full"
        And "Display as" dropdown has the following options
            | options                        |
            | Image Display: Article: Full   |
            | Image Display: Article: Large  |
            | Image Display: Article: Medium |
            | Image Display: Article: Small  |
            | Image Display: Inline          |
        And "Align" label defaults to "None"
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And user selects size "Image Display: Article: Large"
        And browser waits
        And user selects "center" alignment
        And user clicks on "Embed" button to select image
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Contextual Image Display: Article: Medium,None" as 2 body section heading
        And user clicks the "Insert Image" button 2 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And user selects size "Image Display: Article: Medium"
        And browser waits
        And user clicks on "Embed" button to select image
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Contextual Image Display: Article: Full,Left" as 3 body section heading
        And user clicks the "Insert Image" button 3 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And user selects size "Image Display: Article: Full"
        And browser waits
        And user selects "left" alignment
        And user clicks on "Embed" button to select image
        And browser waits
        
        And user clicks on "Add Body Section" to add a body section
        And user enters "Contextual Image Display: Article: Inline,Right" as 4 body section heading
        And user clicks the "Insert Image" button 4 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And user selects size "Image Display: Inline"
        And browser waits
        And user selects "right" alignment
        And user clicks on "Embed" button to select image
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Contextual Image Display: Article: Large,None" as 5 body section heading
        And user clicks the "Insert Image" button 5 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And user selects size "Image Display: Article: Large"
        And browser waits
        And user clicks on "Embed" button to select image
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Contextual Image Display: Article: Small,Right" as 6 body section heading
        And user clicks the "Insert Image" button 6 in the WYSIWYG editor
        And user enters "Test Contextual Image" into media title search box and clicks "Apply"
        And browser waits
        And user selects "Test Contextual Image" item from the media list
        And browser waits
        And user clicks on "Select image" button to select media
        And browser waits
        And user selects size "Image Display: Article: Small"
        And browser waits
        And user selects "right" alignment
        And user clicks on "Embed" button to select image
        And browser waits

        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify image
        Given user is navigating to the front end site with path site section plus "article-to-test-contextual-image"
        Then page title is "Article to test Contextual Image"
        And the following images are displayed 
            | size   | alignment |
            | large  | center    |
            | medium | none      |
            | full   | left      |
            | inline | right     |
            | large  | none      |
            | small  | right     |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "article-to-test-contextual-image" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item" appears on a screen
        And user clicks on "Media" sub tab
        And user deletes "Test Contextual Image" image
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this media item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 item" appears on a screen
        And the image "Test Contextual Image" does not exist in the list of content