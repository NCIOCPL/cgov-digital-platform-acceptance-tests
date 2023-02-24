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
        | fieldLabel       | value                                  | field_name                                                |
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
    Then user saves the content page

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
        | fieldLabel                | value                             | field_name                                                   |
        | Override Card Description | Article to test Related Resources | field_cthp_cards[2][subform][field_cthp_override_description]|
    Then user saves the content page

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
    And browser waits 
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
      
Scenario: Clean up
    Given user is navigating to "/user/login"
    When user enters credentials
    And user clicks "Log in" button
    Then user is logged in and the user name "admin" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    And user selects a checkbox next to title with url "cancer-type-homepage-edited" from the list of content
    And user clicks on "Apply to selected items" content action button
    Then page title is "Are you sure you want to delete this content item?"
    When user clicks on "Delete" button
    Then the confirmation text "Deleted 1 content item." appears on a screen
    And the content item with url "cancer-type-homepage-edited" does not exist in the list of content