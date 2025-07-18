Feature: As a cms user I want to be able to create Event content type to promote Event


    Scenario: User is adding new event content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "author"
        And user clicks "Log in" button
        Then user is logged in and the user name "author" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Event" content type
        Then page title is "Create Event"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                 | field_name                     |
            | Pretty URL               | test-event                            | field_pretty_url               |
            | Event Title              | Automated Test Event                  | title                          |
            | Browser Title            | Automated Test Event- Browser Title   | field_browser_title            |
            | Card Title               | Automated Test Event - Card Title     | field_card_title               |
            | Meta Description         | Automated Test Event Meta Description | field_page_description         |
            | Feature Card Description | Test Feature Card Description         | field_feature_card_description |
        And user types "e" in the "Event Series" autosuggest
        And user selects 1 event series from "Event Series" autosuggest
        And Event Start Date & Time date field is displaying todays date
        And Event End Date & Time date field is displaying todays date
        And user enters "22:00:00" in the "Event End Date & Time" time field
        And user enters "NCI Shady Grove" in the Venue field
        And user selects "CGH" from event group dropdown
        And user fills out the following fields
            | fieldLabel         | value              | field_name       |
            | Room               | 2E626              | field_room       |
            | City/State/Country | Rockville, MD, USA | field_city_state |
        And user fills out "Body" text area with "This is a description of event content type."
        And user selects 1 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        And browser waits
        And user selects 3 Promotional Image from the list of images
        And browser waits
        And user remembers the source of selected promo image for further verification
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page

    Scenario: editor is publishing content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-event" from the list of content
        And user clicks on the tool bar status button "Review"
        And user selects "Publish" from workflow actions
        And browser waits

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "test-event"
        Then page title is "Automated Test Event"
        And the Event Series title matches selected event series
        And the event date is displaying todays date
        And the event start time displays in the following format "([0-9]|[0-9][0-9]):[0-9][0-9] (AM|PM)"
        And the event end time displays "10:00 PM"
        And the Venue location field displays "NCI Shady Grove"
        And the room location field displays "2E626"
        And the city-state location field displays "Rockville, MD, USA"
        And "Add to Outlook Calendar" is a link with href that matches "\/node\/\d+\/icalendar"
        And description reads "This is a description of event content type."
        And the lead image for event is matching earlier selected image
        And the page contains meta tags with the following names
            | name        | content                               |
            | description | Automated Test Event Meta Description |

    Scenario: Verify the "all day event" checkbox, edit and republish
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-event" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user checks "All Day Event?" checkbox
        And browser waits
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify the "all day event" checkbox hides time on front end
        Given user is navigating to the front end site with path site section plus "test-event"
        Then page title is "Automated Test Event"
        And the event date is displaying todays date
        And event date does not display time


    Scenario: Edit and republish event content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-event" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Event Title" field
        And user clears out "Card Title" field
        And user clears out "Meta Description" field
        And user clears out "Feature Card Description" field
        And user clears out "City/State/Country" field
        And user clears out "Room" field
        And user clears out "Venue" field
        And user enters "NCI Shady Grove Edited" in the Venue field
        And user fills out the following fields
            | fieldLabel               | value                                           | field_name                     |
            | Pretty URL               | test-event-edited                               | field_pretty_url               |
            | Event Title              | Automated Test Event Edited                     | title                          |
            | Card Title               | Automated Test Event - Card Title Edited        | field_card_title               |
            | Meta Description         | Automated Test Event Meta Description Edited    | field_page_description         |
            | Feature Card Description | Automated Test Event - Feature Card Desc Edited | field_feature_card_description |
            | Room                     | 2E626 Edited                                    | field_room                     |
            | City/State/Country       | Arlington, VA, USA                              | field_city_state               |
        And user clears out "Event Series" field
        And user types "e" in the "Event Series" autosuggest
        And user selects 3 event series from "Event Series" autosuggest
        And user removes the Lead Image
        And browser waits
        And user selects 2 Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "test-event-edited"
        Then page title is "Automated Test Event Edited"
        And the Event Series title matches selected event series
        And the Venue location field displays "NCI Shady Grove Edited"
        And the room location field displays "2E626 Edited"
        And the city-state location field displays "Arlington, VA, USA"
        And "Add to Outlook Calendar" is a link with href that matches "\/node\/\d+\/icalendar"
        And description reads "This is a description of event content type."
        And the lead image for event is matching earlier selected image
        And the page contains meta tags with the following names
            | name        | content                                      |
            | description | Automated Test Event Meta Description Edited |

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
        And user selects "Automated Test Event Edited" item from main page content
        And user clicks on "Select content" button to select item
        And browser waits
        And "Automated Test Event Edited" had been selected
        Then user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Submit for Review" from workflow actions
        And user clicks on the tool bar status button "Post-Publication Review"
        And user selects "Publish" from workflow actions

    Scenario: Verify promo image and card titles in mini landing page
        Given user is navigating to the front end site with path site section plus "mini-landing-page-test-promo"
        Then page title is "Test Resource Mini Landing Page"
        Then the promo image is matching the earlier selected image
        And the Card Title has a link "Automated Test Event - Card Title Edited" with href "/about-cancer/understanding/test-event-edited"
        And feature card description reads "Automated Test Event - Feature Card Desc Edited"

    Scenario: Remove featured item
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "mini-landing-page-test-promo" from the list of content
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
        And user clicks on title with url "test-event-edited" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        When user clicks on "Content" tab
        And the content item with url "test-event-edited" does not exist in the list of content