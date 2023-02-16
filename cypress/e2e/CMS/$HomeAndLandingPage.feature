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
        And user selects 2 Promotional Image from the list of images to be displayed in mini landing pages
        And browser waits
        And user remembers the source of selected promotional image to be displayed in mini landing pages for further verification
        And browser waits
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
        And user clicks on "Apply" button
        And browser waits
        And user selects 1 item from the media list
        And browser waits
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
        And user selects 4 Promotional Image from the list of images
        And browser waits
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

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "home-and-landing-page"
        And page title is "Automated Test Home and Landing page"
        And primary feature card row displays the following cards
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
            | Featured Item Url                 | https://www.google.com      |
        And 3 primary feature card has text "This is to test Raw Html Content under Primary Feature Card Row"
        And guide card row title is "Guide Card Row Title"
        And guide card row displays the following cards
            | title                          | link                                       |
            | Content Heading Guide Card Row | /about-cancer/understanding/what-is-cancer |
        And 2 guide card has text "This is to test Raw Html Content under Guide Card Row"
        And secondary feature card row displays the following cards
            | title                                  | link                        |
            | Article to test Related Resources      | {TEST_SITE_SECTION}/article |
            | Google Link Secondary Feature Card Row | https://www.google1.com     |
        And multimedia card row has a video which name matches selected multimedia card item
        And multimedia card row displays the following cards
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
        And list card row title is "List Title"
        And list row displays the following links
            | title                                | link                          | description                                          |
            | Article to test Related Resources    | {TEST_SITE_SECTION}/article   | Article to test Related Resources - Meta Description |
            | Google Link List Item                | https://www.google2.com       |                                                      |
            | Media Link Override Title List Items | {TEST_SITE_SECTION}/test-file |                                                      |
        And one-column card row title is "One Column Container Title"
        And one-column content displays text "This is Html content for Content Block in One Column Container"
        And one-column list has the following links
            | title                             | link                        | description                                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article | Article to test Related Resources - Meta Description |
            | Google Link One Column Container  | https://www.google3.com     |                                                      |
        And one-column list has raw html displaying "This is Html content for Content Block in One Column Container"
        And two-column list has raw html displaying "This is to test Raw HTML Content in Two Columns container"
        And two-column content heading reads "Content Heading Two Column Container"
        And two-column html content reads "This is Html content for Content Block Two Column"
        And two-column dynamic list shows "Press Releases"
        And dynamic lists shows 5 items
        And borderless card title is "Override title for Borderless Card"
        And borderless card long description is "Longer Override Card Description for Borderless Card"
        And borderless card button has title text "BUTTON TEXT FOR BORDERLESS FULL-WIDTH CARD" and links to "{TEST_SITE_SECTION}/article"
        And title first feature card row has the following cards
            | title                                | link                        |
            | Google Link Title First Feature card | https://www.google6.com     |
            | Article to test Related Resources    | {TEST_SITE_SECTION}/article |
        And the page contains meta tags with the following names
            | name        | content                                               |
            | description | Automated Test Home and Landing page Meta Description |

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
            | fieldLabel               | value                                                                | field_name                     |
            | Pretty URL               | test-resource-mini-landing-page-for-home-landing                     | field_pretty_url               |
            | Page Title               | Test Resource Mini Landing Page for Home Landing                     | title                          |
            | Browser Title            | Test Resource Mini Landing Page for Home Landing - Browser Title     | field_browser_title            |
            | Card Title               | Test Resource Mini Landing Page for Home Landing - Card Title        | field_card_title               |
            | Meta Description         | Test Resource Mini Landing Page for Home Landing Meta Description    | field_page_description         |
            | Feature Card Description | Test Resource Mini Landing Page for Home Landing - Feature Card Desc | field_feature_card_description |
        And user enters "Mini Landing Page List Description" into "List Description" text field
        And user selects 1 Promotional Image from the list of images for mini landing page
        And user remembers the source of selected promo image for further verification for mini landing page
        And user selects "Add Content Block" content item
        And user enters "Content Heading" into Content Heading text field
        And user fills out "HTML Content" text area with "This is HTML content for Content Block."
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Include in search" from Search Engine Restrictions dropdown
        When user saves the content page
        And user clicks on the tool bar status green button "Draft"
        And user selects "Quick Publish" from workflow actions

    Scenario: Edit and republish Home and Landing Page content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                        | field_name             |
            | Pretty URL       | home-and-landing-page-edited                                 | field_pretty_url       |
            | Page Title       | Automated Test Home and Landing Page Edited                  | title                  |
            | Meta Description | Automated Test Home and Landing Page Meta Description Edited | field_page_description |
        And user fills out the following fields
            | fieldLabel          | value                        | field_name                                                                                           |
            | Override Card Title | Featured Item Override Title | field_landing_contents[0][subform][field_row_cards][0][subform][field_override_card_title][0][value] |
            | Title               | -Edited                      | field_landing_contents[1][subform][field_container_heading][0][value]                                |
        And user enters "<div> Edited</div>" into Raw HTML Content text field under Primary Feature Card Row
        And user removes multimedia card
        And user clicks on "Multimedia Card" button in the Multimedia row text area
        And user clicks on "Select media" to choose a media to link
        And user filters results by Type "Video"
        And user filters results by "Is Published" "True"
        And user clicks on "Apply" button
        And browser waits
        And user selects 2 item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user remembers the name of media card item for future verification
        And user selects "Add Primary Feature Card Row" from "Contents" dropdown
        And user fills out the following fields
            | fieldLabel | value                              | field_name                                                            |
            | Title      | Verify Mini Landing Card and Promo | field_landing_contents[9][subform][field_container_heading][0][value] |
        And user clicks on the "Featured Item" link in "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item 2
        And browser waits
        And user selects "Test Resource Mini Landing Page for Home Landing" item from the list
        And user clicks on the "Select content" button to select item
        And browser waits
        And the "Test Resource Mini Landing Page for Home Landing" had been selected
        And browser waits
        Then user saves the content page
        And browser waits
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "home-and-landing-page-edited"
        Then page title is "Automated Test Home and Landing Page Edited"
        And primary feature card row displays the following cards
            | title                        | link                        |
            | Featured Item Override Title | {TEST_SITE_SECTION}/article |
            | Featured Item Url            | https://www.google.com      |
        And guide card row title is "Guide Card Row Title-Edited"
        And 3 primary feature card has text "This is to test Raw Html Content under Primary Feature Card Row Edited"
        And guide card row title is "Guide Card Row Title-Edited"
        And multimedia card row has a video which name matches selected multimedia card item
        And the page contains meta tags with the following names
            | name        | content                                                      |
            | description | Automated Test Home and Landing Page Meta Description Edited |
        And last feature card row displays the following cards
            | title                                                         | link                                                                 | featureCardDescription                                               |
            | Test Resource Mini Landing Page for Home Landing - Card Title | {TEST_SITE_SECTION}/test-resource-mini-landing-page-for-home-landing | Test Resource Mini Landing Page for Home Landing - Feature Card Desc |

    Scenario: Add a featured item to mini landing page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-promo" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user selects the "Add Two Item Feature Card Row" content item
        And user clicks on the "Featured Item" link in the "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item
        And browser waits
        And user selects "Automated Test Home and Landing Page Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Home and Landing Page Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with the path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image

    Scenario: Remove featured item
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-promo" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user removes "Two Item Feature Card Row" section
        And user confirms removal
        And browser waits
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions


    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "test-resource-mini-landing-page-for-home-landing" from the list of content
        And user selects a checkbox next to title with url "home-and-landing-page-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete these content items?"
        And browser waits
        When user clicks on the "Delete" button
        And browser waits
        Then the confirmation text "Deleted 2 content items." appears on a screen
        And the content item with url "test-resource-mini-landing-page-for-home-landing" does not exist in the list of content
        And the content item with url "home-and-landing-page-edited" does not exist in the list of content