Feature: As a cms user I want to be able to create Cancer Type Homepage content type to promote Cancer Type Homepage

    Scenario: User is adding new Cancer Type Homepage content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Cancer Type Homepage" content type
        Then page title is "Create Cancer Type Homepage"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                   | field_name                     |
            | Pretty URL               | cancer-type-homepage                                    | field_pretty_url               |
            | Page Title               | Automated Test Cancer Type Homepage Patient             | title                          |
            | Browser Title            | Automated Test Cancer Type Homepage - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Cancer Type Homepage - Card Title        | field_card_title               |
            | Meta Description         | Automated Cancer Type Homepage Meta Description         | field_page_description         |
            | Feature Card Description | Automated Test Cancer Type Homepage - Feature Card Desc | field_feature_card_description |
        And user enters "Cancer Type Homepage List Description" into "List Description" text field
        And user selects "Add CTHP Overview Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value         | field_name                                          |
            | CTHP Card Title | Test Overview | field_cthp_cards[0][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Overview" from CTHP Card Theme dropdown number 1
        And browser waits
        And user fills out Overview Card Text field text area with "Description of Overview Card of CTHP content type"
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        Then user saves the content page

    Scenario: Adding guide card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Guide Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value          | field_name                                          |
            | CTHP Card Title | Test Treatment | field_cthp_cards[1][subform][field_cthp_card_title] |
        And user selects "Treatment" from CTHP Card Theme dropdown number 2
        And user fills out CTHP Guide Card Description field text area with "Description of Guide Card of CTHP content type"
        And browser waits
        And user fills out the following fields under "PDQ Link Heading" section
            | fieldLabel       | value                                  | field_name                                                          |
            | PDQ Link Heading | PDQ Treatment Information for Patients | field_cthp_cards[1][subform][field_cthp_pdq_link_heading][0][value] |
        And browser waits
        And user clicks on "PDQ Links" link in the "CTHP Guide Card" text area
        And user clicks on "Select summary" button from "CTHP Guide Card" text area
        And user filters summaries list by "English" language and clicks on "Apply" button
        And browser waits
        And user selects 1 PDQ Summary from the list of summaries
        And browser waits
        And user clicks on "Select summary" button to select item
        And browser waits
        And user remembers the title of selected summary for further verification
        And user selects "Add Internal Link" from "View More Information" dropdown
        And browser waits
        And user clicks on "Link" link in the Internal Link text area
        And browser waits
        And user clicks on "Select content" button from "Internal Link" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add External Link" from "View More Information" dropdown
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                  | field_name                                                                                          |
            | Link       | https://www.google.com | field_cthp_cards[1][subform][field_cthp_view_more_info][1][subform][field_external_link][0][uri]    |
            | Title      | Google Link Guide Card | field_cthp_cards[1][subform][field_cthp_view_more_info][1][subform][field_override_title][0][value] |
        And user selects "Add Media Link" from "View More Information" CTHP dropdown
        And browser waits
        Then "Media Link" section appears
        And user clicks on "Link" link in the "External Link" text area
        And user clicks on "Select media" to choose a resource to link
        And user selects "Test File for Related Resources" item from the media list
        And browser waits
        And user clicks on "Select media" button to select item
        And user fills out the following fields
            | fieldLabel     | value                                 | field_name                                                                                          |
            | Override Title | Media Link Override Title Guide cards | field_cthp_cards[1][subform][field_cthp_view_more_info][2][subform][field_override_title][0][value] |
        And browser waits for 2000
        Then user saves the content page
        And browser waits for 2000

    Scenario: Adding Internal Feature card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Internal Feature Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value                    | field_name                                          |
            | CTHP Card Title | Test Causes & Prevention | field_cthp_cards[2][subform][field_cthp_card_title] |
        And user selects "Causes & Prevention" from CTHP Card Theme dropdown number 3
        And browser waits
        And user clicks on "Featured Content" link in the "CTHP Internal Feature Card" text area
        And user clicks on "Select content" button from "CTHP Internal Feature Card" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And user fills out the following fields
            | fieldLabel                | value                             | field_name                                                    |
            | Override Card Description | Article to test Related Resources | field_cthp_cards[2][subform][field_cthp_override_description] |
        And browser waits for 2000
        Then user saves the content page
        And browser waits for 2000

    Scenario: Adding External feature card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP External Feature Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value           | field_name                                          |
            | CTHP Card Title | Test Statistics | field_cthp_cards[3][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Survival Rates & Prognosis" from CTHP Card Theme dropdown number 4
        And browser waits
        And user fills out the following fields
            | fieldLabel                | value                                      | field_name                                                    |
            | External Link             | https://www.google1.com                    | field_cthp_cards[3][subform][field_cthp_featured_url]         |
            | Override Card Description | Override Card Desc - External Feature Card | field_cthp_cards[3][subform][field_cthp_override_description] |
        And browser waits
        Then user saves the content page

    Scenario: Adding video card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Video Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value           | field_name                                          |
            | CTHP Card Title | Test Video Card | field_cthp_cards[4][subform][field_cthp_card_title] |
        And user selects "Screening" from CTHP Card Theme dropdown number 5
        And browser waits
        And user clicks on "Video" link in the "CTHP Video Card" text area
        And user clicks on "Select video" button from "CTHP Video Card" text area
        And user selects 1 Video from the list of videos
        And user clicks on "Select video" button to select item
        And user remembers the title of selected video for further verification
        And browser waits
        And user selects "Add Internal Link" from "Target URL" dropdown "Target URL" section
        And browser waits for 2000
        And user clicks on "Link" link in the Internal Link text area
        And browser waits
        And user clicks on "Select content" button from "Internal Link" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        Then user saves the content page

    Scenario: Adding research card
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Research Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value         | field_name                                          |
            | CTHP Card Title | Test Research | field_cthp_cards[5][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Research" from CTHP Card Theme dropdown number 6
        And browser waits
        And user clicks on "Research Page" link in the "CTHP Research Card" text area
        And browser waits
        And user clicks on "Select content" button from "CTHP Research Card" text area
        And browser waits
        And user types "Breast Cancer Research" into title field search area
        And browser waits
        And user clicks on "Select content" button to select item
        And user remembers title of selected Cancer Research List Page for future verification
        And browser waits
        Then user saves the content page

    Scenario: Adding block and raw html cards
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Block Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value           | field_name                                          |
            | CTHP Card Title | Test Block Card | field_cthp_cards[6][subform][field_cthp_card_title] |
        And user selects "General Resources on Coping" from CTHP Card Theme dropdown number 7
        And browser waits
        And user types "coping" in the autosuggest field of "CTHP Block Card Content" card area
        And browser waits
        When user selects 1 result from the list of autosuggest
        And user selects "Add CTHP Raw HTML Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value              | field_name                                          |
            | CTHP Card Title | Test Raw HTML Card | field_cthp_cards[7][subform][field_cthp_card_title] |
        And user selects "Genetics" from CTHP Card Theme dropdown number 8
        And browser waits
        And user clicks on Source tool icon in the html content tool bar
        And browser waits
        And user enters "<div>This is to test Raw Html Content in CTHP Raw HTML Card</div>" into source text field
        And user selects "Include in search" from Search Engine Restrictions dropdown
        And user selects "Published" from draft "Current state" dropdown
        When user saves the content page

    #----- Cancer Type Home Page front end verification starts from below------#
    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "cancer-type-homepage"
        And page title is "Automated Test Cancer Type Homepage Patient"
        And the following cards are displayed
            | title                    | cardType       |
            | Test Overview            | cthp-overview  |
            | Test Treatment           | cthp-treatment |
            | Test Causes & Prevention | cthp-causes    |
            | Test Statistics          | cthp-survival  |
            | Test Video Card          | cthp-screening |
            | Test Research            | cthp-research  |
            | Test Block Card          | cthp-general   |
            | Test Raw HTML Card       | cthp-genetics  |
        And cthp overview card has description "Description of Overview Card of CTHP content type"
        And PDQ link label reads "PDQ Treatment Information for Patients"
        Then the PDQ link is matching the earlier selected PDQ link
        When user clicks on "View more information" dropdown
        And browser waits
        Then the following more info links are displayed
            | title                                 | url                           |
            | Article to test Related Resources     | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                | https://www.google.com        |
            | Media Link Override Title Guide cards | {TEST_SITE_SECTION}/test-file |
        And cthp causes card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp survival card has a link "Override Card Desc - External Feature Card" with href "https://www.google1.com"
        Then the video is matching the earlier selected video
        And cthp screening card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp general card has description that is not empty
        And cthp general card has multiple links
        And cthp genetics card reads "This is to test Raw Html Content in CTHP Raw HTML Card"
        And cthp research card has multiple links
        Then user clicks "View more research" link inside cthp research card
        Then the Cancer Research List page title is matching the earlier selected Cancer Research List page title

    Scenario: Edit and republish Cancer Type Homepage content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Meta Description" field
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                                       | field_name                                                                                          |
            | Pretty URL       | cancer-type-homepage-Edited                                 | field_pretty_url                                                                                    |
            | Meta Description | Automated Test Cancer Type Homepage Meta Description Edited | field_page_description                                                                              |
            | CTHP Card Title  | Edited                                                      | field_cthp_cards[0][subform][field_cthp_card_title]                                                 |
            | CTHP Card Title  | Edited                                                      | field_cthp_cards[1][subform][field_cthp_card_title]                                                 |
            | PDQ Link Heading | Edited                                                      | field_cthp_cards[1][subform][field_cthp_pdq_link_heading][0][value]                                 |
            | Override Title   | Edited                                                      | field_cthp_cards[1][subform][field_cthp_view_more_info][2][subform][field_override_title][0][value] |
        And browser waits
        And user removes Video from "CTHP Video Card" card area
        And browser waits
        And user clicks on "Video" link in the "CTHP Video Card" text area
        And browser waits
        And user clicks on "Select video" to choose a resource to link
        And user filters published list by "True" and clicks "Apply" button
        And browser waits
        And user selects 2 Video from the list of main page videos
        And browser waits
        And user clicks on "Select video" button to select item
        And browser waits
        And user remembers the title of selected video for further verification
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "cancer-type-homepage-edited"
        Then page title is "Automated Test Cancer Type Homepage Patient"
        And the page contains meta tags with the following names
            | name        | content                                                     |
            | description | Automated Test Cancer Type Homepage Meta Description Edited |
        And the following cards are displayed
            | title                | cardType       |
            | Test OverviewEdited  | cthp-overview  |
            | Test TreatmentEdited | cthp-treatment |
        And cthp overview card has description "Description of Overview Card of CTHP content type"
        And PDQ link label reads "PDQ Treatment Information for PatientsEdited"
        When user clicks on "View more information" dropdown
        Then the following more info links are displayed
            | title                                       | url                           |
            | Article to test Related Resources           | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                      | https://www.google.com        |
            | Media Link Override Title Guide cardsEdited | {TEST_SITE_SECTION}/test-file |
        Then the video is matching the earlier selected video

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
        And user selects "Automated Test Cancer Type Homepage Patient" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Cancer Type Homepage Patient" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with the path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Cancer Type Homepage - Card Title" with href "/about-cancer/understanding/cancer-type-homepage-edited"
        And feature card description reads "Automated Test Cancer Type Homepage - Feature Card Desc"

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

    Scenario: Add a translation
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Cancer Type Homepage Patient"
        Then the page title is "Translations of Automated Test Cancer Type Homepage Patient"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Cancer Type Homepage Patient"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And "List Description" label is displayed
        And Current Page Audience dropdown has the following values
            | option              |
            | Patient             |
            | Health Professional |
        And "Audience Toggle Link" is present
        And the following cards fields are displayed with remove button translated as "Eliminar"
            | card                       |
            | CTHP Overview Card         |
            | CTHP Guide Card            |
            | CTHP Internal Feature Card |
            | CTHP External Feature Card |
            | CTHP Video Card            |
            | CTHP Research Card         |
            | CTHP Block Card            |
            | CTHP Raw HTML Card         |
        And Add Card Section was translated as "Añadir CTHP Overview Card"
        And dropdown to add link under related resources was translated to start with "Añadir"
        And "Search Engine Restrictions" dropdown displays "Include in search"
        And current state was translated as "Estado actual" "Borrador"
        And Change to dropdown has the following options
            | option    |
            | Borrador  |
            | Review    |
            | Publicado |
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        And user remembers the title of selected summary for further verification
        And user remembers the title of selected video for further verification
        And user remembers title of selected Cancer Research List Page for future verification
        Then user saves the content page
        And user clicks on the tool bar status green button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify translated content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "cancer-type-homepage-edited"
        Then page title is "Automated Test Cancer Type Homepage Patient"
        And the following cards are displayed
            | title                    | cardType       |
            | Test Overview            | cthp-overview  |
            | Test Treatment           | cthp-treatment |
            | Test Causes & Prevention | cthp-causes    |
            | Test Statistics          | cthp-survival  |
            | Test Video Card          | cthp-screening |
            | Test Research            | cthp-research  |
            | Test Block Card          | cthp-general   |
            | Test Raw HTML Card       | cthp-genetics  |
        And cthp overview card has description "Description of Overview Card of CTHP content type"
        And PDQ link label reads "PDQ Treatment Information for PatientsEdited"
        Then the PDQ link is matching the earlier selected PDQ link
        When user clicks on "Vea más información" dropdown
        And browser waits
        Then the following more info links are displayed
            | title                                 | url                           |
            | Article to test Related Resources     | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                | https://www.google.com        |
            | Media Link Override Title Guide cards | {TEST_SITE_SECTION}/test-file |
        And cthp causes card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp survival card has a link "Override Card Desc - External Feature Card" with href "https://www.google1.com"
        Then the video is matching the earlier selected video
        And cthp screening card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp general card has description that is not empty
        And the following cards have multiple spanish links that start with "/espanol"
            | cardType      |
            | cthp-research |
            | cthp-general  |
        And cthp genetics card reads "This is to test Raw Html Content in CTHP Raw HTML Card"
        Then user clicks "Ver más investigaciones" link inside cthp research card
        Then the Cancer Research List page title is matching the earlier selected Cancer Research List page title

    Scenario: Edit and republish Spanish CTHP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "cancer-type-homepage-edited"
        And user clicks on the tool bar status green button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                               | field_name             |
            | Título de página | Automated Test CTHP Edited Spanish                  | title                  |
            | Meta Description | Automated Test CTHP Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify Spanish edited CTHP content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "cancer-type-homepage-edited"
        Then page title is "Automated Test CTHP Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                             |
            | description | Automated Test CTHP Meta Description Edited Spanish |

    Scenario: User is adding new Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Cancer Type Homepage" content type
        Then page title is "Create Cancer Type Homepage"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                      | field_name                     |
            | Pretty URL               | cancer-type-homepage-hp                                    | field_pretty_url               |
            | Page Title               | Automated Test Cancer Type Homepage HP                     | title                          |
            | Browser Title            | Automated Test Cancer Type Homepage HP - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Cancer Type Homepage HP - Card Title        | field_card_title               |
            | Meta Description         | Automated Cancer Type Homepage HP Meta Description         | field_page_description         |
            | Feature Card Description | Automated Test Cancer Type Homepage HP - Feature Card Desc | field_feature_card_description |
        And user enters "Automated Cancer Type Homepage HP List Description" into "List Description" text field
        And user selects "Health Professional" from Current Page Audience dropdown
        And user clicks on "Audience Toggle Link" link
        And user clicks on "Select content" button item
        And user selects "Automated Test Cancer Type Homepage Patient" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Cancer Type Homepage Patient" had been selected
        And user selects "Add CTHP Overview Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value            | field_name                                          |
            | CTHP Card Title | Test Overview HP | field_cthp_cards[0][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Overview" from CTHP Card Theme dropdown number 1
        And browser waits
        And user fills out Overview Card Text field text area with "Description of Overview Card of CTHP HP content type"
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Include in search" from Search Engine Restrictions dropdown
        Then user saves the content page

    Scenario: Adding guide card Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Guide Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value             | field_name                                          |
            | CTHP Card Title | Test Treatment HP | field_cthp_cards[1][subform][field_cthp_card_title] |
        And user selects "Treatment" from CTHP Card Theme dropdown number 2
        And user fills out CTHP Guide Card Description field text area with "Description of Guide Card of CTHP HP content type"
        And browser waits
        And user fills out the following fields under "PDQ Link Heading" section
            | fieldLabel       | value                            | field_name                                                          |
            | PDQ Link Heading | PDQ Treatment Information for HP | field_cthp_cards[1][subform][field_cthp_pdq_link_heading][0][value] |
        And browser waits
        And user clicks on "PDQ Links" link in the "CTHP Guide Card" text area
        And user clicks on "Select summary" button from "CTHP Guide Card" text area
        And user filters summaries list by "English" language and clicks on "Apply" button
        And browser waits
        And user selects 1 PDQ Summary from the list of summaries
        And browser waits
        And user clicks on "Select summary" button to select item
        And browser waits
        And user remembers the title of selected summary for further verification
        And user selects "Add Internal Link" from "View More Information" dropdown
        And browser waits
        And user clicks on "Link" link in the Internal Link text area
        And browser waits
        And user clicks on "Select content" button from "Internal Link" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user selects "Add External Link" from "View More Information" dropdown
        And browser waits for 2000
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                  | field_name                                                                                          |
            | Link       | https://www.google.com | field_cthp_cards[1][subform][field_cthp_view_more_info][1][subform][field_external_link][0][uri]    |
            | Title      | Google Link Guide Card | field_cthp_cards[1][subform][field_cthp_view_more_info][1][subform][field_override_title][0][value] |
        And user selects "Add Media Link" from "View More Information" CTHP dropdown
        And browser waits
        Then "Media Link" section appears
        And user clicks on "Link" link in the "External Link" text area
        And user clicks on "Select media" to choose a resource to link
        And user selects "Test File for Related Resources" item from the media list
        And browser waits
        And user clicks on "Select media" button to select item
        And user fills out the following fields
            | fieldLabel     | value                                    | field_name                                                                                          |
            | Override Title | Media Link Override Title Guide cards HP | field_cthp_cards[1][subform][field_cthp_view_more_info][2][subform][field_override_title][0][value] |
        Then user saves the content page

    Scenario: Adding Internal Feature card Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Internal Feature Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value                       | field_name                                          |
            | CTHP Card Title | Test Causes & Prevention HP | field_cthp_cards[2][subform][field_cthp_card_title] |
        And user selects "Causes & Prevention" from CTHP Card Theme dropdown number 3
        And browser waits
        And user clicks on "Featured Content" link in the "CTHP Internal Feature Card" text area
        And user clicks on "Select content" button from "CTHP Internal Feature Card" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And user fills out the following fields
            | fieldLabel                | value                             | field_name                                                    |
            | Override Card Description | Article to test Related Resources | field_cthp_cards[2][subform][field_cthp_override_description] |
        Then user saves the content page

    Scenario: Adding External feature card Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP External Feature Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value              | field_name                                          |
            | CTHP Card Title | Test Statistics HP | field_cthp_cards[3][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Survival Rates & Prognosis" from CTHP Card Theme dropdown number 4
        And browser waits
        And user fills out the following fields
            | fieldLabel                | value                                         | field_name                                                    |
            | External Link             | https://www.google1.com                       | field_cthp_cards[3][subform][field_cthp_featured_url]         |
            | Override Card Description | Override Card Desc HP - External Feature Card | field_cthp_cards[3][subform][field_cthp_override_description] |
        And browser waits
        Then user saves the content page

    Scenario: Adding video card Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Video Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value              | field_name                                          |
            | CTHP Card Title | Test Video Card HP | field_cthp_cards[4][subform][field_cthp_card_title] |
        And user selects "Screening" from CTHP Card Theme dropdown number 5
        And browser waits
        And user clicks on "Video" link in the "CTHP Video Card" text area
        And user clicks on "Select video" button from "CTHP Video Card" text area
        And user selects 1 Video from the list of videos
        And user clicks on "Select video" button to select item
        And user remembers the title of selected video for further verification
        And browser waits
        And user selects "Add Internal Link" from "Target URL" dropdown "Target URL" section
        And browser waits
        And user clicks on "Link" link in the Internal Link text area
        And browser waits
        And user clicks on "Select content" button from "Internal Link" text area
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        Then user saves the content page

    Scenario: Adding research card Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Research Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value            | field_name                                          |
            | CTHP Card Title | Test Research HP | field_cthp_cards[5][subform][field_cthp_card_title] |
        And browser waits
        And user selects "Research" from CTHP Card Theme dropdown number 6
        And browser waits
        And user clicks on "Research Page" link in the "CTHP Research Card" text area
        And browser waits
        And user clicks on "Select content" button from "CTHP Research Card" text area
        And browser waits
        And user types "Breast Cancer Research" into title field search area
        And browser waits
        And user clicks on "Select content" button to select item
        And user remembers title of selected Cancer Research List Page for future verification
        And browser waits
        Then user saves the content page

    Scenario: Adding block and raw html cards Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user selects "Add CTHP Block Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value              | field_name                                          |
            | CTHP Card Title | Test Block Card HP | field_cthp_cards[6][subform][field_cthp_card_title] |
        And user selects "General Resources on Coping" from CTHP Card Theme dropdown number 7
        And browser waits
        And user types "coping" in the autosuggest field of "CTHP Block Card Content" card area
        And browser waits
        When user selects 1 result from the list of autosuggest
        And user selects "Add CTHP Raw HTML Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value                 | field_name                                          |
            | CTHP Card Title | Test Raw HTML Card HP | field_cthp_cards[7][subform][field_cthp_card_title] |
        And user selects "Genetics" from CTHP Card Theme dropdown number 8
        And browser waits
        And user clicks on Source tool icon in the html content tool bar
        And browser waits
        And user enters "<div>This is to test Raw Html Content in CTHP Raw HTML Card</div>" into source text field
        And user selects "Include in search" from Search Engine Restrictions dropdown
        And user selects "Published" from draft "Current state" dropdown
        When user saves the content page

   Scenario: Adding Patient/HP Toggle to Cancer Type Homepage Patient content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-edited" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        # And user clicks on "Audience Toggle Link" link
        And user clicks on "Select content" button item
        And user selects "Automated Test Cancer Type Homepage HP" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Cancer Type Homepage HP" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions
       
#----- Cancer Type Home Page HP front end verification starts from below------#
    Scenario: Verify newly created Cancer Type Homepage HP content
        Given user is navigating to the front end site with path site section plus "cancer-type-homepage-hp"
        And page title is "Automated Test Cancer Type Homepage HP"
        And the following cards are displayed
            | title                       | cardType       |
            | Test Overview HP            | cthp-overview  |
            | Test Treatment HP           | cthp-treatment |
            | Test Causes & Prevention HP | cthp-causes    |
            | Test Statistics HP          | cthp-survival  |
            | Test Video Card HP          | cthp-screening |
            | Test Research HP            | cthp-research  |
            | Test Block Card HP          | cthp-general   |
            | Test Raw HTML Card HP       | cthp-genetics  |
        And cthp overview card has description "Description of Overview Card of CTHP HP content type"
        And PDQ link label reads "PDQ Treatment Information for HP"
        Then the PDQ link is matching the earlier selected PDQ link
        When user clicks on "View more information" dropdown
        And browser waits
        Then the following more info links are displayed
            | title                                    | url                           |
            | Article to test Related Resources        | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                   | https://www.google.com        |
            | Media Link Override Title Guide cards HP | {TEST_SITE_SECTION}/test-file |
        And cthp causes card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp survival card has a link "Override Card Desc HP - External Feature Card" with href "https://www.google1.com"
        Then the video is matching the earlier selected video
        And cthp screening card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp general card has description that is not empty
        And cthp general card has multiple links
        And cthp genetics card reads "This is to test Raw Html Content in CTHP Raw HTML Card"
        And cthp research card has multiple links
        Then user clicks "View more research" link inside cthp research card
        Then the Cancer Research List page title is matching the earlier selected Cancer Research List page title

    Scenario: Edit and republish Cancer Type Homepage HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-type-homepage-hp" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Meta Description" field
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                                     | field_name                                                                                          |
            | Pretty URL       | cancer-type-homepage-hp-Edited                            | field_pretty_url                                                                                    |
            | Meta Description | Automated Cancer Type Homepage HP Meta Description Edited | field_page_description                                                                              |
            | CTHP Card Title  | Edited                                                    | field_cthp_cards[0][subform][field_cthp_card_title]                                                 |
            | CTHP Card Title  | Edited                                                    | field_cthp_cards[1][subform][field_cthp_card_title]                                                 |
            | PDQ Link Heading | Edited                                                    | field_cthp_cards[1][subform][field_cthp_pdq_link_heading][0][value]                                 |
            | Override Title   | Edited                                                    | field_cthp_cards[1][subform][field_cthp_view_more_info][2][subform][field_override_title][0][value] |
        And browser waits
        And user removes Video from "CTHP Video Card" card area
        And browser waits
        And user clicks on "Video" link in the "CTHP Video Card" text area
        And browser waits
        And user clicks on "Select video" to choose a resource to link
        And user filters published list by "True" and clicks "Apply" button
        And browser waits
        And user selects 2 Video from the list of main page videos
        And browser waits
        And user clicks on "Select video" button to select item
        And browser waits
        And user remembers the title of selected video for further verification
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited Cancer Type Homepage HP content
        Given user is navigating to the front end site with path site section plus "cancer-type-homepage-hp-edited"
        Then page title is "Automated Test Cancer Type Homepage HP"
        And the "Go to Patient Version" link is displayed with href "/about-cancer/understanding/cancer-type-homepage-edited"
        And the page contains meta tags with the following names
            | name        | content                                                   |
            | description | Automated Cancer Type Homepage HP Meta Description Edited |
        And the following cards are displayed
            | title                   | cardType       |
            | Test Overview HPEdited  | cthp-overview  |
            | Test Treatment HPEdited | cthp-treatment |
        And cthp overview card has description "Description of Overview Card of CTHP HP content type"
        And PDQ link label reads "PDQ Treatment Information for HPEdited"
        When user clicks on "View more information" dropdown
        Then the following more info links are displayed
            | title                                           | url                           |
            | Article to test Related Resources               | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                          | https://www.google.com        |
            | Media Link Override Title Guide cards HPEdited  | {TEST_SITE_SECTION}/test-file |
        Then the video is matching the earlier selected video

    Scenario: Verify the Patient/HP toggle in Cancer Type Homepage Patient content
        Given user is navigating to the front end site with path site section plus "cancer-type-homepage-edited"
        And page title is "Automated Test Cancer Type Homepage Patient"
        And the "Go to Health Professional Version" link is displayed with href "/about-cancer/understanding/cancer-type-homepage-hp-edited"

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
        And user selects "Automated Test Cancer Type Homepage HP" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Cancer Type Homepage HP" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with the path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Cancer Type Homepage HP - Card Title" with href "/about-cancer/understanding/cancer-type-homepage-hp-edited"
        And feature card description reads "Automated Test Cancer Type Homepage HP - Feature Card Desc"

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

    Scenario: Add a translation to Cancer Type Homepage HP content
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Cancer Type Homepage HP"
        Then the page title is "Translations of Automated Test Cancer Type Homepage HP"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Automated Test Cancer Type Homepage HP"
        And the following fields are displayed
            | fieldLabel               | field_name                     |
            | Pretty URL               | field_pretty_url               |
            | Título de página         | title                          |
            | Browser Title            | field_browser_title            |
            | Card Title               | field_card_title               |
            | Meta Description         | field_page_description         |
            | Feature Card Description | field_feature_card_description |
        And "List Description" label is displayed
        And Current Page Audience dropdown has the following values
            | option              |
            | Patient             |
            | Health Professional |
        And "Audience Toggle Link" is present
        And the following cards fields are displayed with remove button translated as "Eliminar"
            | card                       |
            | CTHP Overview Card         |
            | CTHP Guide Card            |
            | CTHP Internal Feature Card |
            | CTHP External Feature Card |
            | CTHP Video Card            |
            | CTHP Research Card         |
            | CTHP Block Card            |
            | CTHP Raw HTML Card         |
        And Add Card Section was translated as "Añadir CTHP Overview Card"
        And dropdown to add link under related resources was translated to start with "Añadir"
        And "Search Engine Restrictions" dropdown displays "Include in search"
        And current state was translated as "Estado actual" "Borrador"
        And Change to dropdown has the following options
            | option    |
            | Borrador  |
            | Review    |
            | Publicado |
        And Save button was translated as "Guardar (esta traducción)"
        And preview button was translated as "Vista previa"
        And user remembers the title of selected summary for further verification
        And user remembers the title of selected video for further verification
        And user remembers title of selected Cancer Research List Page for future verification
        Then user saves the content page
        And user clicks on the tool bar status green button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify translated Cancer Type Homepage HP content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "cancer-type-homepage-hp-edited"
        Then page title is "Automated Test Cancer Type Homepage HP"
        And the "Vaya a la versión para pacientes" link is displayed with href "/espanol/about-cancer/understanding/cancer-type-homepage-edited"
        And the following cards are displayed
            | title                       | cardType       |
            | Test Overview HP            | cthp-overview  |
            | Test Treatment HP           | cthp-treatment |
            | Test Causes & Prevention HP | cthp-causes    |
            | Test Statistics HP          | cthp-survival  |
            | Test Video Card HP          | cthp-screening |
            | Test Research HP            | cthp-research  |
            | Test Block Card HP          | cthp-general   |
            | Test Raw HTML Card HP       | cthp-genetics  |
        And cthp overview card has description "Description of Overview Card of CTHP HP content type"
        And PDQ link label reads "PDQ Treatment Information for HPEdited"
        Then the PDQ link is matching the earlier selected PDQ link
        When user clicks on "Vea más información" dropdown
        And browser waits
        Then the following more info links are displayed
            | title                                           | url                           |
            | Article to test Related Resources               | {TEST_SITE_SECTION}/article   |
            | Google Link Guide Card                          | https://www.google.com        |
            | Media Link Override Title Guide cards HPEdited | {TEST_SITE_SECTION}/test-file |
        And cthp causes card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp survival card has a link "Override Card Desc HP - External Feature Card" with href "https://www.google1.com"
        Then the video is matching the earlier selected video
        And cthp screening card has a link "Article to test Related Resources" with href "{TEST_SITE_SECTION}/article"
        And cthp general card has description that is not empty
        And the following cards have multiple spanish links that start with "/espanol"
            | cardType      |
            | cthp-research |
            | cthp-general  |
        And cthp genetics card reads "This is to test Raw Html Content in CTHP Raw HTML Card"
        Then user clicks "Ver más investigaciones" link inside cthp research card
        Then the Cancer Research List page title is matching the earlier selected Cancer Research List page title

    Scenario: Edit and republish Spanish CTHP HP content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url spanish path "/espanol" site section plus "cancer-type-homepage-hp-edited"
        And user clicks on the tool bar status green button "Publicado"
        And user clicks "View in edit form" button from other actions
        And user clears out "Título de página" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                                             | field_name             |
            | Título de página | Automated Test CTHP HP Edited Spanish                             | title                  |
            | Meta Description | Automated Cancer Type Homepage HP Meta Description Edited Spanish | field_page_description |
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify Spanish edited CTHP HP content
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "cancer-type-homepage-hp-edited"
        Then page title is "Automated Test CTHP HP Edited Spanish"
        And the page contains meta tags with the following names
            | name        | content                                                           |
            | description | Automated Cancer Type Homepage HP Meta Description Edited Spanish |

   Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "cancer-type-homepage-edited" from the list of content
        And user selects a checkbox next to title with url "cancer-type-homepage-hp-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete these content items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 4 content items" appears on a screen
        And the content item with url "cancer-type-homepage-edited" does not exist in the list of content
        And the content item with url "cancer-type-homepage-hp-edited" does not exist in the list of content