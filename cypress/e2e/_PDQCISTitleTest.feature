Feature: as a content editor, I want to ensure that I can set card title using CTHP Card Title field
    Scenario: Verify CTHP Card Title field exists
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user is navigating to "/about-cancer/treatment/cam/hp/acupuncture-pdq"
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And the following fields are displayed
            | fieldLabel      | field_name            |
            | CTHP Card Title | field_cthp_card_title |
        And user saves the content page

    Scenario: As a user I want to add a PDQ guide card and see CTHP Card Title
        Given user is navigating to "/user/login?show_login_fields=true"
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
            | fieldLabel       | value                 | field_name             |
            | Pretty URL       | cthp-card-title       | field_pretty_url       |
            | Page Title       | CTHP Card Title       | title                  |
            | Browser Title    | CTHP Card Title       | field_browser_title    |
            | Meta Description | CTHP Meta Description | field_page_description |
        And user selects "Add CTHP Guide Card" from "CTHP Cards" CTHP dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel      | value          | field_name                                                    |
            | CTHP Card Title | Test Treatment | field_cthp_cards[0][subform][field_cthp_card_title][0][value] |
        And user selects "Treatment" from CTHP Card Theme dropdown number 1
        And browser waits
        And user clicks on "PDQ Links" link in the "CTHP Guide Card" text area
        And user clicks on "Select summary" button from "CTHP Guide Card" text area
        And user filters summaries list by "English" language
        And user filters summaries by text "Acupuncture (PDQ®)–Health Professional Version"
        And user clicks on "Apply" button
        And user selects 1 PDQ Summary from the list of summaries
        And user clicks on "Select summary" button to select item
        And user selects "Published" from "Save as" dropdown
        And browser waits
        Then user saves the content page
        And browser waits


    Scenario: Verify CTHP card title is displaying on a card
        Given user is navigating to the front end site with path site section plus "cthp-card-title"
        Then pdq link displaying link as "Acupuncture"
        When user clicks on "Acupuncture" link
        Then browser title is "Acupuncture (PDQ®) - NCI"

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "cthp-card-title" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen