Feature: As a cms user I want to be able to create Site Section to promote Site Sections

    Scenario: User is adding new article to test site section and adding it as a landing page of new site section
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                            | field_name             |
            | Pretty URL       | article-to-test-site-section                     | field_pretty_url       |
            | Page Title       | Article to test Site Section                     | title[0][value]        |
            | Browser Title    | Article to test Site Section - Browser Title     | field_browser_title    |
            | Meta Description | Article to test Site Section  - Meta Description | field_page_description |
        Then user saves the content page
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user clicks on "Add term" action button
        Then page title is "Add term"
        And user fills out the following fields
            | fieldLabel | value             | field_name                 |
            | Name       | Test Site Section | name[0][value]             |
            | Pretty URL | test-site-section | field_pretty_url[0][value] |
        And browser waits
        And user types "Article to test Site Section" into Landing Page field
        And user selects "Article to test Site Section" from landing page dropdown
        And user expands RELATIONS dropdown
        And user selects "--Coping with Cancer" from RELATIONS dropdown
        Then user saves the content page
        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-site-section" from the list of content
        And user clicks on the tool bar status green button "Draft"
        And user clicks "View in edit form" button from other actions
        And user removes site section
        And browser waits
        When user selects "test-site-section" site section
        And "Test Site Section" has been selected
        And user clears out "Pretty URL" field
        When user saves the content page
        And user clicks on the tool bar status green button "Draft"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify newly created site section
        Given user is navigating to the front end site with path "/about-cancer/coping"
        Then the current page is "Coping with Cancer"
        And the following nav children are displayed
            | label             |
            | Test Site Section |
        And browser waits
        When user is navigating to the front end site with path "/about-cancer/coping/test-site-section"
        Then the current page is "Test Site Section"
        And page title is "Article to test Site Section"
        And 1 level up section is "Coping with Cancer"

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title "Article to test Site Section" with url "/about-cancer/coping/test-site-section" from the list of content
        And user clicks on the "Apply to selected items" action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "/about-cancer/coping/test-site-section" does not exist in the list of content
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user selects "children" link under "Home"
        And user selects "children" link under "About Cancer"
        And user selects "children" link under "Coping with Cancer"
        And user clicks on "Delete" from  dropdown button under "Test Site Section"
        Then page title is "Are you sure you want to delete the taxonomy term Test Site Section?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted term Test Site Section." appears on a screen