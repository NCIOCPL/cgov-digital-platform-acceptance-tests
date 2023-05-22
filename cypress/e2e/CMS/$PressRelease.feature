Feature: As a cms user I want to be able to create Press Release content type to promote Press Release

    Scenario: User is creating new Mini Landing page content type
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
            | fieldLabel               | value                                               | field_name                     |
            | Pretty URL               | mini-landing-page-test-press-release                | field_pretty_url               |
            | Page Title               | Test Resource Mini Landing Page                     | title                          |
            | Browser Title            | Test Resource Mini Landing Page - Browser Title     | field_browser_title            |
            | Meta Description         | Test Resource Mini Landing Page Meta Description    | field_page_description         |
            | Feature Card Description | Test Resource Mini Landing Page - Feature Card Desc | field_feature_card_description |
            | Card Title               | Test Resource Mini Landing Page - Card Title        | field_card_title               |
        And user enters "Mini Landing Page List Description" into "List Description" text field
        And user selects 1 Promotional Image for the mini landing
        And user remembers the source of selected promo image for the mini landing
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: User is adding new press release content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Press Release" content type
        Then page title is "Create Press Release"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                            | field_name                     |
            | Pretty URL               | press-release                                    | field_pretty_url               |
            | Page Title               | Automated Test Press Release                     | title                          |
            | Subtitle                 | Automated Test Press Release - Subtitle          | field_subtitle                 |
            | Press Release Type       | Automated Test - NCI Press Release               | field_press_release_type       |
            | Browser Title            | Automated Test Press Release - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Press Release - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Press Release Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Press Release - Feature Card Desc | field_feature_card_description |
        And user enters "Press Release List Description" into "List Description" text field
        And user fills out "Body" text area with "This is a description of press release content type."
        And user selects 1 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Display" from "Public Use Text" dropdown
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "press-release"
        Then page title is "Automated Test Press Release"
        And "Updated:" date is displaying today's date
        And Contact "NCI Press Office" link has a href "mailto:ncipressofficers@mail.nih.gov"
        And description reads "This is a description of press release content type."
        And the lead image for press release is matching the earlier selected image
        And public use text has a link "Reuse of NCI Information" with href "/policies/copyright-reuse"
        And the page contains meta tags with the following names
            | name        | content                                       |
            | description | Automated Test Press Release Meta Description |
        Given user is navigating to the front end site plus "news-events"
        Then "Automated Test Press Release" is a link with href that contains site section and "/press-release"
        And today date is displayed in format "month dd,yyyy"
        And the list item description reads "Press Release List Description"
        And the promotional image for press release is matching the earlier selected image


    Scenario: Edit and republish press release content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "press-release" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Subtitle" field
        And user clears out "Press Release Type" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "Card Title" field
        And user fills out the following fields
            | fieldLabel               | value                                                   | field_name                     |
            | Pretty URL               | press-release-edited                                    | field_pretty_url               |
            | Page Title               | Automated Test Press Release Edited                     | title                          |
            | Subtitle                 | Automated Test Press Release - Subtitle Edited          | field_subtitle                 |
            | Press Release Type       | Automated Test - NCI Press Release Edited               | field_press_release_type       |
            | Card Title               | Automated Test Press Release - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Press Release Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Press Release - Feature Card Desc Edited | field_feature_card_description |
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And browser waits
        And user removes the Promotional Image
        And browser waits
        And user selects 4 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions


    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "press-release-edited"
        Then page title is "Automated Test Press Release Edited"
        And the lead image for press release is matching the earlier selected image
        And public use text is not displayed
        And the page contains meta tags with the following names
            | name        | content                                              |
            | description | Automated Test Press Release Meta Description Edited |
        Given user is navigating to the front end site plus "news-events"
        Then "Automated Test Press Release Edited" is a link with href that contains site section and "/press-release-edited"
        And today date is displayed in format "month dd,yyyy"
        And the promotional image for press release is matching the earlier selected image

    Scenario: Add a featured item to mini landing page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-press-release" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user selects the "Add Two Item Feature Card Row" content item
        And user clicks on the "Featured Item" link in the "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item
        And browser waits
        And user selects "Automated Test Press Release Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Press Release Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-press-release"
        Then page title is "Test Resource Mini Landing Page"
        And the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Press Release - Card Title Edited" with href "/about-cancer/understanding/press-release-edited"
        And feature card description reads "Automated Test Press Release - Feature Card Desc Edited"

    Scenario: Remove featured item
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-press-release" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user removes "Two Item Feature Card Row" section
        And user confirms removal
        And browser waits
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Add a translation
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Press Release Edited"
        Then page title is "Translations of Automated Test Press Release Edited"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Press Release Edited"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Subtítulo                | field_subtitle                 |
            | Browser Title            | field_browser_title            |
            | Press Release Type       | field_press_release_type       |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And body was translated as "Cuerpo"
        And Remove button for image was translated as "Eliminar"
        And Related Resources section was translated as "Recursos relacionados"
        And dropdown to add link under related resources was translated to start with "Añadir"
        And button to add citation was translated as "Añadir Citation"
        And current state was translated as "Estado actual" "Borrador"
        And Change to dropdown has the following options
            | option    |
            | Borrador  |
            | Review    |
            | Publicado |
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify translated content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "press-release-edited"
        Then page title is "Automated Test Press Release Edited"
        And dates were translated as follows
            | date          |
            | Publicación   |
            | Actualización |
            | Revisión      |


    Scenario: Edit and republish Spanish press release content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "press-release-edited"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                        | field_name             |
            | Título de página | Automated Test Press Release Edited Spanish                  | title                  |
            | Meta Description | Automated Test Press Release Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify Spanish edited content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "press-release-edited"
        And browser waits
        Then page title is "Automated Test Press Release Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                      |
            | description | Automated Test Press Release Meta Description Edited Spanish |

    # Scenario: Clean up
    #     Given user is navigating to "/user/login"
    #     When user enters credentials
    #     And user clicks "Log in" button
    #     Then user is logged in and the user name "admin" is displayed in the toolbar
    #     And the tool bar appears at the top
    #     When user clicks on "Content" tab
    #     And user selects a checkbox next to title with url "press-release-edited" from the list of content
    #     And user clicks on "Apply to selected items" content action button
    #     Then page title is "Are you sure you want to delete this content item?"
    #     When user clicks on "Delete" button
    #     Then the confirmation text "Deleted 2 content items." appears on a screen
    #     And the content item with url "press-release-edited" does not exist in the list of content
    #     And user selects a checkbox next to title with url "mini-landing-page-test-press-release" from the list of content
    #     And user clicks on "Apply to selected items" content action button
    #     Then page title is "Are you sure you want to delete this content item?"
    #     When user clicks on "Delete" button
    #     Then the confirmation text "Deleted 1 content item" appears on a screen
    #     And the content item with url "mini-landing-page-test-press-release" does not exist in the list of content