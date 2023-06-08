Feature: User creating an image

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


   Scenario: Create test pages to test image overrides
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And browser waits
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                    | field_name             |
            | Pretty URL       | article-to-test-image                    | field_pretty_url       |
            | Page Title       | Article to test Image                    | title[0][value]        |
            | Browser Title    | Article to test Image                    | field_browser_title    |
            | Meta Description | Article to test Image - Meta Description | field_page_description |
        And user selects "Test Image" Lead Image from the list of images
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Mini Landing Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                             | field_name             |
            | Pretty URL       | mini-landing-page-image                           | field_pretty_url       |
            | Page Title       | Mini Landing Page to test Image                   | title                  |
            | Browser Title    | Mini Landing Page to test Image                   | field_browser_title    |
            | Meta Description | Mini Landing Page to test Image  Meta Description | field_page_description |
        And user selects "Test Image" as Promotional Image from the list of images
        And browser waits
        And user selects "Add Two Item Feature Card Row" content item
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And user clicks on "Select content" button item
        And user selects "Article to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And "Article to test Image" had been selected
        And user selects "Add List" content item
        And user fills out the following fields
            | fieldLabel | value           | field_name                                           |
            | Title      | List Item Title | field_landing_contents[1][subform][field_list_title] |
        And user selects "Title, Description, and Image" from "List Item Style" dropdown
        And user clicks on "Link" link in the Internal Link text area within List Items
        And user clicks on "Select content" button item
        And user selects "Article to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Published" from "Save as" dropdown
        When user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Home and Landing" content type
        Then page title is "Home and Landing"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                             | field_name             |
            | Pretty URL       | home-and-landing-page-image                       | field_pretty_url       |
            | Page Title       | Home and Landing page for Image                   | title                  |
            | Browser Title    | Home and Landing page for Image - Browser Title  | field_browser_title    |
            | Meta Description | Home and Landing page for Image  Meta Description | field_page_description |
        And user selects "Add Multimedia Row" from Contents dropdown
        And browser waits
        And user selects "Add Internal Feature Card" from "Feature Card" dropdown "Multimedia Row" section
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item
        And user selects "Mini Landing Page to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify image overrides
        Given user is navigating to the front end site with path site section plus "article-to-test-image"
        Then lead image is displayed with source "main_image"
        And caption reads "Test Caption"
        And credit reads "Test Credit"
        And "Enlarge" button is displayed
        When user is navigating to the front end site with path site section plus "mini-landing-page-image"
        Then feature card image is displaying "feature_card_image"
        And item in the list has an image "thumbnail_image"
        When user is navigating to the front end site with path site section plus "home-and-landing-page-image"
        Then the "feature_card_image" appear as override
            


Scenario: Clean up
   Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "article-to-test-image" from the list of content
        And user selects a checkbox next to title with url "mini-landing-page-image" from the list of content
        And user selects a checkbox next to title with url "home-and-landing-page-image" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete these content items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 3 content items" appears on a screen
        And user clicks on "Media" sub tab
        And user deletes "Test Image" image
        And the image "Test Image" does not exist in the list of content