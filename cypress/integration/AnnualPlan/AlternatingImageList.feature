Feature: As a content editor, I would like to be able to embed an alternating image list, so that we can engage the user more visually.

    ############### ANALYTICS FOR ALTERNATING LIST#####################

    Scenario: User clicks on a list item with an internal link
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/special-report"
        When user clicks on a list item at position 1
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event27   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop59    | alternatingImage:1                      |
            | prop60    | D=pageName                              |
            | prop67    | D=pageName                              |
            | evar2     | english                                 |
            | channel   | NCI Homepage                            |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | pageURL   | https://{CANONICAL_HOST}/special-report |
            | prop58    | /\n*\t*\Molecular Diagnostics\n*\t*/    |
            | prop57    | /\n*\t*\Molecular Diagnostics\n*\t*/    |


    Scenario Outline: User views a page with an alternating image list on different breakpoint and the list items have alternating alighment
        Given screen breakpoint is set to "screenBreakpoint"
        And user is navigating to "/special-report"
        Then an alternating image list will appear
        And the list items will have alternating alighment starting with left

        Examples:
            | screenBreakpoint |
            | desktop          |
            | tablet           |

    Scenario: User views a page on mobile with an alternating list
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/special-report"
        Then an alternating image list will appear
        And the list items images will not be displayed


    Scenario Outline: Content editor added a list item with an override promo image with internal links
        Given screen breakpoint is set to "desktop"
        And user is navigating to "<path>"
        Then an alternating image list will appear
        And "441" by "785" sized promo image of the list item number <listItemNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the page title of the list item number <listItemNumber> should appear as H3 tag
        And the list description of the list item number <listItemNumber> should appear
        And the item number <listItemNumber> has a href "<href>"


        Examples:
            | path                    | listItemNumber | promoImageSource                                                                                                                      | promoImageAlt                                | href                                                                     |
            | /special-report         | 1              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_smoo_article\.jpg*                 | Cat-Cat                                      | /news-events/press-releases/2019/deep-learning-cervical-cancer-screening |
            | /espanol/special-report | 2              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/nci-shady-grove-building-article\.jpg* | National Cancer Institute Shady Grove Campus | /news-events/press-releases/2019/brca-exchange                           |

    Scenario Outline: Content editor added a list item with an override promo image with internal links on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        And user is navigating to "<path>"
        Then an alternating image list will appear
        And promo image of the list item number <listItemNumber> is not displayed
        And the page title of the list item number <listItemNumber> should appear as H3 tag
        And the list description of the list item number <listItemNumber> should appear
        And the item number <listItemNumber> has a href "<href>"


        Examples:
            | path                    | listItemNumber | promoImageSource                                                                                                                      | promoImageAlt                                | href                                                                     |
            | /special-report         | 1              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_smoo_article\.jpg*                 | Cat-Cat                                      | /news-events/press-releases/2019/deep-learning-cervical-cancer-screening |
            | /espanol/special-report | 2              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/nci-shady-grove-building-article\.jpg* | National Cancer Institute Shady Grove Campus | /news-events/press-releases/2019/brca-exchange                           |

    Scenario Outline: Content editor added a list item with an article image with internal links
        Given screen breakpoint is set to "<screenBreakpoint>"
        And user is navigating to "<path>"
        Then an alternating image list will appear
        And "441" by "785" sized promo image of the list item number <listItemNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the page title of the list item number <listItemNumber> should appear as H3 tag
        And the list description of the list item number <listItemNumber> should appear
        And the item number <listItemNumber> has a href "<href>"


        Examples:
            | screenBreakpoint | path            | listItemNumber | promoImageSource                                                                                                           | promoImageAlt            | href                                           |
            | desktop          | /special-report | 3              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/BRCA-exchange-article\.jpg* | The BRCA Exhange graphic | /news-events/press-releases/2019/brca-exchange |
            | tablet           | /special-report | 3              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/BRCA-exchange-article\.jpg* | The BRCA Exhange graphic | /news-events/press-releases/2019/brca-exchange |

    Scenario Outline: Content editor added a list item with an external link
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/special-report"
        Then an alternating image list will appear
        And "441" by "785" sized promo image of the list item number <listItemNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the page title of the list item number <listItemNumber> should appear as H3 tag
        And the list description of the list item number <listItemNumber> should appear
        And the item number <listItemNumber> has a href "<href>"
        And the exit disclaimer of item number <listItemNumber> appears


        Examples:
            | listItemNumber | promoImageSource                                                                                                      | promoImageAlt | href                   |
            | 5              | \/sites\/default\/files\/styles\/cgov_panoramic\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_smoo_article\.jpg* | Cat-Cat       | https://www.google.com |



