Feature: Adding any necessary test resources

  Scenario: Create article and file to test related resources functionality
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
      | fieldLabel       | value                                                | field_name             |
      | Pretty URL       | article                                              | field_pretty_url       |
      | Page Title       | Article to test Related Resources                    | title[0][value]        |
      | Browser Title    | Article to test Related Resources                    | field_browser_title    |
      | Meta Description | Article to test Related Resources - Meta Description | field_page_description |
    And user selects "Published" from "Save as" dropdown
    Then user saves the content page
    When user clicks on "Content" tab
    And user clicks on "Media" sub tab
    And user clicks on "Add media" action button
    And user clicks on "File" content type
    Then page title is "Add File"
    When user selects test site section
    And user fills out the following fields
      | fieldLabel    | value                           | field_name          |
      | Pretty URL    | test-file                       | field_pretty_url    |
      | Name          | Test File for Related Resources | name[0][value]      |
      | Browser Title | Test File for Related Resources | field_browser_title |
    And user uploads test file "text.txt"
    And user selects "Published" from "Save as" dropdown
    Then user saves the content page


  Scenario: User is creating new Mini Landing page content type
    Given user is navigating to "/user/login"
    When user enters credentials
    And user clicks "Log in" button
    Then user is logged in and the user name "admin" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    And user clicks on "Add content" action button
    And user clicks on "Mini Landing Page" content type
    Then page title is "Mini Landing Page"
    When user selects test site section
    And user fills out the following fields
      | fieldLabel               | value                                               | field_name                     |
      | Pretty URL               | mini-landing-page-test-promo                        | field_pretty_url               |
      | Page Title               | Test Resource Mini Landing Page                     | title                          |
      | Browser Title            | Test Resource Mini Landing Page - Browser Title     | field_browser_title            |
      | Meta Description         | Test Resource Mini Landing Page Meta Description    | field_page_description         |
      | Feature Card Description | Test Resource Mini Landing Page - Feature Card Desc | field_feature_card_description |
      | Card Title               | Test Resource Mini Landing Page - Card Title        | field_card_title               |
    And user enters "Mini Landing Page List Description" into "List Description" text field
    And user selects 1 Promotional Image for the mini landing
    And user remembers the source of selected promo image for the mini landing
    And user selects "Published" from "Save as" dropdown
    Then user saves the content page