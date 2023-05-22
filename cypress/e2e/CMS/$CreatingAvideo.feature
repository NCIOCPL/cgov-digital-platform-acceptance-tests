Feature: User creating a video

    Scenario: Create a new video
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

    Scenario: Translate newly created video
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        Then user selects "Translate" option from Operations dropdown for media with title "Test Video"
        Then the page title is "Translations of Test Video"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test Video"
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value              | field_name       |
            | Pretty URL | test-video-spanish | field_pretty_url |
            | Nombre     | _Spanish           | name[0][value]   |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        And user clicks on "Moderated media" sub tab
        Then user selects "Editar" option from Operations dropdown for media with title "Test Video_Spanish"
        Then page title is "Test Video_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

    Scenario: Create test pages to test video in English
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
            | fieldLabel       | value                                              | field_name             |
            | Pretty URL       | home-and-landing-page-video                        | field_pretty_url       |
            | Page Title       | Home and Landing page for Video                    | title                  |
            | Browser Title    | Home and Landing page for Video - Browser Title    | field_browser_title    |
            | Meta Description | Home and Landing page for Video - Meta Description | field_page_description |
        And user selects "Add Multimedia Row" option from "Contents" dropdown
        And user clicks on "Multimedia Card" link in the "Multimedia Row" text area
        And user clicks on "Select media" button item
        And user selects "Test Video" from the list of media
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify English video
        When user is navigating to the front end site with path site section plus "home-and-landing-page-video"
        Then the "Test Video" titles video is displayed

    Scenario: Translate test page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Home and Landing page for Video"
        Then page title is "Translations of Home and Landing page for Video"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Home and Landing page for Video"
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel       | value                               | field_name       |
            | Pretty URL       | home-and-landing-page-video-spanish | field_pretty_url |
            | Título de página | Spanish                             | title            |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify spanish video
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "home-and-landing-page-video-spanish"
        Then the "Test Video_Spanish" titles video is displayed

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        # And user selects a checkbox next to title with url "home-and-landing-page-video" from the list of content
        # And user selects a checkbox next to the title with spanish path "/espanol" with url "home-and-landing-page-video-spanish" from the list of content
        # And user clicks on "Apply to selected items" content action button
        # Then page title is "Are you sure you want to delete this content item?"
        # When user clicks on "Delete" button
        # Then the confirmation text "Deleted 2 content items." appears on a screen
        # And the content item with url "home-and-landing-page-video" does not exist in the list of content
        # And the content item with url "home-and-landing-page-video-spanish" does not exist in the list of content
        And user clicks on "Media" sub tab
        And user selects a checkbox next to title with url "test-video" from the list of content
        And user selects a checkbox next to the title with spanish path "/espanol" with url "test-video-spanish" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this media item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 2 items." appears on a screen
        And the content item with url "test-video" does not exist in the list of content
        And the content item with url "test-video-spanish" does not exist in the list of content