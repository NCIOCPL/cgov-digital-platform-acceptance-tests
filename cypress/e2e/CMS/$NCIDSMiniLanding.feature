Feature: NCIDS Mini Landing Page Test Creation of Content

    Scenario: User is adding new NCIDS Mini Landing page content type and adding a Slim Hero
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Create Mini Landing Page"
        And user selects "NCIDS" from style dropdown
        And browser waits
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                | field_name                     |
            | Pretty URL               | ncids-mini-landing-page                              | field_pretty_url               |
            | Page Title               | NCIDS Automated Test Mini Landing page               | title                          |
            | Browser Title            | Automated Test Mini Landing page - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Mini Landing page - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Mini Landing page Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Mini Landing page - Feature Card Desc | field_feature_card_description |
        And user selects "Add NCIDS Slim Hero" from "Contents" dropdown
        And browser waits
        And user uploads slim hero "slimHero.jpg"
        And system waits for file upload process
        And user fills out the following fields
            | fieldLabel       | value    | field_name                                                        |
            | Alternative text | Alt Text | field_landing_contents[0][subform][field_slim_hero_image][0][alt] |
        Then user saves the content page


    Scenario: Add Page title and content block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS Page Title Block" from "Contents" dropdown
        And browser waits
        And user selects "Add NCIDS Content Block" from "Contents" dropdown
        And browser waits
        And user clicks on Source tool icon in the html content tool bar
        And user enters '<div class="usa-section" data-eddl-landing-row=""><div class="usa-prose"><h2 class="nci-heading-h3 nci-heading--label">Test for Raw HTML & Analytics</h2><ul class="usa-list--unstyled"><li><a href="/news-events/media-resources" class="usa-link font-serif-lg text-bold" data-eddl-landing-rawhtml="" data-eddl-landing-rawhtml-title="Test for Raw HTML & Analytics" data-eddl-landing-rawhtml-component-variant="RawHTMLTest" data-eddl-landing-rawhtml-link-type="Internal" data-eddl-landing-rawhtml-link-area="Text">Resources &amp; Contacts</a></li><li><a href="https://visualsonline.cancer.gov/" class="usa-link font-serif-lg text-bold" data-eddl-landing-rawhtml="" data-eddl-landing-rawhtml-title="Test for Raw HTML & Analytics" data-eddl-landing-rawhtml-component-variant="RawHTMLTest" data-eddl-landing-rawhtml-link-type="External" data-eddl-landing-rawhtml-link-area="Text">Images and B-roll</a></li></ul></div></div>' into source text field
        Then user saves the content page

    Scenario: Add NCIDS 3 Feature Card Row
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add NCIDS Optional Heading 3 Feature Card Row" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value              | field_name                                                            |
            | Heading    | 3 Feature Card Row | field_landing_contents[3][subform][field_container_heading][0][value] |
        And user clicks on "Featured Item" in 1 "NCIDS Feature Card Internal" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on "Add NCIDS Feature Card Multimedia" button item
        And user clicks on "Featured Media" in 1 "NCIDS Feature Card Multimedia" section
        And user clicks on "Select media" button item
        And user enters "Test File for Related Resources" into media title search box and clicks "Apply"
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" button to select media
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                         | field_name                                                                                                 |
            | Card Title       | Multimedia Feature Card Title | field_landing_contents[3][subform][field_row_cards][1][subform][field_override_card_title][0][value]       |
            | Card Description | Multimedia Feature Card Desc  | field_landing_contents[3][subform][field_row_cards][1][subform][field_override_card_description][0][value] |
        And user selects "NCIDS Image" as promo image for 2 feature card
        And browser waits
        And user clicks on "Add NCIDS Feature Card External" button item
        And user fills out the following fields
            | fieldLabel        | value                   | field_name                                                                                           |
            | Featured Item Url | https://www.google1.com | field_landing_contents[3][subform][field_row_cards][2][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link             | field_landing_contents[3][subform][field_row_cards][2][subform][field_override_card_title][0][value] |
        When user saves the content page
        And user clicks on the tool bar status button "Draft"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions

    Scenario Outline: Verify newly created content
        And screen breakpoint is set to "<breakpoint>"
        Given user is navigating to the front end site with path site section plus "ncids-mini-landing-page"
        And page title is "NCIDS Automated Test Mini Landing page"
        And NCIDS Slim Hero is displayed with alt text "Alt Text"
        And content block has a title "Test for Raw HTML & Analytics"
        And content block has the following links
            | title                | href                              |
            | Resources & Contacts | /news-events/media-resources      |
            | Images and B-roll    | https://visualsonline.cancer.gov/ |
        And NCIDS feature cards have the following attributes
            | index | title                             | description                                | link                          | source                                                                                 | file             |
            | 0     | Article to test Related Resources | Automated Test Article - Feature Card Desc | {TEST_SITE_SECTION}/article   | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       |
            | 1     | Multimedia Feature Card Title     | Multimedia Feature Card Desc               | {TEST_SITE_SECTION}/test-file | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  |
            | 2     | Google Link                       | N/A                                        | https://www.google1.com       | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |


    Scenario: Add a translation
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "NCIDS Automated Test Mini Landing page"
        Then the page title is "Translations of NCIDS Automated Test Mini Landing page"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de NCIDS Automated Test Mini Landing page"
        And user clicks on "Editar" button for "NCIDS Feature Card Internal"
        And user fills out the following fields
            | fieldLabel       | value                    | field_name                                                                                                 |
            | Card Title       | Card Title Spanish       | field_landing_contents[3][subform][field_row_cards][0][subform][field_override_card_title][0][value]       |
            | Card Description | Card Description Spanish | field_landing_contents[3][subform][field_row_cards][0][subform][field_override_card_description][0][value] |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

Scenario: Verify Spanish content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "ncids-mini-landing-page"
        And page title is "NCIDS Automated Test Mini Landing page"
        And NCIDS Slim Hero is displayed with alt text "Alt Text"
        And content block has a title "Test for Raw HTML & Analytics"
        And content block has the following links
            | title                | href                              |
            | Resources & Contacts | /news-events/media-resources      |
            | Images and B-roll    | https://visualsonline.cancer.gov/ |
        And NCIDS feature cards have the following attributes
            | index | title                         | description                  | link                          | source                                                                                 | file             |
            | 0     | Card Title Spanish            | Card Description Spanish     | {TEST_SITE_SECTION}/article   | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       |
            | 1     | Multimedia Feature Card Title | Multimedia Feature Card Desc | {TEST_SITE_SECTION}/test-file | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  |
            | 2     | Google Link                   | N/A                          | https://www.google1.com       | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 |

    Scenario: Edit and republish english content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel               | value                                      | field_name                               |
            | Pretty URL               | ncids-mini-landing-page-edited             | field_pretty_url                         |
        And user removes page title block
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    
 Scenario: Verify no title appears on english page
        Given user is navigating to the front end site with path site section plus "ncids-mini-landing-page-edited"
        And page title does not exist
       
Scenario: Clean up
    Given user is navigating to "/user/login?show_login_fields=true"
    When user enters credentials of "editor"
    And user clicks "Log in" button
    Then user is logged in and the user name "editor" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    And user clicks on title with url spanish path "/espanol" site section plus "ncids-mini-landing-page"
    And user clicks on the tool bar status button "Publicado"
    And user clicks "Request Archive" button from Moderation sidebar
    And user clicks on the tool bar status button "Archive Requested"
    And user clicks "Approve Archive Request" button from Moderation sidebar
    And user clicks on the tool bar status button "Archivado"
    And user clicks "View in edit form" button from other actions
    When user clicks on "Delete" option button
    When user confirms "Borrar la traduccion Español" action

    When user clicks on "Content" tab
    And user clicks on title with url "ncids-mini-landing-page-edited" from the list of content
    And user clicks on the tool bar status button "Published"
    And user clicks "Request Archive" button from Moderation sidebar
    And user clicks on the tool bar status button "Archive Requested"
    And user clicks "Approve Archive Request" button from Moderation sidebar
    And user clicks on the tool bar status button "Archived"
    And user clicks "View in edit form" button from other actions
    When user clicks on "Delete" option button
    When user confirms "Delete" action

