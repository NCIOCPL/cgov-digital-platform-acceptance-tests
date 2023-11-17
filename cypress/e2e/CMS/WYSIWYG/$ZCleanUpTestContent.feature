Feature: delete all content created for testing purposes, that is shared across features

       Scenario: Clean up related resources and mini landing page test content
              Given user is navigating to "/user/login?show_login_fields=true"
              When user enters credentials
              And user clicks "Log in" button
              Then user is logged in and the user name "admin" is displayed in the toolbar
              And the tool bar appears at the top
              When user clicks on "Content" tab
              And user deletes test article with url "article"
              And the content item with url "article" does not exist in the list of content
              And user clicks on "Media" sub tab
              And user deletes test file with url "test-file"
              And the content item with url "test-file" does not exist in the list of content
              And user deletes "Test Image" image
              And the image "Test Image" does not exist in the list of content
              When user clicks on "Content" tab
              And user selects a checkbox next to title with url "mini-landing-page-test-promo" from the list of content
              And user selects "Delete content" action
              And user clicks on "Apply to selected items" content action button
              Then page title is "Are you sure you want to delete this content item?"
              When user clicks on "Delete" button
              Then the confirmation text "Deleted 1 content item." appears on a screen
              And the content item with url "mini-landing-page-test-promo" does not exist in the list of content
