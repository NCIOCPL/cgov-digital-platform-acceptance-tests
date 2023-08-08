Feature: As a cms user I want to be able to embed Image Carousel in Article content type

    Scenario: User is creating new Image Carousel for verifying embedding of Image Carousel in the WYSIWYG
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on sub tab "Block layout"
        And user clicks on "Custom block library" sub sub tab
        And user clicks on "Add custom block" action button
        And user clicks on "Image Carousel" content type
        Then page title is "Add Image Carousel custom block"
        And user fills out the following fields
            | fieldLabel           | value                               | field_name                           |
            | Block description    | Automated Image Carousel Test Block | info[0][value]                       |
            | Image Carousel Title | Automated Image Carousel Title Test | field_carousel_image_title[0][value] |
        And user clicks on "Images" button to select image
        And user clicks on "Select images" button 1 to select an image
        And user enters "Test Image" into media title search box to search image and clicks "Apply"
        And browser waits
        And user selects "Test Image" item from the media list to select image
        And user clicks on "Select Images" button to select an image
        And browser waits
        And user clicks on "Select images" button 2 to select an image
        And user enters "Test Image" into media title search box to search image and clicks "Apply"
        And browser waits
        And user selects "Test Image" item from the media list to select image
        And user clicks on "Select Images" button to select an image
        And browser waits
        And user clicks on "Select images" button 3 to select an image
        And user enters "Test Image" into media title search box to search image and clicks "Apply"
        And browser waits
        And user selects "Test Image" item from the media list to select image
        And user clicks on "Select Images" button to select an image
        And browser waits
        Then user saves the content page


    Scenario: Verify the newly created Image Carousel
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on sub tab "Block layout"
        And user clicks on "Custom block library" sub sub tab
        And the content item with title "Automated Image Carousel Test Block" exists in the list of content


    Scenario: Create an English Article content type and embed the Image Carousel created above
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
        And user fills out the following fields
            | fieldLabel               | value                                                             | field_name                     |
            | Pretty URL               | article-to-test-image-carousel                                    | field_pretty_url               |
            | Page Title               | Automated Test Article to test Image Carousel                     | title[0][value]                |
            | Browser Title            | Automated Test Article to test Image Carousel - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article to test Image Carousel - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Article to test Image Carousel - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Article to test Image Carousel - Feature Card Desc | field_feature_card_description |
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "Image Carousel: Full, Center"
        And user clicks "Insert Block Content" button 1 in the WYSIWYG editor
        And browser waits
        And user enters "Automated Image Carousel Test" into content title search box and clicks "Apply"
        And user selects "Automated Image Carousel Test" item from the content list
        And browser waits
        And user clicks on "Select block" button to select the media
        And browser waits
        And "Display as" dropdown has the following options
            | options                |
            | Feature Card: Image    |
            | Feature Card: No Image |
            | Full                   |
        And "Display as" dropdown is displayed "Feature Card: Image"
        And user select "Full" from the "Display as" dropdown
        And browser waits
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And the radio button "None" is selected by default under "Align"
        And user selects "center" radio button under "Align"
        And browser waits
        And user clicks on "Embed" button to select the block
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page


    Scenario: Verify embedded Image Carousel at the front end in the English Article
        Given user is navigating to the front end site with path site section plus "article-to-test-image-carousel"
        And browser waits
        And page title is "Automated Test Article to test Image Carousel"
        And 1 section heading reads "Article Heading1"
        And 1 description reads "Image Carousel: Full, Center"
        And 1 image carousel displays the following features
            | alignment                    | title                               | caption      | credit      |
            | embedded-entity align-center | Automated Image Carousel Title Test | Test Caption | Test Credit |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on sub tab "Block layout"
        And user clicks on "Custom block library" sub sub tab
        And user clicks on "Delete" from  dropdown button under "Automated Image Carousel Test Block"
        Then page title is "Are you sure you want to delete the custom block Automated Image Carousel Test Block?"
        When user clicks on "Delete" button
        Then the confirmation text "The custom block Automated Image Carousel Test Block has been deleted." appears on a screen
        And the Custom block item with title "Automated Image Carousel Test Block" does not exist in the list of Custom block library
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "article-to-test-image-carousel" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "article-to-test-image-carousel" does not exist in the list of content