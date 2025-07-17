
Feature: NCIDS two column container


    Scenario Outline: Verify NCIDS two column container
        Given screen breakpoint is set to "<breakpoint"
        And user is navigating to "/news-events"
        Then two column container is visible
        And NCIDS dynamic list shows items with date and the following
            | component   |
            | description |
            | heading     |
        And view more button "All NCI News" is a link
        And the right rail links have "data-eddl-landing-rawhtml-component-variant" attribute with value "NewsEventsRightRail"

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: NCIDS Dynamic List item click
        Given user is navigating to "/news-events"
        When user clicks on NCIDS Dynamic list item at position 5
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                               |
            | prop4     | D=pev1                                                                              |
            | prop8     | english                                                                             |
            | prop57    | D=v64                                                                               |
            | prop58    | D=v65                                                                               |
            | prop59    | D=v66                                                                               |
            | prop60    | D=c67                                                                               |
            | prop67    | D=pageName                                                                          |
            | prop68    | D=v68                                                                               |
            | evar2     | D=c8                                                                                |
            | evar64    | Internal\|Recent Press Releases\|BRCA Exchange aggregates data on thousands of BRCA |
            | evar65    | Dynamic List\|NCIDS Collection Media\|Press Releases                                |
            | evar66    | 2\|2\|2\|1\|1\|1                                                                    |
            | evar67    | Collection Item\|5\|5                                                               |
            | evar68    | Body                                                                                |
            | pageName  | {CANONICAL_HOST}/news-events                                                        |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events                                           |
            | event27   |                                                                                     |
            | channel   | News and Events                                                                     |
            | pev2      | LP:Collection:LinkClick                                                             |
            | linkType  | lnk_o                                                                               |

    Scenario: NCIDS two column container Right rail link click
        Given user is navigating to "/news-events"
        When user clicks on NCIDS right rail link "/about-nci/budget/fact-book"
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                      |
            | prop4     | D=pev1                                     |
            | prop8     | english                                    |
            | prop57    | D=v64                                      |
            | prop58    | D=v65                                      |
            | prop59    | D=v66                                      |
            | prop60    | D=c67                                      |
            | prop67    | D=pageName                                 |
            | prop68    | D=v68                                      |
            | evar2     | D=c8                                       |
            | evar64    | Internal\|Media Resources\|NCI Budget Data |
            | evar65    | Raw HTML\|Not Defined\|NewsEventsRightRail |
            | evar66    | 2\|2\|2\|2\|3\|1                           |
            | evar67    | Text\|6\|3                                 |
            | evar68    | Body                                       |
            | pageName  | {CANONICAL_HOST}/news-events               |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events  |
            | event27   |                                            |
            | channel   | News and Events                            |
            | pev2      | LP:RawHTML:LinkClick                       |
            | linkType  | lnk_o                                      |