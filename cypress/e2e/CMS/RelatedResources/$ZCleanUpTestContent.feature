Feature: delete all content created for testing purposes that has not yet been deleted

       Scenario: Clean up all remaining test content and articles
              Given user is navigating to "/user/login"
              When user enters credentials
              And user clicks "Log in" button
              Then user is logged in and the user name "admin" is displayed in the toolbar
              And the tool bar appears at the top
              When user clicks on "Content" tab
              And user clicks on "Media" sub tab
              And user deletes test file with url "test-file"
              And the content item with url "test-file" does not exist in the list of content
              # Given user is navigating to "/user/login"
              # When user enters credentials
              # And user clicks "Log in" button
              # Then user is logged in and the user name "admin" is displayed in the toolbar
              # And the tool bar appears at the top
              When user clicks on "Content" tab
              And if they exist user selects a checkbox next to the following urls
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
                     | blog-post-edited                                 |
                     | cancer-type-homepage                             |
                     | purl                                             |
                     | blog-series-edited                               |
                     | blog-post-test-blog-series                       |
                     | blog-post2-test-blog-series                      |
                     | article                                          |

              # And if it exists user selects a checkbox next to title with url "blog-post-edited" under "/news-events/cancer-currents-blog" from the list of content
              # And if they exist user selects a checkbox next to the following titles with url
              #        | title                                             | lastPartUrl                            |
              #        | Automated Test Blog Series Edited                 | blog-series-edited                     |
              #        | Automated Test Blog Post for testing Blog Series  | blog-post-test-blog-series             |
              #        | Automated Test Blog Post2 for testing Blog Series | blog-post2-test-blog-series            |
              #        | Article to test Site Section                      | /about-cancer/coping/test-site-section |
              #        | Article to test Related Resources                 | /something                             |
              And if it exists user selects a checkbox next to the title with spanish path "/espanol" with url "home-and-landing-page-video-spanish" from the list of content

              And user clicks on "Apply to selected items" content action button
              # Then page title is "Are you sure you want to delete these content items?"
              When user clicks on "Delete" button
              # Then the confirmation text "Deleted 2 content items" appears on a screen
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
# And user selects a checkbox next to title with url "mini-landing-page-test-article" from the list of content
# And user clicks on "Apply to selected items" content action button
# Then page title is "Are you sure you want to delete this content item?"
# When user clicks on "Delete" button
# Then the confirmation text "Deleted 1 content item" appears on a screen
# And the content item with url "mini-landing-page-test-article" does not exist in the list of content