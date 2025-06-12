Feature: As a cms user I want to be able to create Blog Post content type to promote Blog Post.

    Scenario: User is adding new blog post content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Cancer Currents" from Blog Series dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                        | field_name                     |
            | Pretty URL               | blog-post                                    | field_pretty_url               |
            | Page Title               | Automated Test Blog Post                     | title                          |
            | Browser Title            | Automated Test Blog Post - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Blog Post - Card Title        | field_card_title               |
            | Meta Description         | Automated Blog Post Meta Description         | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc | field_feature_card_description |
            | Author                   | Automated Test Blog Post Author              | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects 1 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Display" from "Public Use Text" dropdown
        And user selects "Include in search" from "Search Engine Restrictions"
        And user selects "Review" from "Save as" dropdown
        When user saves the content page

    Scenario: editor is publishing content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on blog with url "blog-post" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits

    Scenario: Verify newly created content
        Given user is navigating to the blog "blog-post" under "news-events/cancer-currents-blog"
        Then page title is "Automated Test Blog Post"
        And blog's posted date is today's date
        And the "Featured Posts" managed list appears
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And "Archive" accordion is collapsed
        And blog posts list doesnot appear in the archive
        And "< Older Post" link appears
        When user clicks on "< Older Post" link
        And "Newer Post >" link appears
        When user clicks on "Newer Post >" link
        And the author name "Automated Test Blog Post Author" is displayed
        And intro text reads "Blog Post Intro Text"
        And description reads "This is a description of Blog Post content type."
        And the lead image is matching the earlier selected image
        And public use text has a link "Reuse of NCI Information" with href "/policies/copyright-reuse"
        And the page contains meta tags with the following names
            | name        | content                              |
            | description | Automated Blog Post Meta Description |

    Scenario: Verify Related resources functionality
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clicks on dropdown button toggle 1 to view all Related Resources types
        And user selects "Add Internal Link" related resource item
        Then "Internal Link" section appears
        And user clicks on "Link" button to link to a resource
        And user clicks on "Select content" to choose a resource to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user clicks on dropdown button toggle 1 to view all Related Resources types
        And user selects "Add External Link" related resource item
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                |
            | Link       | https://www.google.com/ | field_related_resources[1][subform][field_external_link]  |
            | Title      | Google Link             | field_related_resources[1][subform][field_override_title] |
        And user clicks on dropdown button toggle 1 to view all Related Resources types
        And user selects "Add Media Link" related resource item
        Then "Media Link" section appears
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File for Related Resources" into media title search box and clicks "Apply"
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" button to select media
        And browser waits
        And "Test File for Related Resources" had been selected
        And user fills out the following fields
            | fieldLabel     | value                     | field_name                                                          |
            | Override Title | Media Link Override Title | field_related_resources[2][subform][field_override_title][0][value] |
        When user saves the content page

    Scenario: Verify Recommended Content functionality
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status button "Draft available"
        And user clicks "Edit draft" button from other actions
        And user clicks on dropdown button toggle 2 to view all Recommended Content types
        And user selects "Add Internal Feature Card" from Recommended Content dropdwon
        Then "Internal Feature Card" section appears
        And user clicks on "Featured Item" button to link to Recommended Content types
        And user clicks on "Select content" to choose a Recommended Content type to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on dropdown button toggle 2 to view all Recommended Content types
        And user selects "Add External Feature Card" from Recommended Content dropdwon
        Then "External Feature Card" section appears
        And user fills out the following Recommended Content fields
            | fieldLabel        | value                   | field_name                                                       |
            | Featured Item Url | https://www.google.com/ | field_recommended_content[1][subform][field_featured_url]        |
            | Card Title        | Google Link             | field_recommended_content[1][subform][field_override_card_title] |
        And browser waits
        When user saves the content page

    Scenario: Edit and republish blog post content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status button "Draft available"
        And user clicks "Edit draft" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user clears out "Card Title" field
        And user clears out "Feature Card Description" field
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                               | field_name                     |
            | Pretty URL               | blog-post-edited                                    | field_pretty_url               |
            | Page Title               | Automated Test Blog Post Edited                     | title                          |
            | Card Title               | Automated Test Blog Post - Card Title Edited        | field_card_title[0][value]     |
            | Meta Description         | Automated Test Blog Post Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc Edited | field_feature_card_description |
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the blog "blog-post-edited" under "news-events/cancer-currents-blog"
        Then page title is "Automated Test Blog Post Edited"
        And the lead image is matching the earlier selected image
        And public use text is not displayed
        And the page contains meta tags with the following names
            | name        | content                                          |
            | description | Automated Test Blog Post Meta Description Edited |
        Then Related Resources section contains the following links
            | title1                            | link1                         |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |
        Then Recommended Content section contains the following links
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
            | Google Link                       | https://www.google.com/     |

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
        And user selects "Automated Test Blog Post Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Blog Post Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Blog Post - Card Title Edited" with href "/news-events/cancer-currents-blog/{YEAR}/blog-post-edited"
        And feature card description reads "Automated Test Blog Post - Feature Card Desc Edited"

    Scenario: Remove featured item
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page-test-promo" from the list of content
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

    #---- Translation of Blog Post -----#
    Scenario: Add a translation
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Blog Post Edited"
        Then the page title is "Translations of Automated Test Blog Post Edited"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Blog Post Edited"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And "List Description" label is displayed
        And Author was translated as "Autor"
        And "Intro Text" label is displayed
        And body was translated as "Cuerpo"
        And "Lead Image" button is displayed
        And Remove button for image was translated as "Eliminar"
        And "Promotional Image" button is displayed
        And the following fields are displayed under "Blog Topics" label
            | blogTopic                                  |
            | Biología                                   |
            | Riesgo de cáncer                           |
            | Cáncer infantil                            |
            | Resultados de estudios clínicos            |
            | Desigualdades                              |
            | Aprobaciones de la FDA                     |
            | Salud mundial                              |
            | Dirección y opiniones de expertos          |
            | Prevención                                 |
            | Pronóstico                                 |
            | Exámenes de detección y detección temprana |
            | Supervivencia y cuidados de apoyo          |
            | Tecnología                                 |
            | Tratamiento                                |
        And Related Resources section was translated as "Recursos relacionados"
        And Link section under related resources was translated as "Enlace"
        And dropdown to add link under related resources was translated to start with "Añadir"
        And "Recommended Content" label is displayed in the page
        And Link section under recommended content is displayed as "Featured Item"
        And dropdown to add link under recommended content was translated to start with "Añadir"
        And button to add citation was translated as "Añadir Citation"
        And "Public Use Text" dropdown has the following options
            | options        |
            | - Ninguno -    |
            | Presentación   |
            | Do Not Display |
        And "Public Use Text" dropdown displays "Do Not Display"
        And "Search Engine Restrictions" dropdown displays "Include in search"
        And "Posted Date" label is displayed under search Engine
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
        Given user is navigating to the blog "blog-post-edited" under "espanol/noticias/temas-y-relatos-blog"
        Then page title is "Automated Test Blog Post Edited"
        And espanol blog's posted date is today's date
        And the "Archivo" accordion is displayed
        And the lead image is matching the earlier selected image
        And blog posts list doesnot appear in the archive
        And "< Artículo anterior" link appears
        When user clicks on "< Artículo anterior" link
        And "Artículo siguiente >" link appears
        When user clicks on "Artículo siguiente >" link
        Then the author name "Automated Test Blog Post Author" is displayed
        And intro text reads "Blog Post Intro Text"
        And description reads "This is a description of Blog Post content type."
        Then Recursos relacionados section contains the following links
            | title                             | link                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |
        Then Recommended Content section contains the following links
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
            | Google Link                       | https://www.google.com/     |

    Scenario: Edit and republish Spanish blog post content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" plus "noticias/temas-y-relatos-blog/2025/blog-post-edited"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                    | field_name             |
            | Título de página | Automated Test Blog Post Edited Spanish                  | title                  |
            | Meta Description | Automated Test Blog Post Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publicar" from workflow actions


    Scenario: Verify Spanish edited content
        Given user is navigating to the front end site with spanish path "/espanol" plus "noticias/temas-y-relatos-blog/2025/blog-post-edited"
        And browser waits
        Then page title is "Automated Test Blog Post Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                  |
            | description | Automated Test Blog Post Meta Description Edited Spanish |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" plus "noticias/temas-y-relatos-blog/2025/blog-post-edited"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archivado"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Borrar la traduccion Español" action

        When user clicks on "Contenido" tab
        And user clicks on blog with url "blog-post-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "blog-post-edited" does not exist in the list of content