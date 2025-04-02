Feature: NCIDS imageless card row container

    Scenario: as a user, I want to be able to see imageless card row compoment on mini landing pages
        Given user is navigating to "/test/ncids-imageless-card-test"
        Then the following imageless cards are displayed
            | cardIndex | componentVariant | cardType | linkHref                                             | title                       | description                                      |
            | 0         | one-card         | External | https://www.cancer.gov                               | Default Option              | Test description for default option.             |
            | 1         | one-card         | External | https://www.cancer.gov                               | Force Display Option        | Test description for force display option.       |
            | 2         | one-card         | External | https://www.cancer.gov                               | Force Hide Option           | Test description for force hide option.          |
            | 0         | two-card         | External | https://www.google.com                               | Default Option              | Test description for default option.             |
            | 1         | two-card         | External | https://www.google.com                               | Force Display Option        | Test description for force display option.       |
            | 2         | two-card         | External | https://www.google.com                               | Force Hide Option           | Test description for force hide option.          |
            | 0         | three-card       | External | https://www.google.com                               | Default Option              | Test description for default option.             |
            | 1         | three-card       | External | https://www.cancer.gov                               | Force Display Option        | Test description for force display option.       |
            | 2         | three-card       | External | https://www.google.com                               | Force Hide Option           | Test description for force hide option.          |
            | 3         | three-card       | Media    | /about-nci/organization/screen-to-save-infographic-0 | Screen to Save Infographic  | Override description for Multimedia              |
            | 4         | three-card       | Internal | /                                                    | Override Title for Homepage | Override Description for Imageless Card Internal |


    Scenario: Imageless card external card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 1 link on a 1 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                        |
            | prop4     | D=pev1                                                                       |
            | prop67    | D=pageName                                                                   |
            | prop8     | english                                                                      |
            | prop57    | D=v64                                                                        |
            | prop58    | D=v65                                                                        |
            | prop59    | D=v66                                                                        |
            | prop60    | D=c67                                                                        |
            | prop68    | D=v68                                                                        |
            | evar2     | D=c8                                                                         |
            | evar64    | External\|The Optional Imageless Card Group Heading - One Ca\|Default Option |
            | evar65    | Imageless Card\|Not Defined\|1 Card Row                                      |
            | evar66    | 7\|3\|0\|0\|3\|1\|Not Defined                                                |
            | evar67    | Title\|1\|1                                                                  |
            | evar68    | Body                                                                         |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test                 |
            | event112  |                                                                              |
            | channel   | NCI Homepage                                                                 |
            | pev2      | MLP:ImagelessCard:LinkClick                                                  |
            | linkType  | lnk_o                                                                        |

    Scenario: Imageless card external card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 1 link on a 2 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                        |
            | prop4     | D=pev1                                                                       |
            | prop67    | D=pageName                                                                   |
            | prop8     | english                                                                      |
            | prop57    | D=v64                                                                        |
            | prop58    | D=v65                                                                        |
            | prop59    | D=v66                                                                        |
            | prop60    | D=c67                                                                        |
            | prop68    | D=v68                                                                        |
            | evar2     | D=c8                                                                         |
            | evar64    | External\|The Optional Imageless Card Group Heading - Two Ca\|Default Option |
            | evar65    | Imageless Card\|Not Defined\|2 Card Row                                      |
            | evar66    | 7\|5\|0\|0\|3\|1\|Not Defined                                                |
            | evar67    | Title\|1\|1                                                                  |
            | evar68    | Body                                                                         |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test                 |
            | event112  |                                                                              |
            | channel   | NCI Homepage                                                                 |
            | pev2      | MLP:ImagelessCard:LinkClick                                                  |
            | linkType  | lnk_o                                                                        |




    Scenario: Imageless card media card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 4 link on a 3 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                 |
            | prop4     | D=pev1                                                                                |
            | prop67    | D=pageName                                                                            |
            | prop8     | english                                                                               |
            | prop57    | D=v64                                                                                 |
            | prop58    | D=v65                                                                                 |
            | prop59    | D=v66                                                                                 |
            | prop60    | D=c67                                                                                 |
            | prop68    | D=v68                                                                                 |
            | evar2     | D=c8                                                                                  |
            | evar64    | Media\|The Optional Imageless Card Group Heading - Three \|Screen to Save Infographic |
            | evar65    | Imageless Card\|Not Defined\|3 Card Row                                               |
            | evar66    | 7\|7\|0\|0\|5\|4\|Not Defined                                                         |
            | evar67    | Title\|1\|1                                                                           |
            | evar68    | Body                                                                                  |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                                       |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test                          |
            | event112  |                                                                                       |
            | channel   | NCI Homepage                                                                          |
            | pev2      | MLP:ImagelessCard:LinkClick                                                           |
            | linkType  | lnk_o                                                                                 |

