Feature: Home And Landing Page Test Creation of Content

    Scenario: Creating an image to use as promo
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on Image content type
        Then page title is "Add Image"
        And user fills out the following fields
            | fieldLabel   | value       | field_name             |
            | Name         | NCIDS Image | name[0][value]         |
            | Photo Credit | Test Credit | field_credit[0][value] |
        And user types "Test Caption" into Caption text field
        And user uploads test "main" image "social_media_image.jpg"
        And system waits for file upload process
        And user clicks on CROP IMAGE button
        And browser waits
        And user sets the following crops
            | crop      | cropcase  | locator              |
            | Thumbnail | thumbnail | a[href*="thumbnail"] |
            | 4x3       | 4x3       | a[href*="4x3"]       |
            | 3x4       | 3x4       | a[href*="3x4"]       |
            | 1x1       | 1x1       | a[href*="1x1"]       |
            | 16x9      | 16x9      | a[href*="16x9"]      |
            | 9x16      | 9x16      | a[href*="9x16"]      |
        And user uploads NCIDS image overrides as follows
            | fileName              | type                 |
            | panoramic_image.jpg   | ncids_promo_art_16x9 |
            | contextual_image.jpeg | ncids_promo_art_4x3  |
            | thumbnail_image.jpg   | ncids_promo_art_1x1  |
        Then user saves the content page


    Scenario: User is adding new Home and Landing page content type and adding a Hero
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user fills out the following fields
            | fieldLabel | value        | field_name                                                  |
            | Tagline    | Tagline Text | field_landing_contents[0][subform][field_tagline][0][value] |
        And user uploads hero images as follows
            | fileName               | type         |
            | widescreen_cat.jpeg    | widescreen   |
            | desktop_cat.jpeg       | desktop-hero |
            | tablet-large_cat.jpeg  | tablet-large |
            | tablet_hero.jpeg       | tablet-hero  |
            | mobile_large_hero.jpeg | mobile-large |
            | mobile_cat.jpeg        | mobile-hero  |

        And user clicks on "Add NCIDS Link Button Internal" from "Primary Call to Action Link" area
        And browser waits
        And user clicks on "Link" link in the "NCIDS Link Button Internal" text area
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on "Add NCIDS Link Button External" from "Call to Action Strip" area
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                          |
            | Link              | https://www.google.com | field_landing_contents[0][subform][field_cta_link_buttons][0][subform][field_external_link][0][uri] |
            | Link Button Title | CTA External Link      | field_landing_contents[0][subform][field_cta_link_buttons][0][subform][field_button_text][0][value] |
        Then user saves the content page


    Scenario: Add 2 Guide Card Row
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user adds another "internal" link for 1 guide card
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
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
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user clicks on "Featured Item" in 1 "NCIDS Feature Card Internal" section
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on "Add NCIDS Feature Card Internal" button item
        And user clicks on "Featured Item" in 1 "NCIDS Feature Card Internal" section
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                | field_name                                                                                                 |
            | Card Title       | Override Internal Feature Card Title | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_title][0][value]       |
            | Card Description | Override Internal Feature Card Desc  | field_landing_contents[2][subform][field_row_cards][1][subform][field_override_card_description][0][value] |
        And user selects "NCIDS Image" as promo image for 2 feature card
        And browser waits
        And user clicks on "Add NCIDS Feature Card External" button item
        And user fills out the following fields
            | fieldLabel        | value                   | field_name                                                                                           |
            | Featured Item Url | https://www.google1.com | field_landing_contents[2][subform][field_row_cards][2][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link             | field_landing_contents[2][subform][field_row_cards][2][subform][field_override_card_title][0][value] |
        When user saves the content page



    Scenario: Add NCIDS Promo Block External
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add NCIDS Promo Block External" from "Contents" dropdown
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
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
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
        And user clicks on "Select content" button item
        And user enters "Article to test Related Resources" into "Title" text field to filter content
        And user clicks on "Apply" button to select the item
        And browser waits
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user fills out the following fields
            | fieldLabel  | value       | field_name                                                      |
            | Button Text | Button Text | field_landing_contents[5][subform][field_button_text][0][value] |
        And user selects "Published" from Save as dropdown
        Then user saves the content page


    Scenario Outline: Verify newly created content
        And screen breakpoint is set to "<breakpoint>"
        Given user is navigating to the front end site with path site section plus "ncids-home-and-landing-page"
        And NCIDS Hero is displayed
        And tagline title reads "Tagline Text"
        And tagline button has text "Article to test Related Resources" with link "/about-cancer/understanding/article"
        Then NCIDS guide cards have the following attributes
            | index | title        | description        | btnLinkAndText                                                                                                                  | source                                                                                                    | file             |
            | 0     | Guide Card 1 | Card 1 Description | Article to test Related Resources,/about-cancer/understanding/article;Override Button Title,/about-cancer/understanding/article | /sites/default/files/styles/ncids_guide_card_16x9/public/ncids_guide_card_img_desc/field_image_guide_card | pano_image       |
            | 1     | Guide Card 2 | Card 2 Description | Google Link,https://www.google.com                                                                                              | /sites/default/files/styles/ncids_guide_card_16x9/module/cgov_image/img                                   | placeholder-16x9 |
        And NCIDS promo blocks have the following attributes
            | index | title                             | description                                | link                                | buttonText  | source                                                                              | file            | srcset                                                                            | srcSetImg       |
            | 0     | External Link Title               | N/A                                        | https://www.google2.com             | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | thumbnail_image |
            | 1     | Internal Block Override Title     | Internal Block Override Description        | /about-cancer/understanding/article | Button Text | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/media_image          | main_image      | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/media_image         | main_image      |
            | 2     | Article to test Related Resources | Automated Test Article - Feature Card Desc | /about-cancer/understanding/article | Button Text | N/A                                                                                 | N/A             | N/A                                                                               | N/A             |
        And NCIDS feature cards have the following attributes
            | index | title                                | description                                | link                                | source                                                                                 | file             | srcset                                                                               | srcSetImg        |
            | 0     | Article to test Related Resources    | Automated Test Article - Feature Card Desc | /about-cancer/understanding/article | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       | /sites/default/files/styles/ncids_featured_4x3/public/cgov_image/media_image         | main_image       |
            | 1     | Override Internal Feature Card Title | Override Internal Feature Card Desc        | /about-cancer/understanding/article | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  | /sites/default/files/styles/ncids_featured_4x3/public/cgov_image/ncids_promo_art_4x3 | contextual_image |
            | 2     | Google Link                          | N/A                                        | https://www.google1.com             | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 | /sites/default/files/styles/ncids_featured_4x3/module/cgov_image/img                 | placeholder-4x3  |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |


    Scenario: Add a translation
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "NCIDS Automated Test Home and Landing page"
        Then the page title is "Translations of NCIDS Automated Test Home and Landing page"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de NCIDS Automated Test Home and Landing page"
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
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify Spanish content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "ncids-home-and-landing-page"
        And NCIDS Hero is displayed
        And tagline title reads "Tagline Text_Spanish"
        And tagline button has text "Article to test Related Resources" with link "/about-cancer/understanding/article"
        Then NCIDS guide cards have the following attributes
            | index | title        | description        | btnLinkAndText                                                                                                                  |
            | 0     | Guide Card 1 | Card 1 Description | Article to test Related Resources,/about-cancer/understanding/article;Override Button Title,/about-cancer/understanding/article |
            | 1     | Guide Card 2 | Card 2 Description | Google Link,https://www.google.com                                                                                              |
        And NCIDS promo blocks have the following attributes
            | index | title                                 | description                                 | link                                | buttonText          | source                                                                              | file            | srcset                                                                            | srcSetImg       |
            | 0     | External Link Title                   | N/A                                         | https://www.google2.com             | Button Text         | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | thumbnail_image |
            | 1     | Internal Block Override Title_Spanish | Internal Block Override Description_Spanish | /about-cancer/understanding/article | Button Text_Spanish | /sites/default/files/styles/ncids_promo_16x9/public/cgov_image/media_image          | main_image      | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/media_image         | main_image      |
            | 2     | Article to test Related Resources     | Automated Test Article - Feature Card Desc  | /about-cancer/understanding/article | Button Text         | N/A                                                                                 | N/A             | N/A                                                                               | N/A             |
        And NCIDS feature cards have the following attributes
            | index | title                                        | description                                 | link                                | source                                                                                 | file             | srcset                                                                               | srcSetImg        |
            | 0     | Article to test Related Resources            | Automated Test Article - Feature Card Desc  | /about-cancer/understanding/article | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/media_image          | main_image       | /sites/default/files/styles/ncids_featured_4x3/public/cgov_image/media_image         | main_image       |
            | 1     | Override Internal Feature Card Title_Spanish | Override Internal Feature Card Desc_Spanish | /about-cancer/understanding/article | /sites/default/files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | panoramic_image  | /sites/default/files/styles/ncids_featured_4x3/public/cgov_image/ncids_promo_art_4x3 | contextual_image |
            | 2     | Google Link                                  | N/A                                         | https://www.google1.com             | /sites/default/files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9 | /sites/default/files/styles/ncids_featured_4x3/module/cgov_image/img                 | placeholder-4x3  |

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "ncids-home-and-landing-page" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        And browser waits
        When user clicks on the "Delete" button
        And browser waits
        Then the confirmation text "Deleted 2 content items." appears on a screen
        And user clicks on "Media" sub tab
        And user deletes "NCIDS Image" image
        And the image "NCIDS Image" does not exist in the list of content