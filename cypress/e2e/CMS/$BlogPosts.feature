Feature: As a cms user I want to be able to create Blog Post content type to promote Blog Post.

    Scenario: User is adding new blog post content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Cancer Currents" from Blog Series dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                        | field_name                     |
            | Pretty URL               | blog-post                                    | field_pretty_url               |
            | Page Title               | Automated Test Blog Post                     | title                          |
            | Browser Title            | Automated Test Blog Post - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Blog Post - Card Title        | field_card_title               |
            | Meta Description         | Automated Blog Post Meta Description         | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc | field_feature_card_description |
            | Author                   | Automated Test Blog Post Author              | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects 1 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Display" from "Public Use Text" dropdown
        And user selects "Include in search" from "Search Engine Restrictions"
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify newly created content
        Given user is navigating to the blog "blog-post" under "news-events/cancer-currents-blog"
        Then page title is "Automated Test Blog Post"
        And blog's posted date is today's date
        And the "Subscribe" button appears
        And the "Featured Posts" managed list appears
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And "Archive" accordion is collapsed
        And blog posts list doesnot appear in the archive
        And "< Older Post" link appears
        When user clicks on "< Older Post" link
        And "Newer Post >" link appears
        When user clicks on "Newer Post >" link
        And the author name "Automated Test Blog Post Author" is displayed
        And intro text reads "Blog Post Intro Text"
        And description reads "This is a description of Blog Post content type."
        And the lead image is matching the earlier selected image
        And public use text has a link "Reuse of NCI Information" with href "/policies/copyright-reuse"
        And the page contains meta tags with the following names
            | name        | content                              |
            | description | Automated Blog Post Meta Description |

    Scenario: Verify Related resources functionality
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clicks on dropdown button toggle 1 to view all Related Resources types
        And user selects "Add Internal Link" related resource item
        Then "Internal Link" section appears
        And user clicks on "Link" button to link to a resource
        And user clicks on "Select content" to choose a resource to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And "Article to test Related Resources" had been selected
        And user clicks on dropdown button toggle 1 to view all Related Resources types
        And user selects "Add External Link" related resource item
        Then "External Link" section appears
        And user fills out the following fields
            | fieldLabel | value                   | field_name                                                |
            | Link       | https://www.google.com/ | field_related_resources[1][subform][field_external_link]  |
            | Title      | Google Link             | field_related_resources[1][subform][field_override_title] |
        And user clicks on dropdown button toggle 1 to view all Related Resources types
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


    Scenario: Verify Recommended Content functionality
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status yellow button "Draft available"
        And user clicks "Edit draft" button from other actions
        And user clicks on dropdown button toggle 2 to view all Recommended Content types
        And user selects "Add Internal Feature Card" from Recommended Content dropdwon
        Then "Internal Feature Card" section appears
        And user clicks on "Featured Item" button to link to Recommended Content types
        And user clicks on "Select content" to choose a Recommended Content type to link
        And user selects "Article to test Related Resources" item from the list
        And user clicks on "Select content" button to select item
        And browser waits
        And user clicks on dropdown button toggle 2 to view all Recommended Content types
        And user selects "Add External Feature Card" from Recommended Content dropdwon
        Then "External Feature Card" section appears
        And user fills out the following Recommended Content fields
            | fieldLabel        | value                   | field_name                                                       |
            | Featured Item Url | https://www.google.com/ | field_recommended_content[1][subform][field_featured_url]        |
            | Card Title        | Google Link             | field_recommended_content[1][subform][field_override_card_title] |
        And browser waits
        When user saves the content page


    Scenario: Edit and republish blog post content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-post" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on the tool bar status yellow button "Draft available"
        And user clicks "Edit draft" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                               | field_name                     |
            | Pretty URL               | blog-post-edited                                    | field_pretty_url               |
            | Page Title               | Automated Test Blog Post Edited                     | title                          |
            | Card Title               | Edited                                              | field_card_title[0][value]     |
            | Meta Description         | Automated Test Blog Post Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc Edited | field_feature_card_description |
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status red button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the blog "blog-post-edited" under "news-events/cancer-currents-blog"
        Then page title is "Automated Test Blog Post Edited"
        And the lead image is matching the earlier selected image
        And public use text is not displayed
        And the page contains meta tags with the following names
            | name        | content                                          |
            | description | Automated Test Blog Post Meta Description Edited |
        Then Related Resources section contains the following links
            | title1                            | link1                         |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article   |
            | Google Link                       | https://www.google.com/       |
            | Media Link Override Title         | {TEST_SITE_SECTION}/test-file |
        Then Recommended Content section contains the following links
            | title                             | link                        |
            | Article to test Related Resources | {TEST_SITE_SECTION}/article |
            | Google Link                       | https://www.google.com/     |

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
        And user selects "Automated Test Blog Post Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Blog Post Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image

    Scenario: Remove featured item
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page-test-promo" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user removes "Two Item Feature Card Row" section
        And user confirms removal
        And browser waits
        Then user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions


    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "blog-post-edited" under "/news-events/cancer-currents-blog" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "blog-post-edited" does not exist in the list of content