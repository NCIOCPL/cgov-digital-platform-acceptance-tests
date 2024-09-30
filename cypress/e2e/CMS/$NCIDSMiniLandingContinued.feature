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
        And user clicks on the tool bar status button "Draft"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify newly created content
        And screen breakpoint is set to "<breakpoint>"
        Given user is navigating to the front end site with path site section plus "ncids-mini-landing-page-two-column"
        And there are 4 two column layout sections
        And the sections have the following
            | sectionIndex | splitRatio | columnIndex | type                  | link                             |
            | 0            | 50:50      | 0           | landing-content-block | none                             |
            | 0            | 50:50      | 1           | feature-card          | Internal                         |
            | 1            | 66:33      | 0           | landing-content-block | none                             |
            | 1            | 66:33      | 1           | feature-card          | External                         |
            | 2            | 50:50      | 0           | summary-box           | none                             |
            | 2            | 50:50      | 1           | feature-card          | Media                            |
            | 3            | 50:50      | 0           | rawHtml               | This is to test Raw Html Content |
            | 3            | 50:50      | 1           | landing-content-block | none                             |
        When user clicks on "/about-cancer/understanding/article" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | Internal\|Article to test Related Resources\|Image             |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 4\|1\|2\|2\|1\|1\|TwoColumn50:50                               |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | event112  |                                                                |
            | channel   | About Cancer                                                   |
            | pev2      | MLP:FeatureCard:LinkClick                                      |
            | linkType  | lnk_o                                                          |

Scenario: Clean up
    Given user is navigating to "/user/login?show_login_fields=true"
    When user enters credentials of "editor"
    And user clicks "Log in" button
    Then user is logged in and the user name "editor" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    And user clicks on title with url "ncids-mini-landing-page-two-column" from the list of content
    And user clicks on the tool bar status button "Published"
    And user clicks "Request Archive" button from Moderation sidebar
    And user clicks on the tool bar status button "Archive Requested"
    And user clicks "Approve Archive Request" button from Moderation sidebar
    And user clicks on the tool bar status button "Archived"
    And user clicks "View in edit form" button from other actions
    When user clicks on "Delete" option button
    When user confirms "Delete" action

