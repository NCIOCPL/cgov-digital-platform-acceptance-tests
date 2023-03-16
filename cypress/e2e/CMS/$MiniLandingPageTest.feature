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
        And browser waits
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

    #-------Mini landing page test front end verification --------##
    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "mini-landing-page"
        And page title is "Automated Test Mini Landing Page"
        And Content Heading reads "Content Heading"
        And HTML Content reads "This is HTML content for Content Block."
        And feature card row displays the following cards
            | title                             | url                          | description                       |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article  | N/A                               |
            | External Feature Card             | https://www.externalcard.com | External Feature Card Description |
        And List Item Title is displayed as "List Item Title"
        And managed list has the following links
            | title                                    | url                           | description                                          |
            | Override Test File for Related Resources | {TEST_SITE_SECTION}/article   | Article to test Related Resources - Meta Description |
            | Google Link                              | https://www.google.com        | N/A                                                  |
            | Override Test File for Related Resources | {TEST_SITE_SECTION}/test-file | N/A                                                  |
        And borderless card with "accent-warm" accent displays the following
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
        And the button with text "BUTTON TEXT FOR BORDERLESS FULL-WIDTH CARD" appears with href "{TEST_SITE_SECTION}/article"
        And the Raw HTML Content reads the following "This is to test Raw HTML Content"
        And the Dynamic List Title reads as "Dynamic List Title"
        And 5 links are displayed under the Dynamic List Title
        And view title displays text "Press Releases"
        And the page contains meta tags with the following names
            | name        | content                                           |
            | description | Automated Test Mini Landing Page Meta Description |

    Scenario: Edit and republish Mini Landing Page content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Card Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user fills out the following fields
            | fieldLabel               | value                                                       | field_name                     |
            | Pretty URL               | mini-landing-page-edited                                    | field_pretty_url               |
            | Page Title               | Automated Test Mini Landing Page Edited                     | title                          |
            | Card Title               | Automated Test Mini Landing Page - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Mini Landing Page Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Mini Landing Page - Feature Card Desc Edited | field_feature_card_description |
        And user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "mini-landing-page-edited"
        Then page title is "Automated Test Mini Landing Page Edited"
        And the page contains meta tags with the following names
            | name        | content                                                  |
            | description | Automated Test Mini Landing Page Meta Description Edited |

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
        And user selects "Automated Test Mini Landing Page Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Mini Landing Page Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with the path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Mini Landing Page - Card Title Edited" with href "/about-cancer/understanding/mini-landing-page-edited"
        And feature card description reads "Automated Test Mini Landing Page - Feature Card Desc Edited"

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

    # Translation of Mini Landing
    Scenario: Add a translation
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Mini Landing Page Edited"
        Then the page title is "Translations of Automated Test Mini Landing Page Edited"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Mini Landing Page Edited"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And "List Description" label is displayed
        And banner image has requirements translated as follows
            | text                                |
            | Máximo 1 fichero.                   |
            | límite de 256 MB.                   |
            | Tipos permitidos: png gif jpg jpeg. |
        And Remove button for image was translated as "Eliminar"
        And the following content sections are displayed
            | section                    |
            | Content Block              |
            | Two Item Feature Card Row  |
            | Listado                    |
            | Borderless Full-Width Card |
            | Raw Html Content           |
            | Dynamic List               |
        And Dynamic List has options translated as "Opciones"
        And button to add content was translated to start with "Añadir"
        And "Search Engine Restrictions" dropdown displays "Include in search"
        And current state was translated as "Estado actual" "Borrador"
        And Change to dropdown has the following options
            | option    |
            | Borrador  |
            | Review    |
            | Publicado |
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        Then user saves the content page
        And user clicks on the tool bar status green button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify translated content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "mini-landing-page-edited"
        And page title is "Automated Test Mini Landing Page Edited"
        And Content Heading reads "Content Heading"
        And HTML Content reads "This is HTML content for Content Block."
        And feature card row displays the following cards
            | title                             | url                          | description                       |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article  | N/A                               |
            | External Feature Card             | https://www.externalcard.com | External Feature Card Description |
        And List Item Title is displayed as "List Item Title"
        And managed list has the following links
            | title                                    | url                           | description                                          |
            | Override Test File for Related Resources | {TEST_SITE_SECTION}/article   | Article to test Related Resources - Meta Description |
            | Google Link                              | https://www.google.com        | N/A                                                  |
            | Override Test File for Related Resources | {TEST_SITE_SECTION}/test-file | N/A                                                  |
        And borderless card with "accent-warm" accent displays the following
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
        And the button with text "BUTTON TEXT FOR BORDERLESS FULL-WIDTH CARD" appears with href "{TEST_SITE_SECTION}/article"
        And the Raw HTML Content reads the following "This is to test Raw HTML Content"
        And the Dynamic List Title reads as "Dynamic List Title"
        And 5 links are displayed under the Dynamic List Title and all starts with "/espanol"
        And view title displays text "Press Releases"
        And the page contains meta tags with the following names
            | name        | content                                                  |
            | description | Automated Test Mini Landing Page Meta Description Edited |

    Scenario: Edit and republish Spanish Mini landing page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "mini-landing-page-edited"
        And user clicks on the tool bar status green button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                       | field_name             |
            | Título de página | Automated Test Mini Landing Edited Spanish                  | title                  |
            | Meta Description | Automated Test Mini Landing Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify Spanish edited content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "mini-landing-page-edited"
        And browser waits
        Then page title is "Automated Test Mini Landing Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                     |
            | description | Automated Test Mini Landing Meta Description Edited Spanish |

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "mini-landing-page-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 2 content items." appears on a screen
        And the content item with url "mini-landing-page-edited" does not exist in the list of content
