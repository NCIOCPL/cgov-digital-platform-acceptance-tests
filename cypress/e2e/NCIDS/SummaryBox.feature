Feature: As a user I want to be able to see NCIDS Summary Box on the site

    Scenario: Summary box internal link click event
        Given user is navigating to "/test/ncids-mini-landing-summary-box"
        When user clicks on 1 link "/about-cancer" in summary box
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                                      |
            | prop4     | D=pev1                                                                     |
            | prop8     | english                                                                    |
            | prop57    | D=v64                                                                      |
            | prop58    | D=v65                                                                      |
            | prop59    | D=v66                                                                      |
            | prop60    | D=c67                                                                      |
            | prop67    | D=pageName                                                                 |
            | prop68    | D=v68                                                                      |
            | evar2     | D=c8                                                                       |
            | evar64    | Internal\|This is an example of a very long heading using th\|About Cancer |
            | evar65    | Summary Box\|Not Defined\|Not Defined                                      |
            | evar66    | 2\|1\|0\|0\|1\|1\|Not Defined                                                |
            | evar67    | Text\|4\|1                                                                 |
            | evar68    | Body                                                                       |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-summary-box                       |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-summary-box          |
            | event112  |                                                                            |
            | channel   | NCI Homepage                                                               |
            | pev2      | MLP:SummaryBox:LinkClick                                                   |
            | linkType  | lnk_o                                                                      |

    Scenario: Summary box external link click event
            Given user is navigating to "/test/ncids-mini-landing-summary-box"
            When user clicks on 1 link "https://www.google.com/" in summary box
            Then page click request is sent
            And browser waits
            And the following parameters should be captured
                | parameter | value                                                                      |
                | prop4     | D=pev1                                                                     |
                | prop8     | english                                                                    |
                | prop57    | D=v64                                                                      |
                | prop58    | D=v65                                                                      |
                | prop59    | D=v66                                                                      |
                | prop60    | D=c67                                                                      |
                | prop67    | D=pageName                                                                 |
                | prop68    | D=v68                                                                      |
                | evar2     | D=c8                                                                       |
                | evar64    | External\|This is an example of a very long heading using th\|Google |
                | evar65    | Summary Box\|Not Defined\|Not Defined                                      |
                | evar66    | 2\|1\|0\|0\|1\|1\|Not Defined                                                |
                | evar67    | Text\|4\|4                                                                 |
                | evar68    | Body                                                                       |
                | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-summary-box                       |
                | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-summary-box          |
                | event112  |                                                                            |
                | channel   | NCI Homepage                                                               |
                | pev2      | MLP:SummaryBox:LinkClick                                                   |
                | linkType  | lnk_o                                                                      |

    Scenario: Summary box media link click event
        Given user is navigating to "/test/ncids-mini-landing-summary-box"
        When user clicks on 1 link "/research/progress/discovery/test-file-url" in summary box
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                                            |
            | prop4     | D=pev1                                                                           |
            | prop8     | english                                                                          |
            | prop57    | D=v64                                                                            |
            | prop58    | D=v65                                                                            |
            | prop59    | D=v66                                                                            |
            | prop60    | D=c67                                                                            |
            | prop67    | D=pageName                                                                       |
            | prop68    | D=v68                                                                            |
            | evar2     | D=c8                                                                             |
            | evar64    | Internal\|This is an example of a very long heading using th\|Test File Download |
            | evar65    | Summary Box\|Not Defined\|Not Defined                                            |
            | evar66    | 2\|1\|0\|0\|1\|1\|Not Defined                                                      |
            | evar67    | Text\|4\|3                                                                       |
            | evar68    | Body                                                                             |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-summary-box                             |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-summary-box                |
            | event112  |                                                                                  |
            | channel   | NCI Homepage                                                                     |
            | pev2      | MLP:SummaryBox:LinkClick                                                         |
            | linkType  | lnk_o                                                                            |

    Scenario: Summary box other link click event
        Given user is navigating to "/test/ncids-mini-landing-summary-box"
        When user clicks on 1 link "tel:1-555-867-5309" in summary box
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                             |
            | prop4     | D=pev1                                                            |
            | prop8     | english                                                           |
            | prop57    | D=v64                                                             |
            | prop58    | D=v65                                                             |
            | prop59    | D=v66                                                             |
            | prop60    | D=c67                                                             |
            | prop67    | D=pageName                                                        |
            | prop68    | D=v68                                                             |
            | evar2     | D=c8                                                              |
            | evar64    | Other\|Not Defined\|Call Jenny                                    |
            | evar65    | Summary Box\|Not Defined\|Not Defined                             |
            | evar66    | 2\|2\|0\|0\|1\|1\|Not Defined                                       |
            | evar67    | Text\|2\|2                                                        |
            | evar68    | Body                                                              |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-summary-box              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-summary-box |
            | event112  |                                                                   |
            | channel   | NCI Homepage                                                      |
            | pev2      | MLP:SummaryBox:LinkClick                                          |
            | linkType  | lnk_o                                                             |