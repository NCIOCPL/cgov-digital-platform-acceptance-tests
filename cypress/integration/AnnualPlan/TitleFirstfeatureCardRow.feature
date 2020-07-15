Feature: As a content editor, I would like to be able to embed a title-first feature card row in content, so that we can promote content more prominently.

    Scenario Outline: User views a page with an internal title-first feature card row on desktop, mobile and tablet / spanish and english
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the title-first feature card row will display
        And a "two column" card will appear on the "<alighment>"
        And the card title of the "two column" feature card item should appear as a H3 tag
        And "441" by "785" sized promo image of the "two column" feature card is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the card description of the "two column" feature card item should appear
        And the "two column" card has a href "<href>"

        Examples:
            | url                     | screenBreakpoint | alighment | href                                           | promoImageSource                                                                                                                        | promoImageAlt                        |
            | /special-report         | desktop          | left      | /news-events/press-releases/2019/brca-exchange | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/ocean-sunset-view-mykonos-article\.jpg.* | sunset ocean view in Mykonos         |
            | /espanol/special-report | tablet           | left      | /news-events/press-releases/2019/brca-exchange | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/ocean-sunset-view-mykonos-article\.jpg.* | vista del mar en el ocaso en Mykonos |
            | /special-report         | mobile           | top       | /news-events/press-releases/2019/brca-exchange | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/ocean-sunset-view-mykonos-article\.jpg.* | sunset ocean view in Mykonos         |


    Scenario Outline: User views a page with an external title-first feature card row on desktop and mobile / spanish and english
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the title-first feature card row will display
        And a "one column" card will appear on the "<alighment>"
        And the card title of the "two column" feature card item should appear as a H3 tag
        And "319" by "425" sized promo image of the "one column" feature card is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the card description of the "one column" feature card item should appear
        And the "one column" card has a href "<href>"

        Examples:
            | url                    | screenBreakpoint | alighment | href                   | promoImageSource                                                                                                  | promoImageAlt |
            | /special-report        | desktop          | right     | https://www.google.com | \/sites\/default\/files\/styles\/cgov_featured\/public\/cgov_image\/featured\/\d{4}-\d{2}\/pet_mm_featured\.jpg.* | Minnie        |
            | espanol/special-report | mobile           | bottom    | https://www.google.com | \/sites\/default\/files\/styles\/cgov_featured\/public\/cgov_image\/featured\/\d{4}-\d{2}\/pet_mm_featured\.jpg.* | Minnie        |

    #############ANALYTICS####################

    Scenario: Click events for feature card row clicks on desktop English page
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/special-report"
        When user clicks on a "two column" feature card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event27   |                                         |
            | evar2     | english                                 |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop57    | Stories of Cancer Research              |
            | prop58    | Stories of Cancer Research              |
            | prop59    | titleFirst:1                            |
            | prop60    | D=pageName                              |
            | prop67    | D=pageName                              |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | pageURL   | https://{CANONICAL_HOST}/special-report |

    Scenario: Click events for feature card row clicks on Mobile Spanish Page
        Given screen breakpoint is set to "mobile"
        And user is navigating to "espanol/special-report"
        When user clicks on a "one column" feature card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                           |
            | event27   |                                                 |
            | evar2     | spanish                                         |
            | prop4     | D=pev1                                          |
            | prop8     | spanish                                         |
            | prop57    | Budget Proposal                                 |
            | prop58    | Budget Proposal                                 |
            | prop59    | titleFirst:2                                    |
            | prop60    | D=pageName                                      |
            | prop67    | D=pageName                                      |
            | pageName  | {CANONICAL_HOST}/espanol/special-report         |
            | pageURL   | https://{CANONICAL_HOST}/espanol/special-report |