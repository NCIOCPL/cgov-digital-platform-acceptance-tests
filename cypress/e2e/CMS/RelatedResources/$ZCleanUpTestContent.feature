Feature: delete all content created for testing purposes that has not yet been deleted

       Scenario: Clean up all remaining test content and articles
              Given user is navigating to "/user/login"
              When user enters credentials
              And user clicks "Log in" button
              Then user is logged in and the user name "admin" is displayed in the toolbar
              And the tool bar appears at the top
              When user clicks on "Content" tab
              And if they exist user selects a checkbox next to the following urls
                     | url                                              |
                     | mini-landing-page-test-biography                 |
                     | mini-landing-page-test-blog-posts                |
                     | mini-landing                                     |
                     | mini-landing-page-image                          |
                     | home-and-landing-page-image                      |
                     | home-and-landing-page-video                      |
                     | test-event-edited                                |
                     | mini-landing-page-test-event                     |
                     | article-to-test-files                            |
                     | crlp-for-files                                   |
                     | test-resource-mini-landing-page-for-home-landing |
                     | home-and-landing-page-edited                     |
                     | mini-landing-page-test-home-and-landing-page     |
                     | article-to-test-infographic                      |
                     | home-and-landing-page-to-test-infographic        |
                     | mini-landing-page-edited                         |
                     | mini-landing-page-test-promo                     |
              And user clicks on "Apply to selected items" content action button
              And browser waits
              When user clicks on "Delete" button
              And if they exist user selects a checkbox next to the following urls
                     | press-release-edited                             |
                     | mini-landing-page-test-press-release             |
                     | blog-post-edited                                 |
                     | cancer-type-homepage                             |
                     | purl                                             |
                     | blog-series-edited                               |
                     | blog-post-test-blog-series                       |
                     | blog-post2-test-blog-series                      |
                     | article                                          |
                     | test-app-edited                                  |
                     | test-article-edited                              |
                     | biography-edited                                 |
                     | cancer-research-list-page-edited                 |
                     | mini-landing-page-test-cancer-research-page-list |
                     | cancer-type-homepage-edited                      |
                     | cancer-type-homepage-hp-edited                   |
                     | mini-landing-page-test-cancer-type-home-page     |
                     | article-to-test-contextual-image                 |
                     | article-to-test-image                            |
              And user clicks on "Apply to selected items" content action button
              And browser waits
              When user clicks on "Delete" button
              And the following content items do not exist in the list of content
                     | url                                              |
                     | test-app-edited                                  |
                     | test-article-edited                              |
                     | biography-edited                                 |
                     | mini-landing-page-test-biography                 |
                     | mini-landing-page-test-blog-posts                |
                     | mini-landing                                     |
                     | cancer-research-list-page-edited                 |
                     | mini-landing-page-test-cancer-research-page-list |
                     | cancer-type-homepage-edited                      |
                     | cancer-type-homepage-hp-edited                   |
                     | mini-landing-page-test-cancer-type-home-page     |
                     | article-to-test-contextual-image                 |
                     | article-to-test-image                            |
                     | mini-landing-page-image                          |
                     | home-and-landing-page-image                      |
                     | home-and-landing-page-video                      |
                     | test-event-edited                                |
                     | mini-landing-page-test-event                     |
                     | article-to-test-files                            |
                     | crlp-for-files                                   |
                     | test-resource-mini-landing-page-for-home-landing |
                     | home-and-landing-page-edited                     |
                     | mini-landing-page-test-home-and-landing-page     |
                     | article-to-test-infographic                      |
                     | home-and-landing-page-to-test-infographic        |
                     | mini-landing-page-edited                         |
                     | mini-landing-page-test-promo                     |
                     | press-release-edited                             |
                     | mini-landing-page-test-press-release             |
              And user clicks on "Media" sub tab
              And user selects a checkbox next to title with url "test-file-pdf" from the list of content
              And user selects a checkbox next to title with url "test-file-csv" from the list of content
              And user selects a checkbox next to title with url "test-file-pptx" from the list of content
              And user selects a checkbox next to title with url "test-file-ppt" from the list of content
              And user selects a checkbox next to title with url "test-file-xlsx" from the list of content
              And user selects a checkbox next to title with url "test-file-xls" from the list of content
              And user selects a checkbox next to title with url "test-file-docx" from the list of content
              And user selects a checkbox next to title with url "test-file-doc" from the list of content
              And user clicks on "Apply to selected items" content action button
              Then page title is "Are you sure you want to delete these media items?"
              When user clicks on "Delete" button
              Then the confirmation text "Deleted 16 items" appears on a screen
              And user deletes test file with url "test-file"
              And the content item with url "test-file" does not exist in the list of content
              And user deletes "Test Image" image
              And the image "Test Image" does not exist in the list of content