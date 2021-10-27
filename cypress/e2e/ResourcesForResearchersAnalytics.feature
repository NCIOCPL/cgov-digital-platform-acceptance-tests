Feature: R4R app fires analytics event for SEO tracking purposes



    Scenario: R4R landing page load analytics
        Given user is navigating to "/research/resources" with added wait
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                                                                                                                                                                                                                                                                                                                                                               |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/research/resources                                                                                                                                                                                                                                                                                                                                                    |
            | prop3     | /research/resources                                                                                                                                                                                                                                                                                                                                                                                 |
            | prop6     | Resources for Researchers - National Cancer Institute                                                                                                                                                                                                                                                                                                                                               |
            | prop8     | english                                                                                                                                                                                                                                                                                                                                                                                             |
            | prop10    | Resources for Researchers - National Cancer Institute                                                                                                                                                                                                                                                                                                                                               |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                                                                                                                                                                                                                                                                                                                |
            | prop29    | /(year)=(19\|20)\d{2}\s\|\s(month)=(?:Jan(?:uary)? \|Feb(?:ruary)? \|Mar(?:ch)? \|Apr(?:il)? \|May \|Jun(?:e)? \|Jul(?:y)? \|Aug(?:ust)? \|Sep(?:tember)? \|Oct(?:ober)? \|(Nov \|Dec)(?:ember)?)\s\|\s(date)=\d{1,2}\s\|\s(day)=(?:Sun(?:day)? \|Mon(?:day)? \|Tue(?:sday)? \|Wed(?:nesday)? \|Thu(?:rsday)? \|Fri(?:day)? \|Sat(?:urday))\s\|\s(time)=(1[0-2]\|0?[1-9]):([0-5][0-9]) ?([AP][M]) / |
            | prop44    | RandD Resources                                                                                                                                                                                                                                                                                                                                                                                     |
            | evar44    | D=c44                                                                                                                                                                                                                                                                                                                                                                                               |
            | evar2     | D=c8                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar7     | D=c7                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar5     | Desktop                                                                                                                                                                                                                                                                                                                                                                                             |
            | channel   | Research                                                                                                                                                                                                                                                                                                                                                                                            |
            | pageName  | {CANONICAL_HOST}/research/resources                                                                                                                                                                                                                                                                                                                                                                 |
            | hier1     | {CANONICAL_HOST}\|research\|resources                                                                                                                                                                                                                                                                                                                                                               |
            | event1    |                                                                                                                                                                                                                                                                                                                                                                                                     |
            | event47   | /d{0,2}/                                                                                                                                                                                                                                                                                                                                                                                            |

    Scenario: R4R search results page load analytics
        Given user is navigating to "/research/resources/search?from=0" with added wait
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                                                                                                                                                                                                                                                                                                                                                               |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/research/resources/search?from=0                                                                                                                                                                                                                                                                                                                                      |
            | prop3     | /research/resources/search                                                                                                                                                                                                                                                                                                                                                                          |
            | prop6     | Resources for Researchers: Search Results - National Cancer Institute                                                                                                                                                                                                                                                                                                                               |
            | prop8     | english                                                                                                                                                                                                                                                                                                                                                                                             |
            | prop10    | Resources for Researchers: Search Results - National Cancer Institute                                                                                                                                                                                                                                                                                                                               |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                                                                                                                                                                                                                                                                                                                |
            | prop29    | /(year)=(19\|20)\d{2}\s\|\s(month)=(?:Jan(?:uary)? \|Feb(?:ruary)? \|Mar(?:ch)? \|Apr(?:il)? \|May \|Jun(?:e)? \|Jul(?:y)? \|Aug(?:ust)? \|Sep(?:tember)? \|Oct(?:ober)? \|(Nov \|Dec)(?:ember)?)\s\|\s(date)=\d{1,2}\s\|\s(day)=(?:Sun(?:day)? \|Mon(?:day)? \|Tue(?:sday)? \|Wed(?:nesday)? \|Thu(?:rsday)? \|Fri(?:day)? \|Sat(?:urday))\s\|\s(time)=(1[0-2]\|0?[1-9]):([0-5][0-9]) ?([AP][M]) / |
            | prop44    | RandD Resources                                                                                                                                                                                                                                                                                                                                                                                     |
            | evar44    | D=c44                                                                                                                                                                                                                                                                                                                                                                                               |
            | evar2     | D=c8                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar7     | D=c7                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar5     | Desktop                                                                                                                                                                                                                                                                                                                                                                                             |
            | channel   | Research                                                                                                                                                                                                                                                                                                                                                                                            |
            | pageName  | {CANONICAL_HOST}/research/resources                                                                                                                                                                                                                                                                                                                                                                 |
            | hier1     | {CANONICAL_HOST}\|research\|resources\|search                                                                                                                                                                                                                                                                                                                                                       |
            | event1    |                                                                                                                                                                                                                                                                                                                                                                                                     |
            | event47   | /d{0,2}/                                                                                                                                                                                                                                                                                                                                                                                            |

    Scenario: R4R resource page load analytics
        Given user is navigating to "/research/resources/resource/89"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                                                                                                                                                                                                                                                                                                                                                               |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/research/resources/resource/89                                                                                                                                                                                                                                                                                                                                        |
            | prop3     | /research/resources/resource/89                                                                                                                                                                                                                                                                                                                                                                     |
            | prop6     | Resources for Researchers: DevCan - National Cancer Institute                                                                                                                                                                                                                                                                                                                                       |
            | prop8     | english                                                                                                                                                                                                                                                                                                                                                                                             |
            | prop10    | Resources for Researchers: DevCan - National Cancer Institute                                                                                                                                                                                                                                                                                                                                       |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                                                                                                                                                                                                                                                                                                                |
            | prop29    | /(year)=(19\|20)\d{2}\s\|\s(month)=(?:Jan(?:uary)? \|Feb(?:ruary)? \|Mar(?:ch)? \|Apr(?:il)? \|May \|Jun(?:e)? \|Jul(?:y)? \|Aug(?:ust)? \|Sep(?:tember)? \|Oct(?:ober)? \|(Nov \|Dec)(?:ember)?)\s\|\s(date)=\d{1,2}\s\|\s(day)=(?:Sun(?:day)? \|Mon(?:day)? \|Tue(?:sday)? \|Wed(?:nesday)? \|Thu(?:rsday)? \|Fri(?:day)? \|Sat(?:urday))\s\|\s(time)=(1[0-2]\|0?[1-9]):([0-5][0-9]) ?([AP][M]) / |
            | prop44    | RandD Resources                                                                                                                                                                                                                                                                                                                                                                                     |
            | evar44    | D=c44                                                                                                                                                                                                                                                                                                                                                                                               |
            | evar2     | D=c8                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar7     | D=c7                                                                                                                                                                                                                                                                                                                                                                                                |
            | evar5     | Desktop                                                                                                                                                                                                                                                                                                                                                                                             |
            | channel   | Research                                                                                                                                                                                                                                                                                                                                                                                            |
            | pageName  | {CANONICAL_HOST}/research/resources                                                                                                                                                                                                                                                                                                                                                                 |
            | hier1     | {CANONICAL_HOST}\|research\|resources\|resource\|89                                                                                                                                                                                                                                                                                                                                                 |
            | event1    |                                                                                                                                                                                                                                                                                                                                                                                                     |
            | event47   | /d{0,2}/                                                                                                                                                                                                                                                                                                                                                                                            |

    ###click events

    Scenario: R4R search results page fires an event after clicking on '<Back to results' link
        Given user is navigating to "/research/resources/search?from=0"
        When user clicks on 1 search result item
        When user clicks <Back to results link
        Then page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                    |
            | prop4     | D=pev1                                                   |
            | prop39    | /^r4r_results\|view\|none\|ra=0;tt=0;rt=0;tst=0\|1\|\d+/ |
            | prop40    | <resultTitle>                                            |
            | prop8     | english                                                  |
            | prop67    | D=pageName                                               |
            | evar2     | D=c8                                                     |
            | pev2      | R4R Click Event                                          |
            | link      | <resultTitle>                                            |
            | linkType  | lnk_o                                                    |
            | channel   | Research                                                 |
            | pageName  | {CANONICAL_HOST}/research/resources                      |
            | event42   |                                                          |

    Scenario: R4R search results page fires an event after searching for a keyword
        Given user is navigating to "/research/resources"
        When user types "tool" in the search bar
        And user clicks on the magnifying glass icon
        Then page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                   |
            | prop4     | D=pev1                                                  |
            | prop39    | /r4r_results\|view\|tool\|ra=0;tt=0;rt=0;tst=0\|1\|\d+/ |
            | prop40    | Home View                                               |
            | prop14    | tool                                                    |
            | prop11    | r4r_home_searchbar                                      |
            | prop8     | english                                                 |
            | prop67    | D=pageName                                              |
            | evar2     | D=c8                                                    |
            | pev2      | R4R Click Event                                         |
            | link      | Search                                                  |
            | linkType  | lnk_o                                                   |
            | channel   | Research                                                |
            | pageName  | {CANONICAL_HOST}/research/resources                     |
            | event2    |                                                         |
            | event39   |                                                         |

    Scenario: R4R resource page fires an event after clicking on Visit resource link
        Given user is navigating to "/research/resources/resource/89"
        When user clicks on Visit resource link
        And browser waits
        Then page click request is sent
        Then the following parameters should be captured
            | parameter | value                               |
            | prop4     | D=pev1                              |
            | prop39    | r4r_resource\|resource_click        |
            | prop40    | DevCan                              |
            | prop8     | english                             |
            | prop67    | D=pageName                          |
            | evar2     | D=c8                                |
            | link      | Visit Resource                      |
            | pev2      | R4R Click Event                     |
            | linkType  | lnk_o                               |
            | channel   | Research                            |
            | pageName  | {CANONICAL_HOST}/research/resources |
            | event67   |                                     |


    Scenario: R4R search results page fires an event after clicking on search result item
        Given user is navigating to "/research/resources/search?from=0"
        When user clicks on 1 search result item without navigation
        Then page click request is sent
        And browser waits
        Then the following parameters should be captured
            | parameter | value                                                   |
            | prop4     | D=pev1                                                  |
            | prop39    | /r4r_results\|view\|none\|ra=0;tt=0;rt=0;tst=0\|1\|\d+/ |
            | prop40    | <resultTitle>                                           |
            | prop8     | english                                                 |
            | prop67    | D=pageName                                              |
            | evar2     | D=c8                                                    |
            | pev2      | R4R Click Event                                         |
            | linkType  | lnk_o                                                   |
            | channel   | Research                                                |
            | pageName  | {CANONICAL_HOST}/research/resources                     |
            | event42   |                                                         |


