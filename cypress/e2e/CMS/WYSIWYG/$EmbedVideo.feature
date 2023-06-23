Feature: As a user I want to be able to embed video in my content

    Scenario: Create a new video for embedding
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "Video" content type
        Then page title is "Add Video"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel        | value                                       | field_name                         |
            | Youtube Video URL | https://www.youtube.com/watch?v=zXE7rexUCeI | field_media_oembed_video[0][value] |
            | Pretty URL        | test-video                                  | field_pretty_url                   |
            | Name              | Test Video                                  | name[0][value]                     |
            | Browser Title     | Test Video - Browser Title                  | field_browser_title                |
            | Meta Description  | Test Video - Meta Description               | field_page_description             |
        And user types "Test Caption" into Caption text field
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Create article to test video embed
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
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                      | field_name             |
            | Pretty URL       | article-for-embed-video                    | field_pretty_url       |
            | Page Title       | Article for embed Video                    | title[0][value]        |
            | Browser Title    | Article for embed Video                    | field_browser_title    |
            | Meta Description | Article for embed Video - Meta Description | field_page_description |
        And user enters "Video Display Large with no title - none aligned" as 1 body section heading
        And user clicks the "Insert Video" button 1 in the WYSIWYG editor
        And user enters "Test Video" into content title search box and clicks "Apply"
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And "Display as" dropdown has the following options
            | options                         |
            | Video Display: Large: No Title  |
            | Video Display: Large: Title     |
            | Video Display: Medium: No Title |
            | Video Display: Medium: Title    |
            | Video Display: Small: No Title  |
            | Video Display: Small: Title     |
        And "Display as" dropdown is displayed "Video Display: Large: No Title "
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And the radio button "Left" is selected by default under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Video Display Large with title - left aligned" as 2 body section heading
        And user clicks the "Insert Video" button in the WYSIWYG editor
        And user enters "Test Video" into content title search box and clicks "Apply"
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user select "Video Display: Large: Title" from the "Display as" dropdown
        And browser waits
        And user selects "left" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Video Display Medium with no title - center aligned" as 3 body section heading
        And user clicks the "Insert Video" button 1 in the WYSIWYG editor
        And user enters "Test Video" into content title search box and clicks "Apply"
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user select "Video Display: Medium: No Title" from the "Display as" dropdown
        And browser waits
        And user selects "center" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Video Display Medium with title - right aligned" as 4 body section heading
        And user clicks the "Insert Video" button 1 in the WYSIWYG editor
        And user enters "Test Video" into content title search box and clicks "Apply"
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user select "Video Display: Medium: Title" from the "Display as" dropdown
        And browser waits
        And user selects "right" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits

        And user clicks on "Add Body Section" to add a body section
        And user enters "Video Display Small with title - none aligned" as 5 body section heading
        And user clicks the "Insert Video" button 1 in the WYSIWYG editor
        And user enters "Test Video" into content title search box and clicks "Apply"
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user select "Video Display: Small: Title" from the "Display as" dropdown
        And browser waits
        And user selects "none" radio button under "Align"
        And user clicks on "Embed" button to select the block
        And browser waits
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify video
        Given user is navigating to the front end site with path site section plus "article-for-embed-video"
        And page title is "Article for embed Video"
        And 1 section heading reads "Video Display Large with no title - none aligned"
        And 1 video has title "Test Video"
        And 2 section heading reads "Video Display Large with title - left aligned"
        And 2 video has title "Test Video"
        And 3 section heading reads "Video Display Medium with no title - center aligned"
        And 3 video has title "Test Video"
        And 4 section heading reads "Video Display Medium with title - right aligned"
        And 4 video has title "Test Video"
        And 5 section heading reads "Video Display Small with title - none aligned"
        And 5 video has title "Test Video"

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "article-for-embed-video" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item" appears on a screen
        And the content item with url "article-for-embed-video" does not exist in the list of content
        And user clicks on "Media" sub tab
        And user selects a checkbox next to title with url "test-video" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this media item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 item." appears on a screen
        And the content item with url "test-video" does not exist in the list of content