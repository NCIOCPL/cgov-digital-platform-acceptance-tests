Feature: As a cms user I want to be able to create Article content type to promote Article

    Scenario: User is adding new article content type
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
            | fieldLabel               | value                                      | field_name                     |
            | Pretty URL               | test-article                               | field_pretty_url               |
            | Page Title               | Automated Test Article                     | title                          |
            | Browser Title            | Automated Test Article - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article - Card Title        | field_card_title               |
            | Meta Description         | Automated Article Meta Description         | field_page_description         |
            | Feature Card Description | Automated Test Article - Feature Card Desc | field_feature_card_description |
        And user enters "Article List Description" into "List Description" text field
        And user enters "Article Intro Text" as intro text
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "This is a description of article content type under heading1."
        And user selects 1 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And browser waits
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        When user clicks on Add Citation button
        And browser waits
        When user clicks on Add Citation button
        And browser waits
        When user clicks on Add Citation button
        And browser waits
        When user clicks on Add Citation button
        And browser waits
        And user types "PubMed Citation" in the 1 citation body field
        And user fills out the following fields
            | fieldLabel | value    | field_name                                  |
            | PubMed ID  | 24037918 | field_citation[0][subform][field_pubmed_id] |
        And user types "Citation with an external link " in the 2 citation body field
        And user clicks on icon to add a link to 2 citation
        And user types "https://www.yahoo.com/" in the citation url field and saves it
        And user types "Plain Citation" in the 3 citation body field
        And user selects "Display" from "Public Use Text" dropdown
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar


    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "test-article"
        Then page title is "Automated Test Article"
        And "Reviewed:" date is displaying today's date
        And intro text reads "Article Intro Text"
        And 1 section heading reads "Article Heading1"
        And 1 description reads "This is a description of article content type under heading1."
        And the lead image is matching the earlier selected image
        And public use text has a link "Reuse of NCI Information" with href "/policies/copyright-reuse"
        And "On This Page" section is not displayed
        And the page contains meta tags with the following names
            | name        | content                            |
            | description | Automated Article Meta Description |
        And "Selected References" titled citation paragraph is displayed
        And citation number 1 titled "PubMed Citation" is a "PubMed Abstract" link with an url "https://www.ncbi.nlm.nih.gov/pubmed/24037918"
        And citation number 2 titled "Citation with an external link" links to "https://www.yahoo.com/" and exit disclaimer is displayed
        And citation number 3 titled "Plain Citation" has no link

    Scenario: Verify Related resources functionality
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-article" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Internal Link" related resource item
        Then "Internal Link" section appears
        And user clicks on "Link" button to link to a resource
        And user clicks on "Select content" to choose a resource to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add External Link" related resource item
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                |
            | Link       | https://www.google.com/ | field_related_resources[1][subform][field_external_link]  |
            | Title      | Google Link             | field_related_resources[1][subform][field_override_title] |
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        Then "Media Link" section appears
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File for Related Resources" into media title search box and clicks "Apply"
        And user selects "Test File for Related Resources" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user fills out the following fields
            | fieldLabel     | value                     | field_name                                                          |
            | Override Title | Media Link Override Title | field_related_resources[2][subform][field_override_title][0][value] |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Edit and republish article content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-article" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "Card Title" field
        And user fills out the following fields
            | fieldLabel               | value                                             | field_name                     |
            | Pretty URL               | test-article-edited                               | field_pretty_url               |
            | Page Title               | Automated Test Article Edited                     | title                          |
            | Card Title               | Automated Test Article - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Article Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Article - Feature Card Desc Edited | field_feature_card_description |
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading2" as 2 body section heading
        And browser waits
        And user fills out 2 "Body" text area with "This is a description of article content type under heading2."
        And browser waits
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And browser waits
        And user removes the Promo Image
        And browser waits
        And user selects 4 Promotional Image from the list of images
        And user remembers the source of selected promo image for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions



    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "test-article-edited"
        And browser waits
        Then page title is "Automated Test Article Edited"
        And the lead image is matching the earlier selected image
        And "On This Page" section is displayed with the following anchor links
            | title            | href              |
            | Article Heading1 | #article-heading1 |
            | Article Heading2 | #article-heading2 |
        And 1 section heading reads "Article Heading1"
        And 1 description reads "This is a description of article content type under heading1."
        And 2 section heading reads "Article Heading2"
        And 2 description reads "This is a description of article content type under heading2."
        And public use text is not displayed
        And the page contains meta tags with the following names
            | name        | content                                        |
            | description | Automated Test Article Meta Description Edited |
        Then Related Resources section contains the following links
            | title                             | link                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |

    Scenario: Add a featured item to mini landing page
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-promo" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user selects the "Add Two Item Feature Card Row" content item
        And user clicks on the "Featured Item" link in the "Internal Feature Card" text area
        And browser waits
        And user clicks on "Select content" button item
        And browser waits
        And user selects "Automated Test Article Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Article Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions


    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Article - Card Title Edited" with href "/about-cancer/understanding/test-article-edited"
        And feature card description reads "Automated Test Article - Feature Card Desc Edited"

    Scenario: Remove featured item
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on the title with url "mini-landing-page-test-promo" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user removes "Two Item Feature Card Row" section
        And user confirms removal
        And browser waits
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Add a translation
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Article Edited"
        Then the page title is "Translations of Automated Test Article Edited"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Article Edited"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And "List Description" label is displayed
        And body was translated as "Cuerpo"
        And heading was translated as "Encabezado"
        And body content was translated as "Contenido"
        And Add Body Section was translated as "Añadir Body Section"
        And Remove button for image was translated as "Eliminar"
        And Related Resources section was translated as "Recursos relacionados"
        And Link section under related resources was translated as "Enlace"
        And dropdown to add link under related resources was translated to start with "Añadir"
        And button to add citation was translated as "Añadir Citation"
        And "Public Use Text" dropdown displays "Presentación"
        And current state was translated as "Estado actual" "Borrador"
        And Change to dropdown has the following options
            | option   |
            | Borrador |
            | Review   |
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

    Scenario: Verify translated content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "test-article-edited"
        Then page title is "Automated Test Article Edited"
        And the lead image is matching the earlier selected image
        And "En esta página" section is displayed with the following anchor links
            | title            | href              |
            | Article Heading1 | #article-heading1 |
            | Article Heading2 | #article-heading2 |
        And "Bibliografía selecta" titled citation paragraph is displayed
        Then Recursos relacionados section contains the following links
            | title                             | link                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |
        And date published was translated as "Revisión"

    Scenario: Edit and republish Spansih article content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "test-article-edited"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                  | field_name             |
            | Título de página | Automated Test Article Edited Spanish                  | title                  |
            | Meta Description | Automated Test Article Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publicar" from workflow actions


    Scenario: Verify Spanish edited content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "test-article-edited"
        And browser waits
        Then page title is "Automated Test Article Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                |
            | description | Automated Test Article Meta Description Edited Spanish |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "test-article-edited"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archivado"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Borrar la traduccion Español" action
        When user clicks on "Contenido" tab
        And user clicks on title with url "test-article-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "test-article-edited" does not exist in the list of content
