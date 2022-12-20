Feature: As a cms user I want to be able to create Mini Landing page content type to promote Mini Landing Page

    Scenario: User is adding new Mini Landing page content type with Content Block
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Mini Landing Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                | field_name                     |
            | Pretty URL               | mini-landing-page                                    | field_pretty_url               |
            | Page Title               | Automated Test Mini Landing Page                     | title                          |
            | Browser Title            | Automated Test Mini Landing Page - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Mini Landing Page - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Mini Landing Page Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Mini Landing Page - Feature Card Desc | field_feature_card_description |
        And user enters "Mini Landing Page List Description" into "List Description" text field
        And user selects 1 Promotional Image from the list of images
        And user remembers the source of selected promo image for further verification
        And user selects "Add Content Block" content item
        And user enters "Content Heading" into Content Heading text field
        And user fills out "HTML Content" text area with "This is HTML content for Content Block."
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Include in search" from "Search Engine Restrictions" dropdown
        When user saves the content page

    Scenario: Add Two Item Feature Card Row section
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Two Item Feature Card Row" content item
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from main page content
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user selects "Add External Feature Card" content item
        And user fills out the following fields
            | fieldLabel        | value                             | field_name                                                                                                |
            | Featured Item Url | https://www.externalcard.com      | field_landing_contents[1][subform][field_two_item_row_cards][1][subform][field_featured_url]              |
            | Card Title        | External Feature Card             | field_landing_contents[1][subform][field_two_item_row_cards][1][subform][field_override_card_title]       |
            | Card Description  | External Feature Card Description | field_landing_contents[1][subform][field_two_item_row_cards][1][subform][field_override_card_description] |
        When user saves the content page

    Scenario: Add list section
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add List" content item
        And user fills out the following fields
            | fieldLabel | value           | field_name                                           |
            | Title      | List Item Title | field_landing_contents[2][subform][field_list_title] |
        And user selects "Title, Description, and Image" from "List Item Style" dropdown
        And user clicks on "Link" link in the Internal Link text area within List Items
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add External Link" from item list dropdown
        And user fills out the following fields
            | fieldLabel | value                  | field_name                                                                             |
            | Link       | https://www.google.com | field_landing_contents[2][subform][field_list_items][1][subform][field_external_link]  |
            | Title      | Google Link            | field_landing_contents[2][subform][field_list_items][1][subform][field_override_title] |
        And user selects "Add Media Link" from item list dropdown
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" button to select media file
        And "Test File for Related Resources" had been selected
        And user fills out the following fields
            | fieldLabel     | value                                    | field_name                                                                             |
            | Override Title | Override Test File for Related Resources | field_landing_contents[2][subform][field_list_items][0][subform][field_override_title] |
        When user saves the content page

    Scenario: Add Borderless Full-Width Card and raw html
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Borderless Full-Width Card" content item
        And user clicks on "Featured Item" link in the "Borderless Full-Width Card" text area
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from main page content
        And user clicks on "Select content" button to select item
        And user selects "Accent Warm" from Card Theme dropdown
        And user selects "Image Left" from Image Position dropdown
        And Button Display dropdown has default value "Show Button"
        And user selects "Show Button" from Button Display dropdown
        And user fills out the following fields
            | fieldLabel      | value                                          | field_name                                            |
            | Button Text     | Button text for Borderless Full-Width Card     | field_landing_contents[3][subform][field_button_text] |
            | Button Alt Text | Button Alt text for Borderless Full-Width Card | field_landing_contents[3][subform][field_button_alt]  |
        And user selects "Add Raw Html Content" content item
        And user enters '<div class="callout-box" tabindex="0"><p>This is to test Raw HTML Content</p></div>'
        When user saves the content page


    Scenario: Add Dynamic List section
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Dynamic List" content item
        And user fills out the following fields
            | fieldLabel | value              | field_name                                           |
            | List Title | Dynamic List Title | field_landing_contents[5][subform][field_list_title] |
        And user selects "Press Releases" from Source View dropdown
        And user selects "Archive Block" from Display dropdown
        And user clicks "Options" link in the Dynamic List area
        And user checks Include View Title checkbox
        And user enters "5" into Items per page dropdown
        And Pagination dropdown has default value "Default settings"
        And user selects "Mini pager" from "Pagination" dropdown
        And user selects "Published" from Save as dropdown
        When user saves the content page
