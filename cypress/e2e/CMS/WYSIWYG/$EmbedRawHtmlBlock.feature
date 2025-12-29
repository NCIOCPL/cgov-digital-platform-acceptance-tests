Feature: As a cms user I want to be able to embed Block Contents in Article content type

    Scenario: User is creating new Raw HTML Block for verifying embedding of Raw HTML Block in the WYSIWYG
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "adveditor"
        And user clicks "Log in" button
        Then user is logged in and the user name "adveditor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And user clicks on "Add content block" action button
        And user clicks on "Raw HTML Block" content type
        Then page title is "Add Raw HTML Block content block"
        And "Language" dropdown displays "English"
        And user fills out the following fields
            | fieldLabel        | value                         | field_name     |
            | Block description | Automated Raw HTML Block Test | info[0][value] |
        And user fills out "Body" text area in Raw HTML block with "<div>This is to test Raw Html Block in the WYSIWYG</div>"
        Then user saves the content page


    Scenario: Verify the newly created Raw HTML Block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "adveditor"
        And user clicks "Log in" button
        Then user is logged in and the user name "adveditor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And the content item with title "Automated Raw HTML Block Test" exists in the list of content


    Scenario: Create an English Article content type and embed the Raw HTML Block created above
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
            | fieldLabel               | value                                                             | field_name                     |
            | Pretty URL               | article-to-test-raw-html-block                                    | field_pretty_url               |
            | Page Title               | Automated Test Article to test Raw HTML Block                     | title[0][value]                |
            | Browser Title            | Automated Test Article to test Raw HTML Block - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article to test Raw HTML Block - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Article to test Raw HTML Block - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Article to test Raw HTML Block - Feature Card Desc | field_feature_card_description |
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "Raw HTML Block: Image,None:"
        And user clicks "Insert Content Block Content" button 1 in the WYSIWYG editor
        And browser waits
        And user enters "Automated Raw HTML Block Test" into content title search box and clicks "Apply"
        And user selects "Automated Raw HTML Block Test" item from the content list
        And browser waits
        And user clicks on "Select block" button to select the media
        And browser waits
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
        And user fills out 2 "Body" text area with "Raw HTML Block: Image,Left:"
        And user clicks "Insert Content Block Content" button 2 in the WYSIWYG editor
        And browser waits
        And user enters "Automated Raw HTML Block Test" into content title search box and clicks "Apply"
        And user selects "Automated Raw HTML Block Test" item from the content list
        And browser waits
        And user clicks on "Select block" button to select the media
        And browser waits
        And user selects "left" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading3" as 3 body section heading
        And user fills out 3 "Body" text area with "External Link Block: No Image,Right:"
        And user clicks "Insert Content Block Content" button 3 in the WYSIWYG editor
        And browser waits
        And user enters "Automated Raw HTML Block Test" into content title search box and clicks "Apply"
        And user selects "Automated Raw HTML Block Test" item from the content list
        And browser waits
        And user clicks on "Select block" button to select the media
        And browser waits
        And user selects "right" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading4" as 4 body section heading
        And user fills out 4 "Body" text area with "Raw HTML Block: Full, Center:"
        And user clicks "Insert Content Block Content" button 4 in the WYSIWYG editor
        And browser waits
        And user enters "Automated Raw HTML Block Test" into content title search box and clicks "Apply"
        And user selects "Automated Raw HTML Block Test" item from the content list
        And browser waits
        And user clicks on "Select block" button to select the media
        And browser waits
        And user selects "center" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar


    Scenario:  Verify embedded Raw HTML Block at the front end in the English Article
        Given user is navigating to the front end site with path site section plus "article-to-test-raw-html-block"
        And browser waits
        And page title is "Automated Test Article to test Raw HTML Block"
        And 1 section heading reads "Article Heading1"
        And 1 description reads "Raw HTML Block: Image,None:"
        And 1 block displays the following features
            | alignment       | rawHTMLText                                   |
            | embedded-entity | This is to test Raw Html Block in the WYSIWYG |
        And 2 section heading reads "Article Heading2"
        And 2 description reads "Raw HTML Block: Image,Left:"
        And 2 block displays the following features
            | alignment                  | rawHTMLText                                   |
            | align-left embedded-entity | This is to test Raw Html Block in the WYSIWYG |
        And 3 section heading reads "Article Heading3"
        And 3 description reads "Raw HTML Block: No Image,Right:"
        And 3 block displays the following features
            | alignment                   | rawHTMLText                                   |
            | align-right embedded-entity | This is to test Raw Html Block in the WYSIWYG |
        And 4 section heading reads "Article Heading4"
        And 4 description reads "Raw HTML Block: Full,Center:"
        And 4 block displays the following features
            | alignment                    | rawHTMLText                                   |
            | align-center embedded-entity | This is to test Raw Html Block in the WYSIWYG |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "adveditor"
        And user clicks "Log in" button
        Then user is logged in and the user name "adveditor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Blocks" sub tab
        And user clicks on "Delete" from  dropdown button under "Automated Raw HTML Block Test"
        When user clicks on "Delete" button to select the block
        Then the confirmation text "The content block Automated Raw HTML Block Test has been deleted." appears on a screen
        And the Custom block item with title "Automated Raw HTML Block Test" does not exist in the list of Custom block library
        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-raw-html-block" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "article-to-test-raw-html-block" does not exist in the list of content