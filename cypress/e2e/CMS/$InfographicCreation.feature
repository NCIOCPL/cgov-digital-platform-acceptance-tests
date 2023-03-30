Feature: As a cms user I want to be able to create an Infographic media content type to promote Infographic media content type

    Scenario: Create a new English Infographic
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "Infographic" content type
        Then page title is "Add Infographic"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                           | field_name                     |
            | Pretty URL               | test-infographic                                | field_pretty_url               |
            | Name                     | Automated Test Infographic                      | name[0][value]                 |
            | Browser Title            | Automated Test Infographic - Browser Title      | field_browser_title            |
            | Meta Description         | Automated Test Infographic - Meta Desc          | field_page_description         |
            | Card Title               | Automated Test Infographic - Card Title         | field_card_title               |
            | Feature Card Description | Automated Test Infographic - Featured Card Desc | field_feature_card_description |
        And user enters "Automated Test Infographic List Description" into "List Description" text field
        And user fills out "Body" text area with "This is a description of Infographic content type."
        And user types "Automated Test Infographic Caption" into Caption text field
        And user enters "Automated Test Infographic Accessibility Long Description" into "Accessibility Long Description" text field
        And browser waits
        And user uploads test file "infographic-desktop.jpg"
        And system waits for file upload process
        And user enters "Alt Text" into the "Alternative text" text field
        And browser waits
        And user uploads test file "infographic-mobile.jpg"
        And system waits for file upload process
        And user selects 3 Promotional Image from the list of images to be displayed in home and landing pages
        And browser waits
        And user remembers the source of selected promotional image to be displayed in home and landing pages for further verification
        And user selects "Posted Date" checkbox
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page


    Scenario: Verify newly created English Infographic as a media item at desktop breakpoint
        Given user is navigating to the front end site with path site section plus "test-infographic"
        And browser waits
        And screen breakpoint is set to "desktop"
        And page title is "Automated Test Infographic"
        And description reads "This is a description of Infographic content type."
        And the image has the name "infographic-desktop"
        And the caption appears as "Automated Test Infographic Caption"
        And the infographic link "View and Print Infographic" appears with href "infographic-desktop"
        And "Posted:" date is displaying today's date
        And screen breakpoint is set to "mobile"
        Then page title is "Automated Test Infographic"
        And description reads "This is a description of Infographic content type."
        And the image has name "infographic-mobile"
        And the caption appears as "Automated Test Infographic Caption"
        And the infographic link "View and Print Infographic" does not appear
        And "Posted:" date is displaying today's date


    Scenario: Create English test pages to embed Infographic and embed/add infographic to test pages
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
            | fieldLabel               | value                                                          | field_name                     |
            | Pretty URL               | article-to-test-infographic                                    | field_pretty_url               |
            | Page Title               | Automated Test Article to test Infographic                     | title[0][value]                |
            | Browser Title            | Automated Test Article to test Infographic - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article to test Infographic - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Article to test Infographic - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Article to test Infographic - Feature Card Desc | field_feature_card_description |
        And user enters "Article List Description" into "List Description" text field
        And user enters "Article Intro Text" as intro text
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "Infographic Display: Article: Large,None:"
        And user clicks the "Insert Infographic" button 1 in the WYSIWYG editor
        And user enters "Automated Test Infographic" into media title search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from the media list
        And browser waits
        And user clicks on "Select Infographic" button to select media
        And browser waits
        And "Display as" dropdown has the following options
            | options                              |
            | Infographic Display: Article: Large  |
            | Infographic Display: Article: Medium |
        And "Display as" dropdown displays "Infographic Display: Article: Large"
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And the radio button "None" is selected by default under "Align"
        And user clicks on "Embed" button to select infographic
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And user enters "Article Heading2" as 2 body section heading
        And browser waits
        And user fills out 2 "Body" text area with "Infographic Display: Article: Medium,Left:"
        And user clicks the "Insert Infographic" button 2 in the WYSIWYG editor
        And user enters "Automated Test Infographic" into media title search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from the media list
        And browser waits
        And user clicks on "Select Infographic" button to select media
        And browser waits
        And user select "Infographic Display: Article: Medium" from the "Display as" dropdown
        And browser waits
        And user selects "left" radio button under "Align"
        And user clicks on "Embed" button to select infographic
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And user enters "Article Heading3" as 3 body section heading
        And browser waits
        And user fills out 3 "Body" text area with "Infographic Display: Article: Medium,Center:"
        And user clicks the "Insert Infographic" button 3 in the WYSIWYG editor
        And user enters "Automated Test Infographic" into media title search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from the media list
        And browser waits
        And user clicks on "Select Infographic" button to select media
        And browser waits
        And user select "Infographic Display: Article: Medium" from the "Display as" dropdown
        And browser waits
        And user selects "center" radio button under "Align"
        And user clicks on "Embed" button to select infographic
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And user enters "Article Heading4" as 4 body section heading
        And browser waits
        And browser waits
        And user fills out 4 "Body" text area with "Infographic Display: Article: Medium,Right:"
        And user clicks the "Insert Infographic" button 4 in the WYSIWYG editor
        And user enters "Automated Test Infographic" into media title search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from the media list
        And browser waits
        And user clicks on "Select Infographic" button to select media
        And browser waits
        And user select "Infographic Display: Article: Medium" from the "Display as" dropdown
        And browser waits
        And user selects "right" radio button under "Align"
        And user clicks on "Embed" button to select infographic
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Home and Landing" content type
        Then page title is "Home and Landing"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                                        | field_name                     |
            | Pretty URL               | home-and-landing-page-to-test-infographic                                    | field_pretty_url               |
            | Page Title               | Automated Test Home and Landing page to test Infographic                     | title                          |
            | Browser Title            | Automated Test Home and Landing page to test Infographic - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Home and Landing page to test Infographic - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Home and Landing page to test Infographic - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Home and Landing page to test Infographic - Feature Card Desc | field_feature_card_description |
        And user selects "Add Multimedia Row" from "Contents" dropdown in home and landing page
        And browser waits
        And user clicks on "Multimedia Card" link in the "Multimedia Row" text area in home and landing page
        And browser waits
        And user clicks on "Select media" button item
        And browser waits
        And user enters "Automated Test Infographic" into media search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from media list
        And browser waits
        And user clicks on "Select media" button to select media item
        And browser waits
        And user selects "Add List" from "Contents" dropdown in home and landing page
        And browser waits
        And user fills out the following fields
            | fieldLabel | value      | field_name                                                     |
            | Title      | List Title | field_landing_contents[1][subform][field_list_title][0][value] |
        And browser waits
        And user selects "Title, Description, and Image" from List Item Style dropdown under list
        And browser waits
        And user clicks on "Link" link in the List Items text area under List
        And browser waits
        And user clicks on "Select content" button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add Media Link" from "List Items" dropdown "External Link" section
        Then "Media Link" section appears
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Automated Test Infographic" into media search box and clicks "Apply"
        And user selects "Automated Test Infographic" item from media list
        And browser waits
        And user clicks on "Select media" button to select media item
        And browser waits
        And user removes the "Internal Link" item from the list
        And user confirms removal
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify Infographic at the front end in the English Article
        Given user is navigating to the front end site with path site section plus "article-to-test-infographic"
        And screen breakpoint is set to "desktop"
        And page title is "Automated Test Article to test Infographic"
        And the intro text reads "Article Intro Text"
        And the caption appears as "Automated Test Infographic Caption"
        And the infographic link "View and Print Infographic" appears with href "infographic-desktop"
        And the infographic displayed has the following attributes
            | index | position        | imageSource         | imageAlt | descText                                     |
            | 0     | embedded-entity | infographic-desktop | Alt Text | Infographic Display: Article: Large,None:    |
            | 1     | align-left      | infographic-desktop | Alt Text | Infographic Display: Article: Medium,Left:   |
            | 2     | align-center    | infographic-desktop | Alt Text | Infographic Display: Article: Medium,Center: |
            | 3     | align-right     | infographic-desktop | Alt Text | Infographic Display: Article: Medium,Right:  |

    Scenario: Verify infographic at the front end in the English Home and Landing page
        Given user is navigating to the front end site with path site section plus "home-and-landing-page-to-test-infographic"
        And page title is "Automated Test Home and Landing page to test Infographic"
        And multimedia card row displays an image which matches the earlier selected promo image of Infographic
        And multimedia card row displays the following cards
            | title                      | link                                 |
            | Automated Test Infographic | {TEST_SITE_SECTION}/test-infographic |
        And list card row title is "List Title"
        And list row displays the following links
            | title                      | link                                 | description                                 |
            | Automated Test Infographic | {TEST_SITE_SECTION}/test-infographic | Automated Test Infographic List Description |
        And the thumbnail image has an image which matches the earlier selected promo image of Infographic


    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "article-to-test-infographic" from the list of content
        And user selects a checkbox next to title with url "home-and-landing-page-to-test-infographic" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete these content items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 2 content items" appears on a screen
        And the content item with url "article-to-test-infographic" does not exist in the list of content
        And the content item with url "home-and-landing-page-to-test-infographic" does not exist in the list of content
        And user clicks on "Media" sub tab
        And user selects a checkbox next to title with url "test-infographic" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this media item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 item" appears on a screen
        And the content item with url "test-infographic" does not exist in the list of content