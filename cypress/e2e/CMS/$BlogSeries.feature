Feature: As a cms user I want to be able to create Blog Series content type to promote Blog Series and Blog Topic.

    Scenario: User is adding new Blog Series content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Series" content type
        Then page title is "Create Blog Series"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel                 | value                                             | field_name                       |
            | Page Title                 | Automated Test Blog Series                        | title                            |
            | Pretty URL                 | blog-series                                       | field_pretty_url                 |
            | Browser Title              | Automated Test Blog Series - Browser Title        | field_browser_title              |
            | Card Title                 | Automated Test Blog Series - Card Title           | field_card_title                 |
            | Meta Description           | Automated Blog Series Meta Description            | field_page_description           |
            | Feature Card Description   | Automated Test Blog Series - Feature Card Desc    | field_feature_card_description   |
            | Blog Series Shortname      | TestBlogSeries                                    | field_blog_series_shortname      |
            | Subscription URL           | https://feedburner-test.cancer.gov/testblogseries | field_feedburner_url             |
            | Recommended Content Header | Recommended Text                                  | field_recommended_content_header |
        And browser waits
        And user uploads test file "heroimagenewsdesktop.jpg"
        And system waits for file upload process
        And user enters "Text Alt" into the "Alternative text" text field
        And user enters "Blog Series List Description" into "List Description" text field
        And user fills out "About-Blog" text area with "This is all about Blog Series."
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify newly created content Blog Series
        Given user is navigating to the front end site with path site section plus "blog-series"
        And the banner image is displayed
        Then page title is "Automated Test Blog Series"
        And blog series description reads "This is all about Blog Series"
        And the "Subscribe" link appears with url "https://feedburner-test.cancer.gov/testblogseries"
        And the "Archive" accordion is displayed
        And blog posts list does not appear in the archive
        And the page contains meta tags with the following names
            | name        | content                                |
            | description | Automated Blog Series Meta Description |

    Scenario: User is adding new Blog Post content type without any image so it can be added to Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Automated Test Blog Series" from Blog Series dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                      | field_name       |
            | Pretty URL | blog-post-test-blog-series | field_pretty_url |
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                            | field_name                     |
            | Page Title               | Automated Test Blog Post for testing Blog Series | title                          |
            | Browser Title            | Automated Test Blog Post - Browser Title         | field_browser_title            |
            | Card Title               | Automated Test Blog Post - Card Title            | field_card_title               |
            | Meta Description         | Automated Blog Post Meta Description             | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc     | field_feature_card_description |
            | Author                   | Automated Test Blog Post Author                  | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: User is adding Blog Topic to the already created Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Blog Topics"
        And user clicks on "Add term" action button
        Then page title is "Add term"
        And user fills out the following fields
            | fieldLabel | value           | field_name                       |
            | Name       | Test Blog Topic | name[0][value]                   |
            | Pretty URL | test-blog-topic | field_topic_pretty_url[0][value] |
        And user selects "Automated Test Blog Series" radio button under "Owner Blog"
        And browser waits
        And user enters "Blog Topic Description" into "Description" field
        Then user saves the content page

    Scenario: Edit and republish Blog Post content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post-test-blog-series" under "/about-cancer/understanding/blog-series" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user checks "Test Blog Topic" checkbox
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Edit and republish Blog Series content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-series" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Card Title" field
        And user clears out "Feature Card Description" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel               | value                                              | field_name                     |
            | Pretty URL               | blog-series-edited                                 | field_pretty_url               |
            | Page Title               | Automated Test Blog Series Edited                  | title                          |
            | Card Title               | Automated Test Blog Series - Card Title Edited     | field_card_title               |
            | Meta Description         | Automated Test Blog Series Meta Description Edited | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc       | field_feature_card_description |
        And user clicks on dropdown button toggle to view Featured Posts
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user selects 3 Promotional Image from the list of images to be displayed in mini landing pages
        And user remembers the source of selected promotional image to be displayed in mini landing pages for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: User is adding new Blog Post content type with images so it can be added to Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Automated Test Blog Series Edited" from "Blog Series" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                             | field_name                     |
            | Pretty URL               | blog-post2-test-blog-series                       | field_pretty_url               |
            | Page Title               | Automated Test Blog Post2 for testing Blog Series | title                          |
            | Browser Title            | Automated Test Blog Post2 - Browser Title         | field_browser_title            |
            | Card Title               | Automated Test Blog Post2 - Card Title            | field_card_title               |
            | Meta Description         | Automated Blog Post2 Meta Description             | field_page_description         |
            | Feature Card Description | Automated Test Blog Post2 - Feature Card Desc     | field_feature_card_description |
            | Author                   | Automated Test Blog Post2 Author                  | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects 1 Lead Image from the list of images for blog series
        And browser waits
        And user remembers the source of selected lead image for blog series for further verification
        And user selects 2 Promotional Image from the list of images for blog series
        And browser waits
        And user remembers the source of selected promo image for blog series for further verification
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify edited content and Blog Topic in the Blog Series
        Given user is navigating to the front end site with path site section plus "blog-series-edited"
        Then page title is "Automated Test Blog Series Edited"
        And the "Featured Posts" managed list appears
        And public use text is not displayed
        And the "Featured Posts" section is displayed with the following cards
            | title                                 | linkEnding | expectedDate | author                          |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
        And the page contains meta tags with the following names
            | name        | content                                            |
            | description | Automated Test Blog Series Meta Description Edited |
        Then list of "blog post" has the following posts
            | title                                             | url                                                                                         | expectedDate | author                           |
            | Automated Test Blog Post for testing Blog Series  | {TEST_SITE_SECTION}/blog-series-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM}         | today's date | Automated Test Blog Post Author  |
            | Automated Test Blog Post2 for testing Blog Series | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post2-test-blog-series-{RANDOM} | today's date | Automated Test Blog Post2 Author |
        And the promotional image is matching the earlier selected image
        And the Continue Reading link appears with the following href
            | linkName           | linkHref                                                                                    |
            | Continue Reading > | {TEST_SITE_SECTION}/blog-series-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM}         |
            | Continue Reading > | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post2-test-blog-series-{RANDOM} |
        And the "Categories" managed list appears without the date
        And the "Test Blog Topic" link appears with the following href
            | linkName        | linkHref                                                                       |
            | Test Blog Topic | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}?topic=test-blog-topic-{RANDOM} |

    Scenario: Verify Blog Topic at the front end on Blog Post without images content type
        Given user is navigating to the blog "blog-post-test-blog-series" under "about-cancer/understanding/blog-series"
        And the "Categories" managed list appears without the date
        And the "Test Blog Topic" link appears with the following href
            | linkName        | linkHref                                                                       |
            | Test Blog Topic | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}?topic=test-blog-topic-{RANDOM} |

    Scenario: Verify Blog Topic at the front end on Blog Post with images content type
        Given user is navigating to the blog "blog-post2-test-blog-series" under "/about-cancer/understanding/blog-series-edited"
        And the "Categories" managed list appears without the date
        And the "Test Blog Topic" link appears with the following href
            | linkName        | linkHref                                                                       |
            | Test Blog Topic | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}?topic=test-blog-topic-{RANDOM} |

    Scenario: Add a featured item to mini landing page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user selects "Automated Test Blog Series Edited" item from main page content
        And user clicks on "Select content" button to select the item
        And browser waits
        And "Automated Test Blog Series Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And browser waits
        And the Card Title has a link "Automated Test Blog Series - Card Title Edited" with href "/about-cancer/understanding/blog-series-edited"
        And feature card description reads "Automated Test Blog Post - Feature Card Desc"

    Scenario: Remove featured item
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user selects "Quick Publish" from workflow actions

    Scenario: Add a translation for Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Blog Series Edited"
        Then the page title is "Translations of Automated Test Blog Series Edited"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Blog Series Edited"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
            | Blog Series Shortname    | field_blog_series_shortname    |
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                      | field_name             |
            | Título de página | Automated Test Blog Series Edited Spanish                  | title                  |
            | Meta Description | Automated Test Blog Series Meta Description Edited Spanish | field_page_description |
        And "Number of Posts to Display" label is displayed with value 10
        And "List Description" label is displayed
        And "Allow Comments" dropdown has the following options
            | options               |
            | Allow Comments        |
            | Do Not Allow Comments |
        And "Allow Comments" dropdown displays "Do Not Allow Comments"
        And "About Blog" label is displayed
        And "Subscription URL" text field label is displayed
        And "Featured Posts" button is displayed
        And the following posts are displayed with remove button translated as "Eliminar"
            | posts                                            |
            | Automated Test Blog Post for testing Blog Series |
            | Automated Test Blog Post for testing Blog Series |
            | Automated Test Blog Post for testing Blog Series |
        And "Recommended Content Header" label is displayed with the text "Recommended Text"
        And the translated banner image is displayed
        And "Texto alternativo" label is displayed with the text "Text Alt"
        And the link with the name "heroimagenewsdesktop.jpg" is displayed with remove button translated as "Eliminar"
        And "Promotional Image" button is displayed with remove button translated as "Eliminar"
        And "Public Use Text" dropdown has the following options
            | options        |
            | - Ninguno -    |
            | Presentación   |
            | Do Not Display |
        And "Public Use Text" dropdown displays "Do Not Display"
        And "Search Engine Restrictions" dropdown has the following options
            | options             |
            | Include in search   |
            | Exclude from search |
        And "Search Engine Restrictions" dropdown displays "Include in search"
        And "List Thumbnails" dropdown has the following options
            | options                |
            | Show Thumbnails        |
            | Do Not Show Thumbnails |
        And "List Thumbnails" dropdown displays "Show Thumbnails"
        And "Archive Group By" dropdown has the following options
            | options |
            | Mes     |
            | Año     |
        And "Archive Group By" dropdown displays "Año"
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

    Scenario: Verify translated Blog Series
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "blog-series-edited"
        Then page title is "Automated Test Blog Series Edited Spanish"
        And the "Suscríbase" link appears with href "https://feedburner-test.cancer.gov/testblogseries"
        And the "Archivo" accordion is displayed
        And the banner image is matching the earlier selected image
        And blog posts list does not appear in the archive
        And the "Featured Posts" managed list appears
        And public use text is not displayed
        And the "Spanish Featured Posts" section is displayed with the following cards
            | title                                 | linkEnding | author                          |
            | Automated Test Blog Post - Card Title | /blog-post | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | Automated Test Blog Post Author |
        And description reads "This is all about Blog Series."

    Scenario: User is adding new Spanish Blog Post content type without any image so it can be added to Spanish Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Blog Post for testing Blog Series"
        Then the page title is "Translations of Automated Test Blog Post for testing Blog Series"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Blog Post for testing Blog Series"
        And "Blog Series" dropdown displays "Automated Test Blog Series Edited Spanish"
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
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: User is adding Spanish Blog Topic to the already created Spanish Blog Series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Blog Topics"
        And user selects "Translate" option from Operations for "Test Blog Topic"
        Then the page title is "Translations of Test Blog Topic"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test Blog Topic"
        And user clears out "Nombre" field
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value                   | field_name                       |
            | Nombre     | Test Blog Topic Spanish | name[0][value]                   |
            | Pretty URL | test-blog-topic         | field_topic_pretty_url[0][value] |
        And user selects "Automated Test Blog Series Edited Spanish" radio button under "Owner Blog"
        And browser waits
        And user enters "Blog Topic Description Spanish" into "Descripción" field
        Then user saves the content page

    Scenario: Edit and republish Spanish Blog Post content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post-test-blog-series" under "/espanol/about-cancer/understanding/blog-series-edited" from the list of content
        And user clicks on the tool bar status button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user checks "Test Blog Topic Spanish" checkbox
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content and Blog Topic in the Blog Series
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "blog-series-edited"
        And browser waits
        Then page title is "Automated Test Blog Series Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                    |
            | description | Automated Test Blog Series Meta Description Edited Spanish |
        Then list of "Spanish blog post" has the following posts
            | title                                            | url                                                                                                | expectedDate | author                          |
            | Automated Test Blog Post for testing Blog Series | /espanol{TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM} | today's date | Automated Test Blog Post Author |
        And the Continue Reading link appears with the following href
            | linkName       | linkHref                                                                                            |
            | Siga leyendo > | /espanol{TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM} |
        And the "Categorías" managed list appears without the date
        And the "Test Blog Topic Spanish" link appears with the following href
            | linkName                | linkHref                                                                               |
            | Test Blog Topic Spanish | /espanol{TEST_SITE_SECTION}/blog-series-edited-{RANDOM}?topic=test-blog-topic-{RANDOM} |

    Scenario: Verify Blog Topic at the front end on Blog Post without images content type
        Given user is navigating to the blog "blog-post-test-blog-series" under "espanol/about-cancer/understanding/blog-series-edited"
        And the "Categorías" managed list appears without the date
        And the "Test Blog Topic Spanish" link appears with the following href
            | linkName                | linkHref                                                                               |
            | Test Blog Topic Spanish | /espanol{TEST_SITE_SECTION}/blog-series-edited-{RANDOM}?topic=test-blog-topic-{RANDOM} |

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title "Automated Test Blog Series Edited" with url "blog-series-edited" from the list of content
        And user selects a checkbox next to title "Automated Test Blog Post for testing Blog Series" with url "blog-post-test-blog-series" from the list of content
        And user selects a checkbox next to title "Automated Test Blog Post2 for testing Blog Series" with url "blog-post2-test-blog-series" from the list of content
        And user clicks on the "Apply to selected items" action button
        Then page title is "Are you sure you want to delete these content items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 5 content items." appears on a screen
        And the content item with url "blog-series-edited" does not exist in the list of content
        And the content item with url "blog-post-test-blog-series" does not exist in the list of content
        And the content item with url "blog-post2-test-blog-series" does not exist in the list of content
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Blog Topics"
        And user clicks on "Delete" from  dropdown button under "Blog Topic"
        Then page title is "Are you sure you want to delete the taxonomy term Test Blog Topic?"
        When user clicks on "Delete all translations" button
        Then the confirmation text "Deleted term Test Blog Topic." appears on a screen