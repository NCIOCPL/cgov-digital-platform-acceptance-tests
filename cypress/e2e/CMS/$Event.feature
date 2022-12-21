Feature: As a cms user I want to be able to create Event content type to promote Event


    Scenario: User is adding new event content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
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
        And user fills out the following fields
            | fieldLabel         | value              | field_name       |
            | Venue              | NCI Shady Grove    | field_venue      |
            | Room               | 2E626              | field_room       |
            | City/State/Country | Rockville, MD, USA | field_city_state |
        And user fills out "Body" text area with "This is a description of event content type."
        And user selects 1 Lead Image from the list of images
        And user selects 2 Promotional Image from the list of images
        And user remembers the source of selected lead image for further verification
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

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
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-event" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user checks "All Day Event?" checkbox
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify the "all day event" checkbox hides time on front end
        Given user is navigating to the front end site with path site section plus "test-event"
        Then page title is "Automated Test Event"
        And the event date is displaying todays date
        And event date does not display time


    Scenario: Edit and republish event content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-event" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Event Title" field
        And user clears out "Card Title" field
        And user clears out "Meta Description" field
        And user clears out "Venue" field
        And user clears out "City/State/Country" field
        And user clears out "Room" field
        And user fills out the following fields
            | fieldLabel         | value                                        | field_name             |
            | Pretty URL         | test-event-edited                            | field_pretty_url       |
            | Event Title        | Automated Test Event Edited                  | title                  |
            | Card Title         | Automated Test Event - Card Title Edited     | field_card_title       |
            | Meta Description   | Automated Test Event Meta Description Edited | field_page_description |
            | Venue              | NCI Shady Grove Edited                       | field_venue            |
            | Room               | 2E626 Edited                                 | field_room             |
            | City/State/Country | Arlington, VA, USA                           | field_city_state       |
        And user clears out "Event Series" field
        And user types "e" in the "Event Series" autosuggest
        And user selects 3 event series from "Event Series" autosuggest
        And user removes the Lead Image
        And user selects 3 Lead Image from the list of images
        And user remembers the source of selected lead image for further verification
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

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


    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "test-event-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "test-event-edited" does not exist in the list of content