Feature: As a cms user I want to be able to create Cancer Research List Page content type to promote Cancer Research List Page

    Scenario: User is adding new Cancer Research List Page content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Cancer Research List Page" content type
        Then page title is "Create Cancer Research List Page"
        And user fills out the following fields
            | fieldLabel       | value                                                       | field_name             |
            | Page Title       | Automated Test Cancer Research List Page                    | title                  |
            | Browser Title    | Automated Test Cancer Research List Page - Browser Title    | field_browser_title    |
            | Card Title       | Automated Test Cancer Research List Page - Card Title       | field_card_title       |
            | Meta Description | Automated Test Cancer Research List Page - Meta Description | field_page_description |
        And user enters "Cancer Research List Page List Description" into "List Description" text field
        And user fills out the following fields
            | fieldLabel               | value                                                        | field_name                     |
            | Feature Card Description | Automated Test Cancer Research List Page - Feature Card Desc | field_feature_card_description |
        When user selects test site section
        And user fills out the following fields
            | fieldLabel | value                     | field_name       |
            | Pretty URL | cancer-research-list-page | field_pretty_url |
        And user fills out "Body" text area with "This is a description of cancer research list page content type."
        And user clicks on dropdown button toggle to view all Selected Research Pages types
        And user selects "Add Internal Link" related resource item
        Then "Internal Link" section appears
        And user clicks on "Link" button to link to a resource
        And user clicks on "Select content" to choose a resource to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user clicks on dropdown button toggle to view all Selected Research Pages types
        And user selects "Add External Link" related resource item
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                 |       
            | Link       | https://www.google.com/ | field_selected_research[1][subform][field_external_link]   |
            | Title      | Google Link             | field_selected_research[1][subform][field_override_title]  |
        And user clicks on dropdown button toggle to view all Selected Research Pages types
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
            | Override Title | Media Link Override Title | field_selected_research[2][subform][field_override_title][0][value] |
        And user selects 1 Promotional Image from the list of images
        And user remembers the source of selected promo image for further verification
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "cancer-research-list-page"
        Then page title is "Automated Test Cancer Research List Page"
        And description reads "This is a description of cancer research list page content type."
        And the page contains meta tags with the following names
            | name        | content                                                     |
            | description | Automated Test Cancer Research List Page - Meta Description |
        Then Selected Research pages list contains the following links
            | title                             | link                          | description                                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   | Article to test Related Resources - Meta Description |
            | Google Link                       | https://www.google.com/       | N/A                                                  |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file | N/A                                                  |
        And description reads "Article to test Related Resources - Meta Description"
        And list item number 2 has an exit Disclaimer displayed
        And list item number 3 has pdf icon displayed

    Scenario: Edit and republish Cancer Research List Page content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-research-list-page" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "Card Title" field
        And user fills out the following fields
            | fieldLabel               | value                                                               | field_name                                                          |
            | Pretty URL               | cancer-research-list-page-edited                                    | field_pretty_url                                                    |
            | Page Title               | Automated Test Cancer Research List Page Edited                     | title                                                               |
            | Card Title               | Automated Test Cancer Research List Page - Card Title Edited        | field_card_title                                                    |
            | Meta Description         | Automated Test Cancer Research List Page Meta Description Edited    | field_page_description                                              |
            | Feature Card Description | Automated Test Cancer Research List Page - Feature Card Desc Edited | field_feature_card_description                                      |
            | Override Title           | Internal Link override title                                        | field_selected_research[0][subform][field_override_title][0][value] |
        And user enters "Internal Link List Description" into 1 "Override List Description" text field
        And user enters "Media Link List Description" into 2 "Override List Description" text field
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "cancer-research-list-page-edited"
        Then page title is "Automated Test Cancer Research List Page Edited"
        Then Selected Research pages list contains the following links
            | title                        | link                          | description                    |
            | Internal Link override title | {TEST_SITE_SECTION}/article   | Internal Link List Description |
            | Google Link                  | https://www.google.com/       | N/A                            |
            | Media Link Override Title    | {TEST_SITE_SECTION}/test-file | Media Link List Description    |
        And the page contains meta tags with the following names
            | name        | content                                                          |
            | description | Automated Test Cancer Research List Page Meta Description Edited |


    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "cancer-research-list-page-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "cancer-research-list-page-edited" does not exist in the list of content
