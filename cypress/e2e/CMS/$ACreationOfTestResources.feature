Feature: Adding any necessary test resources

    Scenario: create a new image
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on Image content type
        Then page title is "Add Image"
        And user fills out the following fields
            | fieldLabel   | value                | field_name             |
            | Name         | Automated Test Image | name[0][value]         |
            | Photo Credit | Test Credit          | field_credit[0][value] |
        And user types "Test Caption" into Caption text field
        And user uploads test "main" image "main_image.jpg"
        And system waits for file upload process
        And user clicks on CROP IMAGE button
        And browser waits
        And user sets the following crops
            | crop      | cropcase  | locator              |
            | Thumbnail | thumbnail | a[href*="thumbnail"] |
            | 4x3       | 4x3       | a[href*="4x3"]       |
            | 3x4       | 3x4       | a[href*="3x4"]       |
            | 1x1       | 1x1       | a[href*="1x1"]       |
            | 16x9      | 16x9      | a[href*="16x9"]      |
            | 9x16      | 9x16      | a[href*="9x16"]      |
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

    Scenario: create a new NCIDS image
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on Image content type
        Then page title is "Add Image"
        And user fills out the following fields
            | fieldLabel   | value       | field_name             |
            | Name         | NCIDS Image | name[0][value]         |
            | Photo Credit | Test Credit | field_credit[0][value] |
        And user types "Test Caption" into Caption text field
        And user uploads test "main" image "social_media_image.jpg"
        And system waits for file upload process
        And browser waits
        And user clicks on CROP IMAGE button
        And browser waits
        And user sets the following crops
            | crop      | cropcase  | locator              |
            | Thumbnail | thumbnail | a[href*="thumbnail"] |
            | 4x3       | 4x3       | a[href*="4x3"]       |
            | 3x4       | 3x4       | a[href*="3x4"]       |
            | 1x1       | 1x1       | a[href*="1x1"]       |
            | 16x9      | 16x9      | a[href*="16x9"]      |
            | 9x16      | 9x16      | a[href*="9x16"]      |
        And user uploads NCIDS image overrides as follows
            | fileName              | type                 |
            | panoramic_image.jpg   | ncids_promo_art_16x9 |
            | contextual_image.jpeg | ncids_promo_art_4x3  |
            | thumbnail_image.jpg   | ncids_promo_art_1x1  |
        And browser waits
        Then user saves the content page

    Scenario: Create article and file to test related resources functionality
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                | field_name                     |
            | Pretty URL               | article                                              | field_pretty_url               |
            | Page Title               | Article to test Related Resources                    | title[0][value]                |
            | Browser Title            | Article to test Related Resources                    | field_browser_title            |
            | Meta Description         | Article to test Related Resources - Meta Description | field_page_description         |
            | Feature Card Description | Automated Test Article - Feature Card Desc           | field_feature_card_description |
        And user selects "Automated Test Image" Promotional Image from the list of images
        And browser waits
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar
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
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on Edit page with url "test-file" from the list of content
        And user selects "Published" from "Change to" dropdown
        Then user saves the content page


    Scenario: User is creating new Mini Landing page content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Mini Landing Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                               | field_name                     |
            | Pretty URL               | mini-landing-page-test-promo                        | field_pretty_url               |
            | Page Title               | Test Resource Mini Landing Page                     | title                          |
            | Browser Title            | Test Resource Mini Landing Page - Browser Title     | field_browser_title            |
            | Meta Description         | Test Resource Mini Landing Page Meta Description    | field_page_description         |
            | Feature Card Description | Test Resource Mini Landing Page - Feature Card Desc | field_feature_card_description |
            | Card Title               | Test Resource Mini Landing Page - Card Title        | field_card_title               |
        And user enters "Mini Landing Page List Description" into "List Description" text field
        And user selects 1 Promotional Image for the mini landing
        And user remembers the source of selected promo image for the mini landing
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar

