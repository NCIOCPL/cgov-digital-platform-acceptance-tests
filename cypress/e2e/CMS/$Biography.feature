Feature: As a cms user I want to be able to create Biography content type to promote Biography

    Scenario: User is adding new biography content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Biography" content type
        Then page title is "Create Biography"
        And today date is displayed for the following fields
            | date          |
            | Posted Date   |
            | Updated Date  |
            | Reviewed Date |
        And Date Display Mode has the following checkboxes
            | checkbox      |
            | Posted Date   |
            | Updated Date  |
            | Reviewed Date | 
        And Search Engine Restrictions dropdown has default value "IncludeSearch"
        And Related Resources dropdown is displayed with the following options
            | option            |
            | Add Internal Link |
            | Add External Link |
            | Add Media Link    |
        When user selects test site section
        And user enters "Biography List Description" into "List Description" text field
        And user fills out the following fields
            | fieldLabel                  | value                                        | field_name                     |
            | Pretty URL                  | biography                                    | field_pretty_url               |
            | Full Name                   | Full Name                                    | title[0][value]                |
            | Browser Title               | Automated Test Biography - Browser Title     | field_browser_title            |
            | Card Title                  | Automated Test Biography - Card Title        | field_card_title               |
            | Meta Description            | Automated Test Biography - Meta Description  | field_page_description         |
            | Feature Card Description    | Automated Test Biography - Feature Card Desc | field_feature_card_description |
            | First Name                  | FirstName                                    | field_first_name               |
            | Middle Name                 | M                                            | field_middle_name              |
            | Last Name                   | LastName                                     | field_last_name                |
            | Prefix                      | Dr.                                          | field_prefix                   |
            | Suffix                      | M.S., Ph.D.                                  | field_suffix                   |
            | Title (value 1)             | Title 1                                      | field_title[0][value]          |
            | Organization 1 Name         | NCI                                          | field_org_name_1               |
            | Organization 1 URL          | https://www.cancer.gov/                      | field_org_url_1                |
            | Organization 2 Name         | DCEG                                         | field_org_name_2               |
            | Organization 2 URL          | https://dceg.cancer.gov/                     | field_org_url_2                |
            | Building/Office Room Number | Building 31, Room 7492                       | field_office_location          |
            | Phone Number                | 555-555-5555                                 | field_phone_number             |
            | Email Address               | test@test.com                                | field_email_address            |
            | LinkedIn Profile Handle     | profilename                                  | field_linkedin_handle          |
            | Twitter Profile Handle      | profilename                                  | field_twitter_handle           |
        And user enters "https://www.ncbi.nlm.nih.gov/" into "Scientific Publications" text field
        And user clicks on "Add another item" to a title section
        And user fills out the following fields
            | fieldLabel      | value   | field_name            |
            | Title (value 2) | Title 2 | field_title[1][value] |
        And user fills out "Body" text area with "This is a description of biography content type."
        And user selects "NCI Shady Grove Campus" from "Campus" dropdown
        And user selects 1 Biography Image from the list of images
        And user remembers the source of selected biography image for further verification
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Review" from "Save as" dropdown
        When user saves the content page
        And browser waits

    Scenario: editor is publishing content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "biography" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "biography"
        Then page title is "Full Name"
        And "Reviewed:" date is displaying today's date
        And description reads "This is a description of biography content type."
        And the Biography image is matching the earlier selected image
        And the individual 1 title is displayed as "Title 1"
        And the individual 2 title is displayed as "Title 2"
        And the page contains meta tags with the following names
            | name        | content                                     |
            | description | Automated Test Biography - Meta Description |
        And the following organizations with links are listed for this individual
            | organization | url                      |
            | NCI          | https://www.cancer.gov/  |
            | DCEG         | https://dceg.cancer.gov/ |
        And individuals office is at "NCI Shady Grove Campus | Building 31, Room 7492"
        And contact phone number is "555-555-5555"
        And contact email is "test@test.com"
        And the following social media links are present
            | socialMedia             | href                                   |
            | Twitter                 | http://www.twitter.com/profilename     |
            | LinkedIn                | http://www.linkedin.com/in/profilename |
            | Scientific Publications | https://www.ncbi.nlm.nih.gov/          |

    Scenario: Edit and republish biography content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "biography" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Card Title" field
        And user clears out "Meta Description" field
        And user clears out "Full Name" field
        And user clears out "Feature Card Description" field
        And user clears out "Title (value 1)" field
        And user clears out "Title (value 2)" field
        And user clears out "Organization 2 Name" field
        And user clears out "Organization 2 URL" field
        And user fills out the following fields
            | fieldLabel               | value                                               | field_name                     |
            | Pretty URL               | biography-edited                                    | field_pretty_url               |
            | Full Name                | Full Name Edited                                    | title[0][value]                |
            | Card Title               | Automated Test Biography - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Biography - Meta Description Edited  | field_page_description         |
            | Feature Card Description | Automated Test Biography - Feature Card Desc Edited | field_feature_card_description |
            | Title (value 1)          | Title 1 Edited                                      | field_title[0][value]          |
            | Title (value 2)          | Title 2 Edited                                      | field_title[1][value]          |
            | Organization 2 Name      | DCEG Edited                                         | field_org_name_2               |
            | Organization 2 URL       | https://dceg.cancer.gov/edited/                     | field_org_url_2                |
        And user selects "NCI Frederick Campus" from "Campus" dropdown
        And user selects "Display" from "Show Press Information for Journalists" dropdown
        And user removes the Biography Image
        And user selects 2 Biography Image from the list of images
        And user remembers the source of selected biography image for further verification
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "biography-edited"
        Then page title is "Full Name Edited"
        And "Reviewed:" date is displaying today's date
        And description reads "This is a description of biography content type."
        And the Biography image is matching the earlier selected image
        And the individual 1 title is displayed as "Title 1 Edited"
        And the individual 2 title is displayed as "Title 2 Edited"
        And the page contains meta tags with the following names
            | name        | content                                            |
            | description | Automated Test Biography - Meta Description Edited |
        And the following organizations with links are listed for this individual
            | organization | url                             |
            | NCI          | https://www.cancer.gov/         |
            | DCEG Edited  | https://dceg.cancer.gov/edited/ |
        And individuals office is at "NCI Frederick Campus | Building 31, Room 7492"

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
        And user selects "Full Name Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Full Name Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions


    Scenario: Verify card titles and feature card description in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        And the Card Title has a link "Automated Test Biography - Card Title Edited" with href "/about-cancer/understanding/biography-edited"
        And feature card description reads "Automated Test Biography - Feature Card Desc Edited"

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


    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "biography-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "biography-edited" does not exist in the list of content
