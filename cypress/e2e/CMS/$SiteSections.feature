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
        Then the current page is "Coping with Cancer" in left nav
        And the following nav children are displayed
            | label             |
            | Test Site Section |
        And browser waits
        When user is navigating to the front end site with path "/about-cancer/coping/test-site-section"
        Then the current page is "Test Site Section" in left nav
        And page title is "Article to test Site Section"
        And 1 level up section is "Coping with Cancer"

    Scenario: Making site section a nav root
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user selects "children" link under "Home"
        And user selects "children" link under "About Cancer"
        And user selects "children" link under "Coping with Cancer"
        And user selects "Edit" operation for "Test Site Section"
        Then page title is "Edit term"
        And user checks "Set Section Nav Root" checkbox to set as a nav root
        And browser waits
        When user saves the content page

    Scenario: Verify that the test site section points to a new url after changing landing's page site section
        Given user is navigating to the front end site with path "/about-cancer/coping/test-site-section"
        Then left navigation does not display "About Cancer"
        And the current page is "Test Site Section" in left nav
        And page title is "Article to test Site Section"

    Scenario: Hiding site section in section anv
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user selects "children" link under "Home"
        And user selects "children" link under "About Cancer"
        And user selects "children" link under "Coping with Cancer"
        And user selects "Edit" operation for "Test Site Section"
        Then page title is "Edit term"
        And user unchecks "Set Section Nav Root" checkbox
        And user checks "Hide in Section Nav" checkbox to set display option
        When user saves the content page

    Scenario: Verify that the test site section is not displayed in section nav
        Given user is navigating to the front end site with path "/about-cancer/coping/test-site-section"
        Then left navigation does not display "Test Site Section"

    Scenario: Nav label override name
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user selects "children" link under "Home"
        And user selects "children" link under "About Cancer"
        And user selects "children" link under "Coping with Cancer"
        And user selects "Edit" operation for "Test Site Section"
        Then page title is "Edit term"
        And user fills out the following fields
            | fieldLabel       | value     | field_name             |
            | Navigation Label | Nav Label | field_navigation_label |
        And user unchecks "Hide in Section Nav" checkbox
        And browser waits
        Then user saves the content page

    Scenario: Verify nav label override
        Given user is navigating to the front end site with path "/about-cancer/coping"
        Then the current page is "Coping with Cancer" in left nav
        And browser waits
        And the following nav children are displayed
            | label     |
            | Nav Label |
        When user is navigating to the front end site with path "/about-cancer/coping/test-site-section"
        Then the current page is "Nav Label" in left nav
        And page title is "Article to test Site Section"
        And 1 level up section is "Coping with Cancer"

    # Scenario: Drag and drop to reorder children
    #     Given user is navigating to "/user/login"
    #     When user enters credentials
    #     And user clicks "Log in" button
    #     Then user is logged in and the user name "admin" is displayed in the toolbar
    #     And the tool bar appears at the top
    #     When user clicks on "Structure" tab
    #     And user clicks on "Taxonomy" sub tab
    #     And user selects "List terms" option from Operations for "Site Sections"
    #     And user selects "children" link under "Home"
    #     And user selects "children" link under "About Cancer"
    #     And user selects "children" link under "Coping with Cancer"
    #     And browser waits
    #     And user drags "Test Site Section" item one level down
    #     And browser waits
    #     Then user saves the content page

    # Scenario: Verify the new tree order of a site section
    #     Given user is navigating to the front end site with path "/about-cancer/coping"
    #     Then the current page is "Coping with Cancer" in left nav
    #     And browser waits
    #     And "Nav Label" appears in position 2 in the side menu tree

    Scenario: Verify pretty url change of a site section and removal of nav label
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Taxonomy" sub tab
        And user selects "List terms" option from Operations for "Site Sections"
        And user selects "children" link under "Home"
        And user selects "children" link under "About Cancer"
        And user selects "children" link under "Coping with Cancer"
        And user selects "Edit" operation for "Test Site Section"
        Then page title is "Edit term"
        And user clears out "Navigation Label" field
        And user fills out the following fields
            | fieldLabel | value   | field_name       |
            | Pretty URL | -edited | field_pretty_url |
        When user saves the content page
        When user clicks on "Content" tab
        And user clicks on title with the url "/about-cancer/coping/test-site-section" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify the new purl of site section
        Given user is navigating to the front end site with path "/about-cancer/coping/test-site-section-edited"
        Then the current page is "Test Site Section" in left nav
        And page title is "Article to test Site Section"

    Scenario: Changing a site section of the landing page
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with the url "/about-cancer/coping/test-site-section-edited" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user removes site section
        When user selects first "/about-cancer/coping/feelings" site section
        And browser waits
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value | field_name       |
            | Pretty URL | purl  | field_pretty_url |
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify that the test site section points to a new url after changing landing's page site section
        Given user is navigating to the front end site with selected path "purl"
        Then the current left navigation label has url "/about-cancer/coping/feelings"
        And page title is "Article to test Site Section"
        And left navigation label "Test Site Section" has selected site section url plus "purl"

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
        And user selects "Delete" operation for "Test Site Section"
        Then page title is "Are you sure you want to delete the taxonomy term Test Site Section?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted term Test Site Section." appears on a screen