Feature: As a cms user I want to be able to create cancer center content type to promote cancer centers


    Scenario: User is adding new cancer center content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Cancer Center" content type
        Then page title is "Create Cancer Center"
        When user selects test site section
        And user enters "Cancer Center List Description" into "List Description" text field
        And user fills out the following fields
            | fieldLabel                         | value                               | field_name                               |
            | Pretty URL                         | cancer-center                       | field_pretty_url                         |
            | Sort Title                         | Test Sort Title                     | field_sort_title                         |
            | Card Title                         | Test Card Title                     | field_card_title                         |
            | Institution Name                   | Automated Test Cancer Center        | title                                    |
            | Browser Title                      | Automated Test Cancer Center        | field_browser_title                      |
            | Meta Description                   | Test Cancer Center Meta Description | field_page_description                   |
            | Feature Card Description           | Test Feature Card Description       | field_feature_card_description           |
            | Parent University/Institution Name | NIH                                 | field_parent_institution                 |
            | Organization Head Name             | Organization Head Name              | field_org_head_name                      |
            | Organization Head Title            | Organization Head Title             | field_org_head_title                     |
            | Street address                     | 123 Magnolia Str                    | field_address[0][address][address_line1] |
            | Street address line 2              | Apt 2222                            | field_address[0][address][address_line2] |
            | City                               | Arlington                           | field_address[0][address][locality]      |
            | Zip code                           | 22182                               | field_address[0][address][postal_code]   |
            | Phone 1 Label                      | Main Phone                          | field_phone_label_1                      |
            | Phone 1 Number                     | 888-888-8888                        | field_phone_number_1                     |
            | Phone 2 Label                      | Secondary Phone                     | field_phone_label_2                      |
            | Phone 2 Number                     | 888-111-1111                        | field_phone_number_2                     |
            | Website Title                      | Website Title                       | field_website_title                      |
            | Website URL                        | https://www.google.com              | field_website_url                        |
        And user selects "Comprehensive Cancer Center" from "Institution Type" dropdown
        And user selects "Virginia" from "State" dropdown
        And user selects "Pacific" from "Region" dropdown
        And user fills out "Body" text area with "This is a description of cancer institute"
        And user selects 1 Cancer Center Image from the list of images
        And user remembers the source of selected image for further verification
        And user checks "Updated Date" checkbox
        And user selects "Review" from "Save as" dropdown
        When user saves the content page


    Scenario: editor is publishing content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-center" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits


    Scenario: Create a mini landing page and add cancer center into a list
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Mini Landing Page" content type
        Then page title is "Create Mini Landing Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                              | field_name             |
            | Pretty URL       | mini-landing                       | field_pretty_url       |
            | Page Title       | Test Mini Landing                  | title[0][value]        |
            | Browser Title    | Test Mini Landing                  | field_browser_title    |
            | Meta Description | Test MIni Landing Meta Description | field_page_description |
        And user selects "Add List" from contents dropdown
        And user selects "Title and Description" from "List Item Style" dropdown
        And user clicks on "Link" button to add list item
        And user clicks on "Select content" button
        And user selects "Automated Test Cancer Center" from content list
        And "Automated Test Cancer Center" had been selected
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar

    Scenario: Verify that list description is displayed
        Given user is navigating to the front end site with path site section plus "mini-landing"
        Then page title is "Test Mini Landing"
        And list item title is "Automated Test Cancer Center"
        And list item description is "Cancer Center List Description"

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "cancer-center"
        Then page title is "Automated Test Cancer Center"
        And institution title reads "NIH"
        And cancer center type is "Comprehensive Cancer Center"
        And head name and title reads "Organization Head Name, Organization Head Title"
        And the address reads "123 Magnolia Str"
        And the address reads "Apt 2222"
        And city, state and zipcode reads "Arlington, Virginia 22182"
        And phone label is "Main Phone"
        And phone number is "888-888-8888"
        And secondary phone label is "Secondary Phone"
        And secondary phone number is "888-111-1111"
        And website title "Website Title" is a link with href "https://www.google.com"
        And description reads "This is a description of cancer institute"
        And the cancer center image matching the earlier selected image
        And "Updated:" date stamp displays todays date
        And the page contains meta tags with the following names
            | name        | content                             |
            | description | Test Cancer Center Meta Description |

    Scenario: Verify Related resources functionality
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-center" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Internal Link" related resource item
        Then "Internal Link" section appears
        And user clicks on "Link" button to link to a resource
        And user clicks on "Select content" to choose a resource to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add External Link" related resource item
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                |
            | Link       | https://www.google.com/ | field_related_resources[1][subform][field_external_link]  |
            | Title      | Google Link             | field_related_resources[1][subform][field_override_title] |
        And user clicks on dropdown button toggle to view all Related Resources types
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
            | Override Title | Media Link Override Title | field_related_resources[2][subform][field_override_title][0][value] |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions


    Scenario: Edit and republish cancer center
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "cancer-center" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Organization Head Name" field
        And user clears out "Card Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "Street address" field
        And user clears out "Zip code" field
        And user clears out "Phone 1 Label" field
        And user clears out "Phone 2 Number" field
        And user fills out the following fields
            | fieldLabel               | value                                      | field_name                               |
            | Pretty URL               | cancer-center-edited                       | field_pretty_url                         |
            | Organization Head Name   | Organization Head Name Edited              | field_org_head_name                      |
            | Card Title               | Test Card Title Edited                     | field_card_title                         |
            | Meta Description         | Test Cancer Center Meta Description Edited | field_page_description                   |
            | Feature Card Description | Test Feature Card Description Edited       | field_feature_card_description           |
            | Street address           | 123 Magnolia Str Edited                    | field_address[0][address][address_line1] |
            | Phone 1 Label            | Main Phone Edited                          | field_phone_label_1                      |
            | Phone 2 Number           | 888-111-1234                               | field_phone_number_2                     |
            | Zip code                 | 76001                                      | field_address[0][address][postal_code]   |
        And user selects "Basic Laboratory Cancer Center" from "Institution Type" dropdown
        And user selects "Texas" from "State" dropdown
        And user removes Cancer Center Image
        And user selects 2 Cancer Center Image from the list of images
        And user remembers the source of selected image for further verification
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions


    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "cancer-center-edited"
        Then page title is "Automated Test Cancer Center"
        And institution title reads "NIH"
        And cancer center type is "Basic Laboratory Cancer Center"
        And head name and title reads "Organization Head Name Edited, Organization Head Title"
        And the address reads "123 Magnolia Str Edited"
        And city, state and zipcode reads "Arlington, Texas 76001"
        And phone label is "Main Phone Edited"
        And phone number is "888-888-8888"
        And secondary phone label is "Secondary Phone"
        And secondary phone number is "888-111-1234"
        And website title "Website Title" is a link with href "https://www.google.com"
        And description reads "This is a description of cancer institute"
        And the cancer center image matching the earlier selected image
        And the page contains meta tags with the following names
            | name        | content                                    |
            | description | Test Cancer Center Meta Description Edited |
        Then Related Resources section contains the following links
            | title                             | link                          |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |

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
        And user selects "Automated Test Cancer Center" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Cancer Center" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify card titles and feature card description in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        And the Card Title has a link "Test Card Title Edited" with href "/about-cancer/understanding/cancer-center-edited"
        And feature card description reads "Test Feature Card Description Edited"

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
        And user clicks on title with url "cancer-center-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "cancer-center-edited" does not exist in the list of content
        And user clicks on title with url "mini-landing" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "mini-landing" does not exist in the list of content