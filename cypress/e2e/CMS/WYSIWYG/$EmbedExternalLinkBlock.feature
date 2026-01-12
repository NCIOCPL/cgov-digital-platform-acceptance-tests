Feature: As a cms user I want to be able to embed External Link Block in Article content type

    Scenario: User is creating new External Link Block for verifying embedding of External Link Block in the WYSIWYG
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "adveditor"
        And user clicks "Log in" button
        Then user is logged in and the user name "adveditor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And user clicks on "Add content block" action button
        And user clicks on "External Link Block" content type
        Then page title is "Add External Link Block content block"
        And "Language" dropdown displays "English"
        And user fills out the following fields
            | fieldLabel        | value                                | field_name                                |
            | Block description | Automated External Link Block Test   | info[0][value]                            |
            | Featured Item Url | https://combatcovid.hhs.gov/         | field_featured_url[0][uri]                |
            | Card Title        | External Link Block Card Title       | field_override_card_title[0][value]       |
            | Card Description  | External Link Block Card Description | field_override_card_description[0][value] |
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        Then user saves the content page


    Scenario: Verify the newly created External Link Block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "adveditor"
        And user clicks "Log in" button
        Then user is logged in and the user name "adveditor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And the content item with title "Automated External Link Block Test" exists in the list of content

    Scenario: Create an English Article content type and embed the External Link Block created above
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                                  | field_name                     |
            | Pretty URL               | article-to-test-external-link-block                                    | field_pretty_url               |
            | Page Title               | Automated Test Article to test External Link Block                     | title[0][value]                |
            | Browser Title            | Automated Test Article to test External Link Block - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article to test External Link Block - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Article to test External Link Block - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Article to test External Link Block - Feature Card Desc | field_feature_card_description |
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "External Link Block Image,None:"
        And user clicks "Insert External Link Block" button 1 in the WYSIWYG editor
        And browser waits
        And user enters "Automated External Link Block Test" into content title search box and clicks "Apply"
        And user selects "Automated External Link Block Test" item from the content list
        And browser waits
        And user clicks on "Select external link block" button to select the media
        And browser waits
        And "Display as" dropdown has the following options
            | options                |
            | Feature Card: Image    |
            | Feature Card: No Image |
        And "Display as" dropdown is displayed "Feature Card: Image"
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And the radio button "None" is selected by default under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading2" as 2 body section heading
        And user fills out 2 "Body" text area with "External Link Block No Image,Left:"
        And user clicks "Insert External Link Block" button 2 in the WYSIWYG editor
        And browser waits
        And user enters "Automated External Link Block Test" into content title search box and clicks "Apply"
        And user selects "Automated External Link Block Test" item from the content list
        And browser waits
        And user clicks on "Select external link block" button to select the media
        And browser waits
        And user select "Feature Card: No Image" from the "Display as" dropdown
        And browser waits
        And user selects "left" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading3" as 3 body section heading
        And user fills out 3 "Body" text area with "External Link Block: No Image,Right:"
        And user clicks "Insert External Link Block" button 3 in the WYSIWYG editor
        And browser waits
        And user enters "Automated External Link Block Test" into content title search box and clicks "Apply"
        And user selects "Automated External Link Block Test" item from the content list
        And browser waits
        And user clicks on "Select external link block" button to select the media
        And browser waits
        And user select "Feature Card: No Image" from the "Display as" dropdown
        And browser waits
        And user selects "right" radio button under "Align"
        And browser waits
        And user clicks on "Embed" button to select the block
        And browser waits
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar

    Scenario: Verify embedded External Link Block at the front end in the English Article
        Given user is navigating to the front end site with path site section plus "article-to-test-external-link-block"
        And browser waits
        And page title is "Automated Test Article to test External Link Block"
        And 1 section heading reads "Article Heading1"
        And 1 description reads "External Link Block Image,None:"
        And 1 feature card displays the following features in external link block
            | alignment       | description                          | linkText                       | link                         |
            | embedded-entity | External Link Block Card Description | External Link Block Card Title | https://combatcovid.hhs.gov/ |
        And the promo image in 1 feature card is matching the earlier selected promo image in the External Link Block used for embeddding
        And 2 section heading reads "Article Heading2"
        And 2 description reads "External Link Block No Image,Left:"
        And 2 feature card displays the following features in external link block
            | alignment                  | description                          | linkText                       | link                         |
            | align-left embedded-entity | External Link Block Card Description | External Link Block Card Title | https://combatcovid.hhs.gov/ |
        And 2 feature card does not display any image
        And 3 section heading reads "Article Heading3"
        And 3 description reads "External Link Block No Image,Right:"
        And 3 feature card displays the following features in external link block
            | alignment                   | description                          | linkText                       | link                         |
            | align-right embedded-entity | External Link Block Card Description | External Link Block Card Title | https://combatcovid.hhs.gov/ |
        And 3 feature card does not display any image


    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And user clicks on "Delete" from  dropdown button under "Automated External Link Block Test"
        When user clicks on "Delete" button to select the block
        Then the confirmation text "The content block Automated External Link Block Test has been deleted." appears on a screen
        And the Custom block item with title "Automated External Link Block Test" does not exist in the list of Custom block library
        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-external-link-block" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "article-to-test-external-link-block" does not exist in the list of content