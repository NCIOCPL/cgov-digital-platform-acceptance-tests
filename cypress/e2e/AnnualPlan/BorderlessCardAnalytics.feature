Feature: Analytics should fire when user click on title, image or button of a borderless feature card

    Scenario Outline: Click events for borderless full-width card click
        Given user is navigating to "/test/borderless-card"
        When user clicks on a "<cardComponent>" of borderless card at position 1
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                         |
            | event27   |                                               |
            | prop4     | D=pev1                                        |
            | prop8     | english                                       |
            | prop59    | fullwidth:1                                   |
            | prop60    | D=pageName                                    |
            | prop67    | D=pageName                                    |
            | evar2     | english                                       |
            | channel   | NCI Homepage                                  |
            | pageName  | {CANONICAL_HOST}/test/borderless-card         |
            | pageURL   | https://{CANONICAL_HOST}/test/borderless-card |
            | prop57    | /\n*\t*\[Lead IMG Crops\] Card Title\n*\t*/   |
            | prop58    | /\n*\t*\[Lead IMG Crops\] Card Title\n*\t*/   |

        Examples:
            | cardComponent |
            | title         |
            | button        |
            | image         |


    Scenario Outline: Click events for borderless full-width card click on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/test/borderless-card"
        When user clicks on a "<cardComponent>" of borderless card at position 3
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                         |
            | event27   |                                               |
            | prop4     | D=pev1                                        |
            | prop8     | english                                       |
            | prop59    | fullwidth:3                                   |
            | prop60    | D=pageName                                    |
            | prop67    | D=pageName                                    |
            | evar2     | english                                       |
            | channel   | NCI Homepage                                  |
            | pageName  | {CANONICAL_HOST}/test/borderless-card         |
            | pageURL   | https://{CANONICAL_HOST}/test/borderless-card |
            | prop58    | /\n*\t*\[No IMG\] Card Title\n*\t*/           |
            | prop57    | /\n*\t*\[No IMG\] Card Title\n*\t*/           |

        Examples:
            | cardComponent |
            | title         |
            | button        |