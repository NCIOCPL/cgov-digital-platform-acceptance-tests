Feature: Home And Landing Page Test Creation of Content

    Scenario: User is adding new Home and Landing page content type and adding a Hero
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Home and Landing" content type
        Then page title is "Home and Landing"
        And user selects "NCIDS without Title" from style dropdown
        And browser waits
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                    | field_name                     |
            | Pretty URL               | ncids-home-and-landing-page                              | field_pretty_url               |
            | Page Title               | NCIDS Automated Test Home and Landing page               | title                          |
            | Browser Title            | Automated Test Home and Landing page - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Home and Landing page - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Home and Landing page Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Home and Landing page - Feature Card Desc | field_feature_card_description |
        And user selects "Add NCIDS Hero" from "Contents" dropdown
        And "Theme" drop-down is displayed with "Light" option as default
        And "Theme" dropdown has the following options
            | options   |
            | Light     |
            | Dark      |
            | DON'T USE |
        And user select "Dark" from the "Theme" dropdown
        And user fills out the following fields
            | fieldLabel | value        | field_name                                                  |
            | Tagline    | Tagline Text | field_landing_contents[0][subform][field_tagline][0][value] |
        And user clicks on "Add NCIDS Link Button Internal" from "Primary Call to Action Link" area
        And browser waits
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on "Add NCIDS Link Button External" from "Call to Action Strip" area
        And user uploads hero images as follows
            | fileName               | type         |
            | widescreen_cat.jpeg    | widescreen   |
            | desktop_cat.jpeg       | desktop-hero |
            | tablet-large_cat.jpeg  | tablet-large |
            | tablet_hero.jpeg       | tablet-hero  |
            | mobile_large_hero.jpeg | mobile-large |
            | mobile_cat.jpeg        | mobile-hero  |
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                          |
            | Link              | https://www.google.com | field_landing_contents[0][subform][field_cta_link_buttons][0][subform][field_external_link][0][uri] |
            | Link Button Title | CTA External Link      | field_landing_contents[0][subform][field_cta_link_buttons][0][subform][field_button_text][0][value] |
        Then user saves the content page


    Scenario: Add 2 Guide Card Row
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Guide Card Row" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value              | field_name                                                                                                           |
            | Heading          | Guide Card 1       | field_landing_contents[1][subform][field_image_desc_guide_cards][0][subform][field_container_heading][0][value]      |
            | Card Description | Card 1 Description | field_landing_contents[1][subform][field_image_desc_guide_cards][0][subform][field_guide_card_description][0][value] |
        And user uploads "pano_image.jpg" as 1 guide card image
        And browser waits
        And user clicks on "Add NCIDS Link Button Internal" from "Links for Guide Card Buttons" area
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user adds another "internal" link for 1 guide card
        And browser waits
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel                 | value                 | field_name                                                                                                                                |
            | Override Link Button Title | Override Button Title | field_landing_contents[1][subform][field_image_desc_guide_cards][0][subform][field_link_buttons][1][subform][field_button_text][0][value] |
        And user clicks on "Add NCIDS Guide Card with Image and Description" button item
        And user fills out the following fields
            | fieldLabel       | value              | field_name                                                                                                           |
            | Heading          | Guide Card 2       | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_container_heading][0][value]      |
            | Card Description | Card 2 Description | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_guide_card_description][0][value] |
        And user adds another "external" link for 2 guide card
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                                                                |
            | Link              | https://www.google.com | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][0][subform][field_external_link][0][uri] |
            | Link Button Title | Google Link            | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][0][subform][field_button_text][0][value] |
        Then user saves the content page


    Scenario: Add NCIDS 3 Feature Card Row
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add NCIDS 3 Feature Card Row" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value              | field_name                                                            |
            | Heading    | 3 Feature Card Row | field_landing_contents[2][subform][field_container_heading][0][value] |
        And user clicks on "Featured Item" in 1 "NCIDS Card Internal" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on "Add NCIDS Card Multimedia" button item
        And user clicks on "Featured Media" in 1 "NCIDS Card Multimedia" section
        And user clicks on "Select media" button item
        And user enters "Test File for Related Resources" into media title search box and clicks "Apply"
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" button to select media
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                         | field_name                                                                                                 |
            | Card Title       | Multimedia Feature Card Title | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_title][0][value]       |
            | Card Description | Multimedia Feature Card Desc  | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_description][0][value] |
        And user selects "NCIDS Image" as promo image for 2 feature card
        And browser waits
        And user clicks on "Add NCIDS Card External" button item
        And user fills out the following fields
            | fieldLabel        | value                   | field_name                                                                                           |
            | Featured Item Url | https://www.google1.com | field_landing_contents[2][subform][field_row_cards][2][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link             | field_landing_contents[2][subform][field_row_cards][2][subform][field_override_card_title][0][value] |
        And user selects "do_not_display" from 3 External Link Display dropdown number 2
        When user saves the content page



    Scenario: Add NCIDS Promo Block External
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add NCIDS Promo Block External" from "Contents" dropdown
        And browser waits
        And "Theme" drop-down is displayed with the "Dark" option as default
        And the "Theme" dropdown has the following options
            | options   |
            | Light     |
            | Dark      |
            | DON'T USE |
        And the user select "Light" option from the "Theme" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                   | field_name                                                         |
            | Featured Item Url | https://www.google2.com | field_landing_contents[3][subform][field_featured_url][0][uri]     |
            | Title             | External Link Title     | field_landing_contents[3][subform][field_override_title][0][value] |
            | Button Text       | Button Text             | field_landing_contents[3][subform][field_button_text][0][value]    |
        And user selects "NCIDS Image" as promo image for 4 block
        And browser waits
        Then user saves the content page


    Scenario: Add NCIDS Promo Block Internal
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add NCIDS Promo Block Internal" from "Contents" dropdown
        And browser waits
        And user selects "Light" theme for 3 block
        And user selects "Image Right" image position for 2 block
        And user clicks on "Featured Item" in 1 "NCIDS Promo Block Internal" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel           | value                               | field_name                                                               |
            | Override Title       | Internal Block Override Title       | field_landing_contents[4][subform][field_override_title][0][value]       |
            | Override Description | Internal Block Override Description | field_landing_contents[4][subform][field_override_description][0][value] |
            | Button Text          | Button Text                         | field_landing_contents[4][subform][field_button_text][0][value]          |
        And user selects "Add NCIDS Promo Block Internal" from "Contents" dropdown
        And browser waits
        And user selects "No Image" image position for 3 block
        And user clicks on "Featured Item" in 2 "NCIDS Promo Block Internal" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel  | value       | field_name                                                      |
            | Button Text | Button Text | field_landing_contents[5][subform][field_button_text][0][value] |
        Then user saves the content page

    Scenario: Add 3 Guide Card Row
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 3 Guide Card Row" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                    | field_name                                                                                           |
            | Heading    | 3 Guide Card Row Heading | field_landing_contents[6][subform][field_container_heading][0][value]                                |
            | Heading    | 3 Guide Card row 1       | field_landing_contents[6][subform][field_guide_cards][0][subform][field_container_heading][0][value] |
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user adds another "internal" link for 1 guide card
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel                 | value                                  | field_name                                                                                                                     |
            | Override Link Button Title | 3 Guide Card row Override Button Title | field_landing_contents[6][subform][field_guide_cards][0][subform][field_link_buttons][1][subform][field_button_text][0][value] |
        And user clicks on "Add NCIDS Guide Card" button item
        And user fills out the following fields
            | fieldLabel | value              | field_name                                                                                           |
            | Heading    | 3 Guide Card row 2 | field_landing_contents[6][subform][field_guide_cards][1][subform][field_container_heading][0][value] |
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user adds another "external" link for 2 guide card
        And user fills out the following fields
            | fieldLabel        | value                          | field_name                                                                                                                     |
            | Link              | https://www.google.com         | field_landing_contents[6][subform][field_guide_cards][1][subform][field_link_buttons][1][subform][field_external_link][0][uri] |
            | Link Button Title | 3 Guide Card row Google Link 1 | field_landing_contents[6][subform][field_guide_cards][1][subform][field_link_buttons][1][subform][field_button_text][0][value] |
        And user clicks on "Add NCIDS Guide Card" button item
        And user fills out the following fields
            | fieldLabel | value              | field_name                                                                                           |
            | Heading    | 3 Guide Card row 3 | field_landing_contents[6][subform][field_guide_cards][2][subform][field_container_heading][0][value] |
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user adds another "external" link for 3 guide card
        And user fills out the following fields
            | fieldLabel        | value                          | field_name                                                                                                                     |
            | Link              | https://www.google.com         | field_landing_contents[6][subform][field_guide_cards][2][subform][field_link_buttons][1][subform][field_external_link][0][uri] |
            | Link Button Title | 3 Guide Card row Google Link 2 | field_landing_contents[6][subform][field_guide_cards][2][subform][field_link_buttons][1][subform][field_button_text][0][value] |
        Then user saves the content page

    Scenario: Add NCIDS 2 column container
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Container" from "Contents" dropdown
        And browser waits
        And user clicks on hidden "Add NCIDS Dynamic List" button
        And user fills out the following fields
            | fieldLabel     | value            | field_name                                                                                          |
            | List Title     | List Title       | field_landing_contents[7][subform][field_main_contents][1][subform][field_list_title][0][value]     |
            | View More Text | View More Button | field_landing_contents[7][subform][field_main_contents][1][subform][field_view_more_text][0][value] |
        And user selects "Press Releases" from Source View dropdown
        And user selects "NCIDS Collection Media" from Display dropdown
        And browser waits
        And user clicks on "View More Link" link in the "NCIDS Dynamic List" text area
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user enters '<div class="usa-section" data-eddl-landing-row><h2 class="nci-heading-h3 nci-heading--label">Media Resources</h2><ul class="usa-list--unstyled rightrail__list-links"><li><a href="/news-events/media-resources" class="usa-link font-serif-lg text-bold" data-eddl-landing-rawhtmldata-eddl-landing-rawhtml-title="Media Resources" data-eddl-landing-rawhtml-component-variant="NewsEventsRightRail" data-eddl-landing-rawhtml-link-type="Internal" data-eddl-landing-rawhtml-link-area="Text" >Resources &amp; Contacts</a></li></ul></div>' in Raw HTML Content under Secondary Contents
        Then user saves the content page
        And user clicks on the tool bar status button "Draft"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions

    Scenario Outline: Verify newly created content
        And screen breakpoint is set to "<breakpoint>"
        Given user is navigating to the front end site with path site section plus "ncids-home-and-landing-page"
        And NCIDS Hero is displayed
        And tagline title reads "Tagline Text"
        And tagline button has text "Article to test Related Resources" with link "{TEST_SITE_SECTION}/article"
        And 1 cta strip link has text "CTA External Link" with a link "https://www.google.com" and exit disclaimer is "displayed"
        Then NCIDS guide cards have the following attributes
            | index | title        | description        | btnLinkAndText                                                                                                  | source                                                                                                    | file             | exitDisclaimer |
            | 0     | Guide Card 1 | Card 1 Description | Article to test Related Resources,{TEST_SITE_SECTION}/article;Override Button Title,{TEST_SITE_SECTION}/article | /sites/default/files/styles/ncids_guide_card_16x9/public/ncids_guide_card_img_desc/field_image_guide_card | pano_image       | 0,1;N/A,N/A    |
            | 1     | Guide Card 2 | Card 2 Description | Google Link,https://www.google.com                                                                              | /sites/default/files/styles/ncids_guide_card_16x9/module/cgov_image/img                                   | placeholder-16x9 | 0;yes          |
        And NCIDS promo blocks have the following attributes
            | index | title                             | description                                | link                        | buttonText  | source                                                                              | file            | srcset                                                                            | srcSetImg       | exitDisclaimer |
            | 0     | External Link Title               | N/A                                        | https://www.google2.com     | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | thumbnail_image | yes            |
            | 1     | Internal Block Override Title     | Internal Block Override Description        | {TEST_SITE_SECTION}/article | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/media_image          | main_image      | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/media_image         | main_image      | N/A            |
            | 2     | Article to test Related Resources | Automated Test Article - Feature Card Desc | {TEST_SITE_SECTION}/article | Button Text | N/A                                                                                 | N/A             | N/A                                                                               | N/A             | N/A            |
        And NCIDS feature cards have the following attributes
            | index | title                             | description                                | link                          | source                                                                                 | file             | exitDisclaimer |
            | 0     | Article to test Related Resources | Automated Test Article - Feature Card Desc | {TEST_SITE_SECTION}/article   | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       | N/A            |
            | 1     | Multimedia Feature Card Title     | Multimedia Feature Card Desc               | {TEST_SITE_SECTION}/test-file | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  | N/A            |
            | 2     | Google Link                       | N/A                                        | https://www.google1.com       | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 | N/A            |
        Then NCIDS 3 guide card row at position 2 have the following attributes
            | index | title              | btnLinkAndText                                                                                                                   | exitDisclaimer |
            | 0     | 3 Guide Card row 1 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Override Button Title,{TEST_SITE_SECTION}/article | 0,N/A;1,N/A    |
            | 1     | 3 Guide Card row 2 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Google Link 1,https://www.google.com              | 0,N/A;1,yes    |
            | 2     | 3 Guide Card row 3 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Google Link 2,https://www.google.com              | 0,N/A;1,yes    |
        Then two column container is visible
        And NCIDS dynamic list shows items with date and the following
            | component   |
            | description |
            | heading     |
        And view more button "View More Button" is a link
        And the right rail links have "data-eddl-landing-rawhtml-component-variant" attribute with value "NewsEventsRightRail"
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |


    Scenario: Add a translation
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "NCIDS Automated Test Home and Landing page"
        Then the page title is "Translations of NCIDS Automated Test Home and Landing page"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de NCIDS Automated Test Home and Landing page"
        And user clicks on "Editar" button for "NCIDS Card Multimedia"
        And user fills out the following fields
            | fieldLabel           | value    | field_name                                                                                                 |
            | Tagline              | _Spanish | field_landing_contents[0][subform][field_tagline][0][value]                                                |
            | Override Title       | _Spanish | field_landing_contents[4][subform][field_override_title][0][value]                                         |
            | Override Description | _Spanish | field_landing_contents[4][subform][field_override_description][0][value]                                   |
            | Button Text          | _Spanish | field_landing_contents[4][subform][field_button_text][0][value]                                            |
            | Card Title           | _Spanish | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_title][0][value]       |
            | Card Description     | _Spanish | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_description][0][value] |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

    Scenario: Verify Spanish content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "ncids-home-and-landing-page"
        And NCIDS Hero is displayed
        And tagline title reads "Tagline Text_Spanish"
        And tagline button has text "Article to test Related Resources" with link "{TEST_SITE_SECTION}/article"
        Then NCIDS guide cards have the following attributes
            | index | title        | description        | btnLinkAndText                                                                                                  | source                                                                                                    | file             |exitDisclaimer |
            | 0     | Guide Card 1 | Card 1 Description | Article to test Related Resources,{TEST_SITE_SECTION}/article;Override Button Title,{TEST_SITE_SECTION}/article | /sites/default/files/styles/ncids_guide_card_16x9/public/ncids_guide_card_img_desc/field_image_guide_card | pano_image       |0,1;N/A,N/A    |
            | 1     | Guide Card 2 | Card 2 Description | Google Link,https://www.google.com                                                                              | /sites/default/files/styles/ncids_guide_card_16x9/module/cgov_image/img                                   | placeholder-16x9 | 0;yes          |
        And NCIDS promo blocks have the following attributes
            | index | title                                 | description                                 | link                        | buttonText          | source                                                                              | file            | srcset                                                                            | srcSetImg       |exitDisclaimer |
            | 0     | External Link Title                   | N/A                                         | https://www.google2.com     | Button Text         | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | thumbnail_image |yes            |
            | 1     | Internal Block Override Title_Spanish | Internal Block Override Description_Spanish | {TEST_SITE_SECTION}/article | Button Text_Spanish | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/media_image          | main_image      | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/media_image         | main_image      |N/A            |
            | 2     | Article to test Related Resources     | Automated Test Article - Feature Card Desc  | {TEST_SITE_SECTION}/article | Button Text         | N/A                                                                                 | N/A             | N/A                                                                               | N/A             |N/A            |
        And NCIDS feature cards have the following attributes
            | index | title                                 | description                                | link                          | source                                                                                 | file             | exitDisclaimer |
            | 0     | Article to test Related Resources     | Automated Test Article - Feature Card Desc | {TEST_SITE_SECTION}/article   | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       | N/A            |
            | 1     | Multimedia Feature Card Title_Spanish | Multimedia Feature Card Desc_Spanish       | {TEST_SITE_SECTION}/test-file | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  | N/A            |
            | 2     | Google Link                           | N/A                                        | https://www.google1.com       | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 |N/A            |
        Then NCIDS 3 guide card row at position 2 have the following attributes
            | index | title              | btnLinkAndText                                                                                                                   |exitDisclaimer |
            | 0     | 3 Guide Card row 1 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Override Button Title,{TEST_SITE_SECTION}/article |0,N/A;1,N/A    |
            | 1     | 3 Guide Card row 2 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Google Link 1,https://www.google.com              |0,N/A;1,yes    |
            | 2     | 3 Guide Card row 3 | Article to test Related Resources,{TEST_SITE_SECTION}/article;3 Guide Card row Google Link 2,https://www.google.com              |0,N/A;1,yes    |

    Scenario: Edit existing content and test external links override
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value                              | field_name       |
            | Pretty URL | ncids-home-and-landing-page-edited | field_pretty_url |
        And user clicks on 1 edit paragraph button
        And user clicks on 1 edit cta strip
        And user selects "do_not_display" from cta External Link Display dropdown number 1
        And user clicks on "Add NCIDS Link Button External" from "Call to Action Strip" area
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                          |
            | Link              | https://www.google.gov | field_landing_contents[0][subform][field_cta_link_buttons][1][subform][field_external_link][0][uri] |
            | Link Button Title | CTA Gov Link  Default  | field_landing_contents[0][subform][field_cta_link_buttons][1][subform][field_button_text][0][value] |
        And user clicks on "Add NCIDS Link Button External" from "Call to Action Strip" area
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                          |
            | Link              | https://www.google.gov | field_landing_contents[0][subform][field_cta_link_buttons][2][subform][field_external_link][0][uri] |
            | Link Button Title | CTA Gov Link           | field_landing_contents[0][subform][field_cta_link_buttons][2][subform][field_button_text][0][value] |
        And user selects "force_display" from cta External Link Display dropdown number 3

        And user clicks on 2 edit paragraph button
        And user adds another "external" link for 2 guide card
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                                                                |
            | Link              | https://www.google.gov | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][1][subform][field_external_link][0][uri] |
            | Link Button Title | Gov Link               | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][1][subform][field_button_text][0][value] |
        And user adds another "external" link for 2 guide card
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                                                                |
            | Link              | https://www.google.gov | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][2][subform][field_external_link][0][uri] |
            | Link Button Title | Gov Link               | field_landing_contents[1][subform][field_image_desc_guide_cards][1][subform][field_link_buttons][2][subform][field_button_text][0][value] |
        And user selects "force_display" from 2 guide card External Link Display dropdown number 2
        And user clicks on 4 edit paragraph button
        And user selects "do_not_display" from promo block External Link Display dropdown number 4
        And user selects "Add NCIDS Promo Block External" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                   | field_name                                                         |
            | Featured Item Url | https://www.google2.gov | field_landing_contents[8][subform][field_featured_url][0][uri]     |
            | Title             | Gov link default        | field_landing_contents[8][subform][field_override_title][0][value] |
            | Button Text       | Button Text             | field_landing_contents[8][subform][field_button_text][0][value]    |
        And browser waits
        And user selects "No Image" image position for 3 block
        And user selects "Add NCIDS Promo Block External" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                         |
            | Featured Item Url | https://www.cancer.gov | field_landing_contents[9][subform][field_featured_url][0][uri]     |
            | Title             | Gov link force show    | field_landing_contents[9][subform][field_override_title][0][value] |
            | Button Text       | Button Text            | field_landing_contents[9][subform][field_button_text][0][value]    |
        And browser waits
        And user selects "force_display" from promo block External Link Display dropdown number 10
        And user selects "No Image" image position for 4 block
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario Outline: Verify edited content
        And screen breakpoint is set to "<breakpoint>"
        Given user is navigating to the front end site with path site section plus "ncids-home-and-landing-page-edited"
        And NCIDS Hero is displayed
        And tagline title reads "Tagline Text"
        And tagline button has text "Article to test Related Resources" with link "{TEST_SITE_SECTION}/article"
        And 1 cta strip link has text "CTA External Link" with a link "https://www.google.com" and exit disclaimer is "not displayed"
        And 2 cta strip link has text "CTA Gov Link  Default" with a link "https://www.google.gov" and exit disclaimer is "not displayed"
        And 3 cta strip link has text "CTA Gov Link" with a link "https://www.google.gov" and exit disclaimer is "displayed"
        Then NCIDS guide cards have the following attributes
            | index | title        | description        | btnLinkAndText                                                                                                  | source                                                                                                    | file             | exitDisclaimer    |
            | 0     | Guide Card 1 | Card 1 Description | Article to test Related Resources,{TEST_SITE_SECTION}/article;Override Button Title,{TEST_SITE_SECTION}/article | /sites/default/files/styles/ncids_guide_card_16x9/public/ncids_guide_card_img_desc/field_image_guide_card | pano_image       | 0,1;N/A,N/A       |
            | 1     | Guide Card 2 | Card 2 Description | Google Link,https://www.google.com;Gov Link,https://www.google.gov;Gov Link,https://www.google.gov              | /sites/default/files/styles/ncids_guide_card_16x9/module/cgov_image/img                                   | placeholder-16x9 | 0,1,2;yes,N/A,yes |
        And NCIDS promo blocks have the following attributes
            | index | title                             | description                                | link                        | buttonText  | source                                                                              | file            | srcset                                                                            | srcSetImg       | exitDisclaimer |
            | 0     | External Link Title               | N/A                                        | https://www.google2.com     | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | thumbnail_image | N/A            |
            | 1     | Internal Block Override Title     | Internal Block Override Description        | {TEST_SITE_SECTION}/article | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/media_image          | main_image      | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/media_image         | main_image      | N/A            |
            | 2     | Article to test Related Resources | Automated Test Article - Feature Card Desc | {TEST_SITE_SECTION}/article | Button Text | N/A                                                                                 | N/A             | N/A                                                                               | N/A             | N/A            |
            | 3     | Gov link default                  | N/A                                        | https://www.google2.gov     | Button Text | N/A                                                                                 | N/A             | N/A                                                                               | N/A             | N/A            |
            | 4     | Gov link force show               | N/A                                        | https://www.cancer.gov      | Button Text | N/A                                                                                 | N/A             | N/A                                                                               | N/A             | yes            |


        Examples:
            | breakpoint |
            | desktop    |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "ncids-home-and-landing-page"
        And user clicks on the tool bar status button "Publicado"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archivado"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Borrar la traduccion Español" action

        When user clicks on "Contenido" tab
        And user clicks on title with url "ncids-home-and-landing-page-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
