Feature: User creating an image

    Scenario: Create test pages to test image overrides
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And browser waits
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                    | field_name             |
            | Pretty URL       | article-to-test-image                    | field_pretty_url       |
            | Page Title       | Article to test Image                    | title[0][value]        |
            | Browser Title    | Article to test Image                    | field_browser_title    |
            | Meta Description | Article to test Image - Meta Description | field_page_description |
        And user selects "Test Image" Lead Image from the list of images
        And browser waits
        And user selects "Review" from "Save as" dropdown
        When user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Mini Landing Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                             | field_name             |
            | Pretty URL       | mini-landing-page-image                           | field_pretty_url       |
            | Page Title       | Mini Landing Page to test Image                   | title                  |
            | Browser Title    | Mini Landing Page to test Image                   | field_browser_title    |
            | Meta Description | Mini Landing Page to test Image  Meta Description | field_page_description |
        And user selects "Test Image" as Promotional Image from the list of images
        And browser waits
        And user selects "Add Two Item Feature Card Row" content item
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And user clicks on "Select content" button item
        And user selects "Article to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And "Article to test Image" had been selected
        And user selects "Add List" content item
        And user fills out the following fields
            | fieldLabel | value           | field_name                                           |
            | Title      | List Item Title | field_landing_contents[1][subform][field_list_title] |
        And user selects "Title, Description, and Image" from "List Item Style" dropdown
        And user clicks on "Link" link in the Internal Link text area within List Items
        And user clicks on "Select content" button item
        And user selects "Article to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Review" from "Save as" dropdown
        When user saves the content page
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Home and Landing" content type
        Then page title is "Home and Landing"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                             | field_name             |
            | Pretty URL       | home-and-landing-page-image                       | field_pretty_url       |
            | Page Title       | Home and Landing page for Image                   | title                  |
            | Browser Title    | Home and Landing page for Image - Browser Title   | field_browser_title    |
            | Meta Description | Home and Landing page for Image  Meta Description | field_page_description |
        And user selects "Add Multimedia Row" from Contents dropdown
        And browser waits
        And user selects "Add Internal Feature Card" from "Feature Card" dropdown "Multimedia Row" section
        And user clicks on "Featured Item" link in the "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item
        And user selects "Mini Landing Page to test Image" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Review" from "Save as" dropdown
        When user saves the content page

    Scenario: editor is publishing content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page-image" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page-image" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits
        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-image" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits

    Scenario: Verify image overrides
        Given user is navigating to the front end site with path site section plus "article-to-test-image"
        Then lead image is displayed with source "main_image"
        And caption reads "Test Caption"
        And credit reads "Test Credit"
        And "Enlarge" button is displayed
        When user is navigating to the front end site with path site section plus "mini-landing-page-image"
        Then feature card image is displaying "feature_card_image"
        And item in the list has an image "thumbnail_image"
        When user is navigating to the front end site with path site section plus "home-and-landing-page-image"
        Then the "feature_card_image" appear as override

    Scenario: Translate an image
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        Then user selects "Translate" option from Operations dropdown for media with title "Test Image"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test Image"
        And user fills out the following fields
            | fieldLabel   | value    | field_name             |
            | Nombre       | _Spanish | name[0][value]         |
            | Photo Credit | _Spanish | field_credit[0][value] |
        And user types "_Spanish" into Caption text field
        Then user saves the content page

    Scenario:Translate test pages
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Article to test Image"
        Then page title is "Translations of Article to test Image"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Article to test Image"
        And user clears out "Pretty URL" field
        And user clears out "Título de página" field
        And user fills out the following fields
            | fieldLabel       | value                         | field_name       |
            | Pretty URL       | article-to-test-image-spanish | field_pretty_url |
            | Título de página | Article to test Image Spanish | title            |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

        When user clicks on "Contenido" tab
        Then user selects "Traducir" option from Operations dropdown for content with title "Home and Landing page for Image"
        Then page title is "Translations of Home and Landing page for Image"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Home and Landing page for Image"
        And user clears out "Pretty URL" field
        And user clears out "Título de página" field
        And user fills out the following fields
            | fieldLabel       | value                                   | field_name       |
            | Pretty URL       | home-and-landing-page-for-image-spanish | field_pretty_url |
            | Título de página | Home and Landing page for Image Spanish | title            |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

    Scenario: Verify translated image overrides
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "article-to-test-image-spanish"
        Then lead image is displayed with source "main_image"
        And caption reads "Test Caption_Spanish"
        And credit reads "Test Credit_Spanish"
        And "Ampliar" button is displayed
        When user is navigating to the front end site with spanish path "/espanol" site section plus "home-and-landing-page-for-image-spanish"
        Then the "feature_card_image" appear as override


    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab

        And user clicks on title with url spanish path "/espanol" site section plus "article-to-test-image-spanish"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archivado"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Borrar la traduccion Español" action

        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "home-and-landing-page-for-image-spanish"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archivado"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Borrar la traduccion Español" action

        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-image" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action

        When user clicks on "Content" tab
        And user clicks on title with url "home-and-landing-page-image" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action

        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page-image" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
