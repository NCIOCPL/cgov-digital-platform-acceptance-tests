Feature: delete all content created for testing purposes, that is shared across features

       Scenario: Clean up related resources and mini landing page test content
              Given user is navigating to "/user/login?show_login_fields=true"
              When user enters credentials of "editor"
              And user clicks "Log in" button
              Then user is logged in and the user name "editor" is displayed in the toolbar
              And the tool bar appears at the top
              When user clicks on "Content" tab
              And user clicks on title with url "article" from the list of content
              And user clicks on the tool bar status button "Published"
              And user clicks "Request Archive" button from Moderation sidebar
              And user clicks on the tool bar status button "Archive Requested"
              And user clicks "Approve Archive Request" button from Moderation sidebar
              And user clicks on the tool bar status button "Archived"
              And user clicks "View in edit form" button from other actions
              When user clicks on "Delete" option button
              When user confirms "Delete" action
              When user clicks on "Content" tab
              And the content item with url "article" does not exist in the list of content
              And user clicks on title with url "mini-landing-page-test-promo" from the list of content
              And user clicks on the tool bar status button "Published"
              And user clicks "Request Archive" button from Moderation sidebar
              And user clicks on the tool bar status button "Archive Requested"
              And user clicks "Approve Archive Request" button from Moderation sidebar
              And user clicks on the tool bar status button "Archived"
              And user clicks "View in edit form" button from other actions
              When user clicks on "Delete" option button
              When user confirms "Delete" action
              When user clicks on "Content" tab
              And the content item with url "mini-landing-page-test-promo" does not exist in the list of content
              And user clicks on "Media" sub tab
              And user deletes test file with url "test-file"
              And the content item with url "test-file" does not exist in the list of content
              And user deletes "Automated Test Image" image
              And the image "Automated Test Image" does not exist in the list of content
              When user clicks on "Content" tab
              And user clicks on "Media" sub tab
              And user deletes "NCIDS Image" image
              And the image "NCIDS Image" does not exist in the list of content



