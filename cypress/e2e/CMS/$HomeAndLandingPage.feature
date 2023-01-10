Feature: Home And Landing Page Test Creation of Content

    Scenario: User is adding new Home and Landing page content type and adding a Primary Feature Card Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Home and Landing" content type
        Then page title is "Home and Landing"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                    | field_name                     |
            | Pretty URL               | home-and-landing-page                                    | field_pretty_url               |
            | Page Title               | Automated Test Home and Landing page                     | title                          |
            | Browser Title            | Automated Test Home and Landing page - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Home and Landing page - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Home and Landing page Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Home and Landing page - Feature Card Desc | field_feature_card_description |
        And user enters "Home and Landing page List Description" into "List Description" text field
        And user selects "Add Primary Feature Card Row" from "Contents" dropdown
        And user fills out the following fields
            | fieldLabel | value                    | field_name                                                            |
            | Title      | Primary Feature Card Row | field_landing_contents[0][subform][field_container_heading][0][value] |
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user selects "Add External Feature Card" from "Cards" dropdown "External Feature Card" section
        Then "External Feature Card" section appears
        And user fills out the following fields
            | fieldLabel        | value                                | field_name                                                                                           |
            | Featured Item Url | https://www.google.com               | field_landing_contents[0][subform][field_row_cards][1][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link Primary Feature Card Row | field_landing_contents[0][subform][field_row_cards][1][subform][field_override_card_title][0][value] |
        And user selects "Add Raw Html Content" from "Cards" dropdown "External Feature Card" section
        Then "Raw HTML Content" section appears
        And user enters "<div>This is to test Raw Html Content under Primary Feature Card Row</div>" into Raw HTML Content text field under Primary Feature Card Row
        When user saves the content page


    Scenario: Add Guide Card Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add Guide Card Row" from "Contents" dropdown
        And browser waits
        And user fills out the following fields under "Guide Card Row" section
            | fieldLabel      | value                          | field_name                                                                                         |
            | Title           | Guide Card Row Title           | field_landing_contents[1][subform][field_container_heading][0][value]                              |
            | Content Heading | Content Heading Guide Card Row | field_landing_contents[1][subform][field_guide_cards][0][subform][field_content_heading][0][value] |
        And user clicks on Source tool icon in the html content tool bar
        And browser waits
        And user enters '<li><a class="arrow-link" href="/about-cancer/understanding/what-is-cancer" title="">What Is Cancer</a></li>' into source text field
        And user selects "Add Raw Html Content" from "Cards" dropdown "Guide Card Row" section
        And user enters "<div>This is to test Raw Html Content under Guide Card Row</div>" into Raw HTML Content text field under Guide Card Row
        When user saves the content page


    Scenario: Add Secondary Feature Card Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Secondary Feature Card Row" from "Contents" dropdown
        And browser waits
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area within "Secondary Feature Card Row" section
        And browser waits
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And "Article to test Related Resources" had been selected
        And user selects "Add External Feature Card" from "Cards" dropdown "External Feature Card" section
        And user fills out the following fields
            | fieldLabel        | value                                  | field_name                                                                                           |
            | Featured Item Url | https://www.google1.com                | field_landing_contents[2][subform][field_row_cards][1][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link Secondary Feature Card Row | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_title][0][value] |
        When user saves the content page


    Scenario: Add Multimedia Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Multimedia Row" from "Contents" dropdown
        And browser waits
        And user clicks on "Multimedia Card" link in the "Multimedia Row" text area
        And browser waits
        And user clicks on "Select media" button item
        And user filters results by Type "Video"
        And user filters results by "Is Published" "True"
        And user selects 1 item from the media list
        And user clicks on "Select media" button to select media
        And browser waits
        And user remembers the name of media card item for future verification
        And user selects "Add Internal Feature Card" from "Feature Card" dropdown "Multimedia Row" section
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area within "Multimedia Row" section
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        When user saves the content page


    Scenario: Add List
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add List" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value      | field_name                                                     |
            | Title      | List Title | field_landing_contents[4][subform][field_list_title][0][value] |
        And browser waits
        And user selects "Title, Description, and Image" from List Item Style dropdown under list
        And browser waits
        And user clicks on "Link" link in the List Items text area under List
        And browser waits
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add External Link" from "List Items" dropdown "External Link" section
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                                                       |
            | Link       | https://www.google2.com | field_landing_contents[4][subform][field_list_items][1][subform][field_external_link][0][uri]    |
            | Title      | Google Link List Item   | field_landing_contents[4][subform][field_list_items][1][subform][field_override_title][0][value] |
        And user selects "Add Media Link" from "List Items" dropdown "External Link" section
        Then "Media Link" section appears
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" item button
        And browser waits
        And user fills out the following fields
            | fieldLabel     | value                                | field_name                                                                                       |
            | Override Title | Media Link Override Title List Items | field_landing_contents[4][subform][field_list_items][2][subform][field_override_title][0][value] |
        When user saves the content page


    Scenario: Add One and two column containers
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add One Column Container" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                      | field_name                                                     |
            | Title      | One Column Container Title | field_landing_contents[5][subform][field_container_heading][0] |
        And user clicks on "Add Content Block" option to "Main Contents" within "One Column Container" section
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value                                | field_name                                                                                    |
            | Content Heading | Content Heading One Column Container | field_landing_contents[5][subform][field_main_contents][0][subform][field_content_heading][0] |
        And browser waits
        And user fills out HTML Content text area with "This is Html content for Content Block in One Column Container" under "One Column Container"
        And browser waits
        And user clicks on "Add List" option to "Main Contents" within "One Column Container" section
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                                | field_name                                                                                      |
            | Title      | List Item Title One Column Container | field_landing_contents[5][subform][field_main_contents][1][subform][field_list_title][0][value] |
        And user selects "Title, Description, and Image" from List Item Style dropdown under one column container
        And browser waits
        And user clicks on "Link" link in the "Internal Link" text area within "List" section for "One Column Container"
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add External Link" from "List Items" dropdown "List" section for "One Column Container"
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                            | field_name                                                                                                                        |
            | Link       | https://www.google3.com          | field_landing_contents[5][subform][field_main_contents][1][subform][field_list_items][1][subform][field_external_link][0][uri]    |
            | Title      | Google Link One Column Container | field_landing_contents[5][subform][field_main_contents][1][subform][field_list_items][1][subform][field_override_title][0][value] |
        And user clicks on "Add Raw Html Content" option to "Main Contents" within "One Column Container" section
        And user enters '<div class="callout-box" tabindex="0"><p>This is to test Raw HTML Content in One Column container</p></div>' in Raw HTML Content under "One Column Container"
        And browser waits
        And user selects "Add Two Column Container" from "Contents" dropdown
        And user enters '<div class="callout-box" tabindex="0"><p>This is to test Raw HTML Content in Two Columns container</p></div>' in Raw HTML Content under "Two Column Container"
        And user clicks on "Add Content Block" option to "Main Contents" within "Two Column Container" section
        And user fills out the following fields
            | fieldLabel      | value                                | field_name                                                                                           |
            | Content Heading | Content Heading Two Column Container | field_landing_contents[6][subform][field_main_contents][1][subform][field_content_heading][0][value] |
        And user fills out HTML Content text area with "This is Html content for Content Block Two Column" under "Two Column Container"
        And user clicks on "Add Dynamic List" option to "Main Contents" within "Two Column Container" section
        And browser waits
        And user fills out the following fields
            | fieldLabel | value              | field_name                                                                                      |
            | List Title | Dynamic List Title | field_landing_contents[6][subform][field_main_contents][2][subform][field_list_title][0][value] |
        And browser waits
        And user selects "Press Releases" from Source View dropdown
        And browser waits
        And browser waits
        And user selects "Archive Block" from Display dropdown
        And user clicks "Options" link in the Dynamic List area
        And user checks Include View Title checkbox
        And user enters "5" into Items per page dropdown
        And user selects "Mini pager" from Pagination dropdown
        When user saves the content page


    Scenario: Add Borderless Full-Width Card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Borderless Full-Width Card" from "Contents" dropdown
        And user clicks on "Featured Item" link in the "Borderless Full-Width Card" text area
        And browser waits
        And user clicks on "Select content" button item in the "Borderless Full-Width Card" text area
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And browser waits
        And user selects "Accent Warm" from Card Theme dropdown
        And user selects "Image Left" from Image Position dropdown
        And user selects 1 Promotional Image from the list of images
        And user remembers the source of selected promo image for further verification
        And user selects "Show Button" from Button Display dropdown
        And user fills out the following fields
            | fieldLabel                       | value                                                | field_name                                                                     |
            | Override Card Title              | Override title for Borderless Card                   | field_landing_contents[7][subform][field_override_card_title][0][value]        |
            | Longer Override Card Description | Longer Override Card Description for Borderless Card | field_landing_contents[7][subform][field_override_card_longer_descr][0][value] |
            | Button Text                      | Button text for Borderless Full-Width Card           | field_landing_contents[7][subform][field_button_text][0][value]                |
            | Button Alt Text                  | Button Alt text for Borderless Full-Width Card       | field_landing_contents[7][subform][field_button_alt][0][value]                 |
        When user saves the content page


    Scenario: Add Title First Feature Card Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add Title First Feature Card Row" from "Contents" dropdown
        And user selects "Add External Feature Card" from "Two Column Feature Card" dropdown "Title First Feature Card Row" section
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                                | field_name                                                                                                         |
            | Featured Item Url | https://www.google6.com              | field_landing_contents[8][subform][field_two_column_feature_card][0][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link Title First Feature card | field_landing_contents[8][subform][field_two_column_feature_card][0][subform][field_override_card_title][0][value] |
        And browser waits
        And user selects "Add Internal Feature Card" from "One Column Feature Card" dropdown "Title First Feature Card Row" section
        And browser waits
        And user clicks on "Featured Item" link in the "Title First Feature Card Row" text area
        And browser waits
        And user clicks on "Select content" button item in the "Title First Feature Card Row" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And browser waits
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Include in search" from Search Engine Restrictions dropdown
        And user selects "Published" from Save as dropdown
        When user saves the content page

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "home-and-landing-page" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "mini-landing-page-edited" does not exist in the list of content
