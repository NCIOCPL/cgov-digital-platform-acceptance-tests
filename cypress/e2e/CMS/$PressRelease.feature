Feature: As a cms user I want to be able to create Press Release content type to promote Press Release

    Scenario: User is adding new press release content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Press Release" content type
        Then page title is "Create Press Release"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                            | field_name                     |
            | Pretty URL               | press-release                                    | field_pretty_url               |
            | Page Title               | Automated Test Press Release                     | title                          |
            | Subtitle                 | Automated Test Press Release - Subtitle          | field_subtitle                 |
            | Press Release Type       | Automated Test - NCI Press Release               | field_press_release_type       |
            | Browser Title            | Automated Test Press Release - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Press Release - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Press Release Meta Description    | field_page_description         |
            | Feature Card Description | Automated Test Press Release - Feature Card Desc | field_feature_card_description |
        And user enters "Press Release List Description" into "List Description" text field
        And user fills out "Body" text area with "This is a description of press release content type."
        And user selects 1 Lead Image from the list of images
         And browser waits
        And user remembers the source of selected lead image for further verification
        And user selects 2 Promotional Image from the list of images
         And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Posted Date" checkbox
        And user selects "Reviewed Date" checkbox
        And user selects "Updated Date" checkbox
        And user selects "Display" from "Public Use Text" dropdown
        And user selects "Published" from "Save as" dropdown
        When user saves the content page

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "press-release"
        Then page title is "Automated Test Press Release"
        And "Updated:" date is displaying today's date
        And Contact "NCI Press Office" link has a href "mailto:ncipressofficers@mail.nih.gov"
        And description reads "This is a description of press release content type."
        And the lead image for press release is matching the earlier selected image
        And public use text has a link "Reuse of NCI Information" with href "/policies/copyright-reuse"
        And the page contains meta tags with the following names
            | name        | content                                       |
            | description | Automated Test Press Release Meta Description |
        Given user is navigating to the front end site plus "news-events"
        Then "Automated Test Press Release" is a link with href that contains site section and "/press-release"
        And today date is displayed in format "month dd,yyyy"
        And the list item description reads "Press Release List Description"
        And the promotional image for press release is matching the earlier selected image


    Scenario: Edit and republish press release content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "press-release" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Subtitle" field
        And user clears out "Press Release Type" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "Card Title" field
        And user fills out the following fields
            | fieldLabel               | value                                                   | field_name                     |
            | Pretty URL               | press-release-edited                                    | field_pretty_url               |
            | Page Title               | Automated Test Press Release Edited                     | title                          |
            | Subtitle                 | Automated Test Press Release - Subtitle Edited          | field_subtitle                 |
            | Press Release Type       | Automated Test - NCI Press Release Edited               | field_press_release_type       |
            | Card Title               | Automated Test Press Release - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Press Release Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Press Release - Feature Card Desc Edited | field_feature_card_description |
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And user removes the Promotional Image
        And browser waits
        And user selects 1 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions


    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "press-release-edited"
        Then page title is "Automated Test Press Release Edited"
        And the lead image for press release is matching the earlier selected image
        And public use text is not displayed
        And the page contains meta tags with the following names
            | name        | content                                              |
            | description | Automated Test Press Release Meta Description Edited |
        Given user is navigating to the front end site plus "news-events"
        Then "Automated Test Press Release Edited" is a link with href that contains site section and "/press-release-edited"
        And today date is displayed in format "month dd,yyyy"
        And the promotional image for press release is matching the earlier selected image

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "press-release-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "press-release-edited" does not exist in the list of content