Feature: Adding a custom site logo

    Scenario: user creates a custom header block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Place block" in "Site Header" region
        And user clicks on "Place block" for "NCIDS Header" block
        And user types " Test" in the block title field
        And user checks "Display title" checkbox
        And user types " Test alt tag" in the "The accessible label for the home page link." field
        And user checks "Use a custom logo?" checkbox
        When user uploads "desktopTest.svg" in "desktop" logo image
        And system waits for file upload process
        And user uploads "mobileTest.svg" in "mobile" logo image
        And system waits for file upload process
        And user clicks on "Pages" option in Visibility section
        And user types "/about-cancer/coping/feelings" in the "Pages" text field
        And user saves block
        Then the confirmation text "The block configuration has been saved." appears on a screen

    Scenario: User is configuring default header to not show up on a test site section
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Configure" button for "NCIDS Header - English" block
        Then page title is "Configure block"
        And user clicks on "Pages" option in Visibility section
        And user types "/about-cancer/coping/feelings" in the "Pages" text field
        And user selects "Hide for the listed pages" radio button
        And user saves editing block
        Then the confirmation text "The block configuration has been saved." appears on a screen

    Scenario: Verify site logo
        Given user is navigating to the front end site with path "/about-cancer/coping/feelings"
        And "aria-label" logo attribute has a value "Home Page Test alt tag"
        And site logo is displayed with image src "/files/ncids_header/logos/desktopTest.svg"
        And search box does not exist
        Then mobile site logo is displayed with image src "/files/ncids_header/logos/mobile.svg"

    Scenario: User is adding search page to a block
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Configure" button for "NCIDS Header Test" block
        Then page title is "Configure block"
        And user fills out the following fields
            | fieldLabel          | value              | field_name                                   |
            | Search Results Page | NCI Search Results | settings[header_config][search_results_page] |
        And user selects 1 item from Search Results Page dropdown
        And user saves editing block
        Then the confirmation text "The block configuration has been saved." appears on a screen

    Scenario: Verify site logo's search bar field
        Given user is navigating to the front end site with path "/about-cancer/coping/feelings"
        And site logo is displayed with image src "/files/ncids_header/logos/desktopTest.svg"
        And search box is displayed
        When screen breakpoint is set to "mobile"
        And search box is displayed

    Scenario: Negative: user has to provide custom logos otherwise error will be shown
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Configure" button for "NCIDS Header Test" block
        Then page title is "Configure block"
        When user clicks on Remove logo for "desktop"
        And user saves editing block
        Then error "If you use a custom logo you must supply both logos." is displayed
        When user clicks on Remove logo for "mobile"
        And user saves editing block
        Then error "If you use a custom logo you must supply both logos." is displayed
        When user uploads "mobileTest.svg" in "mobile" logo image
        And system waits for file upload process
        And user saves editing block
        Then error "If you use a custom logo you must supply both logos." is displayed

    Scenario: Clean Up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Remove" button for "NCIDS Header Test" block
        And user confirms removal of block
        Then the confirmation text "The block NCIDS Header Test has been removed from the Site Header region." appears on a screen
        When user clicks on "Structure" tab
        And user clicks on "Block layout" sub tab
        Then page title is "Block layout"
        When user clicks on "Configure" button for "NCIDS Header - English" block
        Then page title is "Configure block"
        And user clicks on "Pages" option in Visibility section
        And user clears out "Pages" text field
        And user selects "Show for the listed pages" radio button
        And user saves editing block
        Then the confirmation text "The block configuration has been saved." appears on a screen