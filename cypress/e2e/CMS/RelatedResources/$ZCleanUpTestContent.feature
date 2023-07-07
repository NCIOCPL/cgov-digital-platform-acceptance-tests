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
                     | mini-landing-page-test-article                   |
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
                     | home-and-landing-page                            |
                     | mini-landing-page-test-home-and-landing-page     |
                     | article-to-test-infographic                      |
                     | home-and-landing-page-to-test-infographic        |
                     | mini-landing-page-edited                         |
                     | mini-landing-page-test-promo                     |
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
              And if they exist user selects a checkbox next to the following urls
                     | url              |
                     | test-file-pdf    |
                     | test-file-csv    |
                     | test-file-pptx   |
                     | test-file-ppt    |
                     | test-file-xlsx   |
                     | test-file-xls    |
                     | test-file-docx   |
                     | test-file-doc    |
                     | test-infographic |
                     | test-file        |
              And user clicks on "Apply to selected items" content action button
              When user clicks on "Delete" button
              And the following content items do not exist in the list of content
                     | url              |
                     | test-file-pdf    |
                     | test-file-csv    |
                     | test-file-pptx   |
                     | test-file-ppt    |
                     | test-file-xlsx   |
                     | test-file-xls    |
                     | test-file-docx   |
                     | test-file-doc    |
                     | test-infographic |
                     | test-file        |
              And user deletes "Test Image" image
              And the image "Test Image" does not exist in the list of content