Feature: NCIDS Mini Landing Page Test Creation of Content continued

    Scenario: User is adding new NCIDS Mini Landing page content type and adding 2 column layout
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
            | fieldLabel               | value                                                           | field_name                     |
            | Pretty URL               | ncids-mini-landing-page-two-column                              | field_pretty_url               |
            | Page Title               | NCIDS Automated Test Mini Landing page 2 Column                 | title                          |
            | Browser Title            | NCIDS Automated Test Mini Landing page 2 Column - Browser Title | field_browser_title            |
            | Card Title               | Automated Test Mini Landing page - Card Title                   | field_card_title               |
            | Meta Description         | Automated Test Mini Landing page Meta Description               | field_page_description         |
            | Feature Card Description | Automated Test Mini Landing page - Feature Card Desc            | field_feature_card_description |
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis elit consequat. Suspendisse sagittis leo eu elit vestibulum, feugiat cursus nisl finibus. Nulla posuere scelerisque velit, et ornare arcu suscipit in. Curabitur ut venenatis nisl.' into 1 HTML Content
        And user selects "Add NCIDS Card Internal" to add to column Right Content
        And browser waits
        And user clicks on "Featured Item" in 1 "NCIDS Card Internal" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And user selects "66/33" as 2 column Layout display
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis elit consequat. Suspendisse sagittis leo eu elit vestibulum, feugiat cursus nisl finibus. Nulla posuere scelerisque velit, et ornare arcu suscipit in. Curabitur ut venenatis nisl.' into 2 HTML Content
        And user selects "Add NCIDS Card External" to add to column Right Content
        And browser waits
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                               |
            | Featured Item Url | https://www.google.com | field_landing_contents[1][subform][field_right_content][0][subform][field_featured_url][0][uri]          |
            | Card Title        | Google Link            | field_landing_contents[1][subform][field_right_content][0][subform][field_override_card_title][0][value] |
        Then user saves the content page
        And browser waits



    Scenario: Add another two column layout with summary box and multimedia card
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user removes the following section
            | fieldLabel          | field_name                                                   |
            | NCIDS Content Block | field_landing_contents_2_subform_field_left_content_0_remove |
        And browser waits
        And user selects "Add NCIDS Summary Box" to add to column Left Content
        And browser waits
        And user fills out "Body" text area with "This is Summary box"
        And user selects "Add NCIDS Card Multimedia" to add to column Right Content
        And user clicks on "Featured Media" in 1 "NCIDS Card Multimedia" section
        And user clicks on "Select media" button item
        And user enters "Test File for Related Resources" into media title search box and clicks "Apply"
        And user selects "Test File for Related Resources" item from the media list
        And user clicks on "Select media" button to select media
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                         | field_name                                                                                                     |
            | Card Title       | Multimedia Feature Card Title | field_landing_contents[2][subform][field_right_content][0][subform][field_override_card_title][0][value]       |
            | Card Description | Multimedia Feature Card Desc  | field_landing_contents[2][subform][field_right_content][0][subform][field_override_card_description][0][value] |
        And user selects "NCIDS Image" as promo image for 3 feature card
        And browser waits for 5000
        Then user saves the content page
        And browser waits

    Scenario: Add two column layout with raw html and content block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user removes the following section
            | fieldLabel          | field_name                                                   |
            | NCIDS Content Block | field_landing_contents_3_subform_field_left_content_0_remove |
        And browser waits
        And user selects "Add Raw Html Content" to add to column Left Content
        And browser waits
        And user enters "<div>This is to test Raw Html Content</div>" into Raw HTML Content text field
        And user selects "Add NCIDS Content Block" to add to column Right Content
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis elit consequat. Suspendisse sagittis leo eu elit vestibulum, feugiat cursus nisl finibus.' into 3 HTML Content
        When user saves the content page
        And browser waits

    Scenario: Add Wide Guide card
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS Wide Guide Card" from "Contents" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                 | field_name                                                            |
            | Title      | Wide Guide Card Title | field_landing_contents[4][subform][field_container_heading][0][value] |
        And user uploads "wgcImage.jpg" as wide guide card image
        And browser waits
        And user fills out WGC description field with "This is WGC description"
        And user selects "Add NCIDS Link Button Internal" to add to WGC
        And browser waits
        And user clicks on "Link" in 1 "Wide Guide Card" section
        And user clicks on Select content button item
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add NCIDS Link Button External" to add to WGC
        And user fills out the following fields
            | fieldLabel        | value                  | field_name                                                                                            |
            | Link              | https://www.google.com | field_landing_contents[4][subform][field_three_link_buttons][1][subform][field_external_link][0][uri] |
            | Link Button Title | WGC Google Link        | field_landing_contents[4][subform][field_three_link_buttons][1][subform][field_button_text][0][value] |
        When user saves the content page
       And browser waits

    Scenario: Create a new video
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "Video" content type
        Then page title is "Add Video"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel        | value                                         | field_name                         |
            | Youtube Video URL | https://www.youtube.com/watch?v=zXE7rexUCeI   | field_media_oembed_video[0][value] |
            | Pretty URL        | test-video                                    | field_pretty_url                   |
            | Name              | NCIDS Automated Test Video                    | name[0][value]                     |
            | Browser Title     | NCIDS Automated Test Video - Browser Title    | field_browser_title                |
            | Meta Description  | NCIDS Automated Test Video - Meta Description | field_page_description             |
        And user types "Test Caption" into Caption text field
        And user selects "Review" from the "Save as" dropdown
        Then user saves the content page
         When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on title with url "test-video" from the list of content
        And user clicks on the tool bar status button "Review"
         And user clicks "Publish" button from Moderation sidebar



    Scenario: Add two column layout with content block and video
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' into 4 HTML Content
        And user selects "Add NCIDS Video" to add to column Right Content
        And user clicks on 1 add "Featured Video" button item
        And user clicks on "Select video" button item
        And user selects "NCIDS Automated Test Video" from the list of media
        And browser waits
        And user clicks on "Select video" button to select media
         And browser waits
        When user saves the content page
        And browser waits

     Scenario: Add two column layout with content block and image
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' into 5 HTML Content
        And user selects "Add NCIDS Image" to add to column Right Content
        And user selects "1x1" from the 1 "Image Crop Display" dropdown
        And user clicks on 5 add "Promotional Image" button item
        And user clicks on 4 "Select Image" button item
        And user selects "NCIDS Image" from the list of images
        And browser waits
        And user clicks on "Select image" button to select media
         And browser waits
        When user saves the content page
        And browser waits

         Scenario: Add two column layout with content block and image 4x3
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' into 6 HTML Content
        And user selects "Add NCIDS Image" to add to column Right Content
        And user selects "4x3" from the 2 "Image Crop Display" dropdown
        And user clicks on 6 add "Promotional Image" button item
        And user clicks on 4 "Select Image" button item
        And user selects "NCIDS Image" from the list of images
        And browser waits
        And user clicks on "Select image" button to select media
         And browser waits
        When user saves the content page
        And browser waits

           Scenario: Add two column layout with content block and image 16:9
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
        And user clicks on the tool bar status button "Draft"
        And user clicks "View in edit form" button from other actions
        And browser waits
        And user selects "Add NCIDS 2 Column Layout" from "Contents" dropdown
        And browser waits
        And user enters 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.' into 7 HTML Content
        And user selects "Add NCIDS Image" to add to column Right Content
        And user selects "16x9" from the 3 "Image Crop Display" dropdown
        And user clicks on 7 add "Promotional Image" button item
        And user clicks on 4 "Select Image" button item
        And user selects "NCIDS Image" from the list of images
        And browser waits
        And user clicks on "Select image" button to select media
         And browser waits
        When user saves the content page
        And browser waits
         And user clicks on the tool bar status button "Draft"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "ncids-mini-landing-page-two-column"
        And there are 8 two column layout sections
        And the sections have the following
            | sectionIndex | splitRatio | columnIndex | type                  | link                             | mediaType  | title | description |
            | 0            | 50:50      | 0           | landing-content-block | none                             | none       |       |             |
            | 0            | 50:50      | 1           | feature-card          | Internal                         | none       |       |             |
            | 1            | 66:33      | 0           | landing-content-block | none                             | none       |       |             |
            | 1            | 66:33      | 1           | feature-card          | External                         | none       |       |             |
            | 2            | 50:50      | 0           | summary-box           | none                             | none       |       |             |
            | 2            | 50:50      | 1           | feature-card          | Media                            | none       |       |             |
            | 3            | 50:50      | 0           | rawHtml               | This is to test Raw Html Content | none       |       |             |
            | 3            | 50:50      | 1           | landing-content-block | none                             | none       |       |             |
            | 4            | 50:50      | 0           | landing-content-block | none                             | none       |       |             |
            | 4            | 50:50      | 1           | none                  | none                             | cgdp-video |       |             |
            | 5            | 50:50      | 0           | landing-content-block | none                             | none       |       |             |
            | 5            | 50:50      | 1           | none                  | none                             | cgdp-image |       |             |
            | 6            | 50:50      | 0           | landing-content-block | none                             | none       |       |             |
            | 6            | 50:50      | 1           | none                  | none                             | cgdp-image |       |             |
            | 7            | 50:50      | 0           | landing-content-block | none                             | none       |       |             |
            | 7            | 50:50      | 1           | none                  | none                             | cgdp-image |       |             |

        And the video caption reads "Test Caption"
        And the following image overrides are displayed on two column layout items
            | sectionIndex | columnIndex | imageCrop | source                                                                                                                              | caption      | credit      |
            | 5            | 1           | 1:1       | (\/sites\/default\/files\/styles\/ncids_image_para_1x1\/public\/cgov_image\/ncids_promo_art_1x1\/\d*-\d*\/thumbnail_image.*.jpg)$   | Test Caption | Test Credit |
            | 6            | 1           | 4:3       | (\/sites\/default\/files\/styles\/ncids_image_para_4x3\/public\/cgov_image\/ncids_promo_art_4x3\/\d*-\d*\/contextual_image.*.jpeg)$ | Test Caption | Test Credit |
            | 7            | 1           | 16:9      | (\/sites\/default\/files\/styles\/ncids_image_para_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d*-\d*\/panoramic_image.*.jpg)$ | Test Caption | Test Credit |
        And there are the following wide guide cards
            | index | title                 | description             | numberOfLinks | source                                                                                                                                   |
            | 0     | Wide Guide Card Title | This is WGC description | 2             | (\/sites\/default\/files\/styles\/ncids_guide_card_1x1\/public\/ncids_wide_guide_card\/field_image_guide_card\/\d*-\d*\/wgcImage.*.jpg)$ |
        When user clicks on "/about-cancer/understanding/article" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                              |
            | prop4     | D=pev1                                             |
            | prop8     | english                                            |
            | prop57    | D=v64                                              |
            | prop58    | D=v65                                              |
            | prop59    | D=v66                                              |
            | prop60    | D=c67                                              |
            | prop67    | D=pageName                                         |
            | prop68    | D=v68                                              |
            | evar2     | D=c8                                               |
            | evar61    | cgvMiniLanding\|ncids_default                      |
            | evar64    | Internal\|Article to test Related Resources\|Image |
            | evar65    | Feature Card\|Light\|Standard Single Link          |
            | evar66    | 9\|1\|2\|2\|1\|1\|TwoColumn50:50                   |
            | evar67    | Image\|1\|1                                        |
            | evar68    | Body                                               |
            | event112  |                                                    |
            | channel   | About Cancer                                       |
            | pev2      | MLP:FeatureCard:LinkClick                          |
            | linkType  | lnk_o                                              |

    Scenario: Translate created video
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        Then user selects "Translate" option from Operations dropdown for media with title "NCIDS Automated Test Video"
        Then the page title is "Translations of NCIDS Automated Test Video"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de NCIDS Automated Test Video"
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value                    | field_name       |
            | Pretty URL | ncids-test-video-spanish | field_pretty_url |
            | Nombre     | _Spanish                 | name[0][value]   |
        And user types "_Spanish" into Caption text field
        And user selects "Review" from Change to dropdown
        Then user saves the content page

     Scenario: Publish translated video
            Given user is navigating to "/user/login?show_login_fields=true"
            When user enters credentials of "editor"
            And user clicks "Log in" button
            Then user is logged in and the user name "editor" is displayed in the toolbar
            And the tool bar appears at the top
             When user clicks on "Content" tab
             And user clicks on "Media" sub tab
            Then user selects "Translate" option from Operations dropdown for media with title "NCIDS Automated Test Video"
            When user clicks on "Edit" button to edit translation
            And user selects "Publicado" from Change to dropdown
            Then user saves the content page
            And browser waits

    Scenario: Add a translation
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "NCIDS Automated Test Mini Landing page 2 Column"
        Then the page title is "Translations of NCIDS Automated Test Mini Landing page 2 Column"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de NCIDS Automated Test Mini Landing page 2 Column"
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value    | field_name                                                                                                     |
            | Card Title       | _Spanish | field_landing_contents[2][subform][field_right_content][0][subform][field_override_card_title][0][value]       |
            | Card Description | _Spanish | field_landing_contents[2][subform][field_right_content][0][subform][field_override_card_description][0][value] |
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publicar" from workflow actions

    Scenario: Verify spanish content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "ncids-mini-landing-page-two-column"
        And there are 8 two column layout sections
        And the sections have the following
            | sectionIndex | splitRatio | columnIndex | type                  | link                             | mediaType  | title                                 | description                          |
            | 0            | 50:50      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 0            | 50:50      | 1           | feature-card          | Internal                         | none       |                                       |                                      |
            | 1            | 66:33      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 1            | 66:33      | 1           | feature-card          | External                         | none       |                                       |                                      |
            | 2            | 50:50      | 0           | summary-box           | none                             | none       |                                       |                                      |
            | 2            | 50:50      | 1           | feature-card          | Media                            | none       | Multimedia Feature Card Title_Spanish | Multimedia Feature Card Desc_Spanish |
            | 3            | 50:50      | 0           | rawHtml               | This is to test Raw Html Content | none       |                                       |                                      |
            | 3            | 50:50      | 1           | landing-content-block | none                             | none       |                                       |                                      |
            | 4            | 50:50      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 4            | 50:50      | 1           | none                  | none                             | cgdp-video |                                       |                                      |
            | 5            | 50:50      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 5            | 50:50      | 1           | none                  | none                             | cgdp-image |                                       |                                      |
            | 6            | 50:50      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 6            | 50:50      | 1           | none                  | none                             | cgdp-image |                                       |                                      |
            | 7            | 50:50      | 0           | landing-content-block | none                             | none       |                                       |                                      |
            | 7            | 50:50      | 1           | none                  | none                             | cgdp-image |                                       |                                      |
        And the video caption reads "Test Caption_Spanish"
        And the following image overrides are displayed on two column layout items
            | sectionIndex | columnIndex | imageCrop | source                                                                                                                              | caption      | credit               |
            | 5            | 1           | 1:1       | (\/sites\/default\/files\/styles\/ncids_image_para_1x1\/public\/cgov_image\/ncids_promo_art_1x1\/\d*-\d*\/thumbnail_image.*.jpg)$   | Test Caption | Fuente:\|Test Credit |
            | 6            | 1           | 4:3       | (\/sites\/default\/files\/styles\/ncids_image_para_4x3\/public\/cgov_image\/ncids_promo_art_4x3\/\d*-\d*\/contextual_image.*.jpeg)$ | Test Caption | Fuente:\|Test Credit |
            | 7            | 1           | 16:9      | (\/sites\/default\/files\/styles\/ncids_image_para_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d*-\d*\/panoramic_image.*.jpg)$ | Test Caption | Fuente:\|Test Credit |
        And there are the following wide guide cards
            | index | title                 | description             | numberOfLinks | source                                                                                                                                   |
            | 0     | Wide Guide Card Title | This is WGC description | 2             | (\/sites\/default\/files\/styles\/ncids_guide_card_1x1\/public\/ncids_wide_guide_card\/field_image_guide_card\/\d*-\d*\/wgcImage.*.jpg)$ |


Scenario: Clean up
    Given user is navigating to "/user/login?show_login_fields=true"
    When user enters credentials of "editor"
    And user clicks "Log in" button
    Then user is logged in and the user name "editor" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    And user clicks on title with url spanish path "/espanol" site section plus "ncids-mini-landing-page-two-column"
    And user clicks on the tool bar status button "Publicado"
    And user clicks "Request Archive" button from Moderation sidebar
    And user clicks on the tool bar status button "Archive Requested"
    And user clicks "Approve Archive Request" button from Moderation sidebar
    And user clicks on the tool bar status button "Archivado"
    And user clicks "View in edit form" button from other actions
    When user clicks on "Delete" option button
    When user confirms "Borrar la traduccion Español" action

    When user clicks on "Contenido" tab
    And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
    And user clicks on the tool bar status button "Published"
    And user clicks "Request Archive" button from Moderation sidebar
    And user clicks on the tool bar status button "Archive Requested"
    And user clicks "Approve Archive Request" button from Moderation sidebar
    And user clicks on the tool bar status button "Archived"
    And user clicks "View in edit form" button from other actions
    When user clicks on "Delete" option button
    Then user confirms "Delete" action
  
  When user clicks on "Content" tab
     And user clicks on "Media" sub tab
        And user selects a checkbox next to title with url "test-video" from the list of content
        And user selects a checkbox next to the title with spanish path "/espanol" with url "ncids-test-video-spanish" from the list of content
        And user selects "Delete media" action
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this media item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 2 items." appears on a screen
        And the content item with url "test-video" does not exist in the list of content
        And the content item with url "test-video-spanish" does not exist in the list of content

