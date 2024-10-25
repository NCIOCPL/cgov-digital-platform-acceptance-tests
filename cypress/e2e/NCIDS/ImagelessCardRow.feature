Feature: NCIDS imageless card row container

    Scenario: as a user, I want to be able to see imageless card row compoment on mini landing pages
        Given user is navigating to "/test/ncids-imageless-card-test"
        Then the following imageless cards are displayed
            | cardIndex | componentVariant | cardType | linkHref                                             | title                                          | description                                                                                                                                |
            | 0         | one-card         | Internal | /about-nci                                           | About NCI                                      | This test override description will link to the About NCI page.                                                                            |
            | 1         | one-card         | External | https://www.google.com                               | External Link to Google                        | Test description for external Imageless Card.                                                                                              |
            | 2         | one-card         | Media    | /pediatric-match-infographic                         | Pediatric MATCH Infographic                    | Infographic explaining Pediatric MATCH, which is a clinical treatment trial using precision medicine for pediatric cancers.                |
            | 0         | two-card         | External | https://www.google.com                               | Second Test of External Card with Longer Title | This is the second external card in the 2-Imageless Card layout.                                                                           |
            | 1         | two-card         | Media    | /about-nci/organization/nci-at-a-glance              | Test Multimedia Card                           | This is a test of the multimedia card in the 2-Imageless Card layout.                                                                      |
            | 2         | two-card         | Internal | /about-cancer                                        | This is an Override Title for About Cancer     | none                                                                                                                                       |
            | 0         | three-card       | Media    | /about-nci/organization/nci-at-a-glance              | Override Title for Multimedia                  | Discover more about what NCI does, what we fund, and some highlights from our long history in leading cancer research in this infographic. |
            | 1         | three-card       | Internal | /types                                               | A to Z List of Cancer Types                    | none                                                                                                                                       |
            | 2         | three-card       | External | https://www.google.com                               | Imageless Card External                        | Description for Imageless Card External                                                                                                    |
            | 3         | three-card       | Media    | /about-nci/organization/screen-to-save-infographic-0 | Screen to Save Infographic                     | Override description for Multimedia                                                                                                        |
            | 4         | three-card       | Internal | /                                                    | Override Title for Homepage                    | Override Description for Imageless Card Internal                                                                                           |


    Scenario: Imageless card external card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 1 link on a 1 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                   |
            | prop4     | D=pev1                                                                  |
            | prop67    | D=pageName                                                              |
            | prop8     | english                                                                 |
            | prop57    | D=v64                                                                   |
            | prop58    | D=v65                                                                   |
            | prop59    | D=v66                                                                   |
            | prop60    | D=c67                                                                   |
            | prop68    | D=v68                                                                   |
            | evar2     | D=c8                                                                    |
            | evar64    | Internal\|The Optional Imageless Card Group Heading - One Ca\|About NCI |
            | evar65    | Imageless Card\|Not Defined\|1 Card Row                                 |
            | evar66    | 6\|2\|0\|0\|3\|1\|Not Defined                                           |
            | evar67    | Title\|1\|1                                                             |
            | evar68    | Body                                                                    |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                         |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test            |
            | event112  |                                                                         |
            | channel   | NCI Homepage                                                            |
            | pev2      | MLP:ImagelessCard:LinkClick                                             |
            | linkType  | lnk_o                                                                   |

    Scenario: Imageless card external card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 1 link on a 2 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                        |
            | prop4     | D=pev1                                                                                                       |
            | prop67    | D=pageName                                                                                                   |
            | prop8     | english                                                                                                      |
            | prop57    | D=v64                                                                                                        |
            | prop58    | D=v65                                                                                                        |
            | prop59    | D=v66                                                                                                        |
            | prop60    | D=c67                                                                                                        |
            | prop68    | D=v68                                                                                                        |
            | evar2     | D=c8                                                                                                         |
            | evar64    | External\|The Optional Imageless Card Group Heading - Two Ca\|Second Test of External Card with Longer Title |
            | evar65    | Imageless Card\|Not Defined\|2 Card Row                                                                      |
            | evar66    | 6\|4\|0\|0\|3\|1\|Not Defined                                                                              |
            | evar67    | Title\|1\|1                                                                                                  |
            | evar68    | Body                                                                                                         |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                                                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test                                                 |
            | event112  |                                                                                                              |
            | channel   | NCI Homepage                                                                                                 |
            | pev2      | MLP:ImagelessCard:LinkClick                                                                                  |
            | linkType  | lnk_o                                                                                                        |




    Scenario: Imageless card media card click event
        Given user is navigating to "/test/ncids-imageless-card-test"
        When user clicks on 1 link on a 3 NCIDS imageless card row
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                        |
            | prop4     | D=pev1                                                                                                       |
            | prop67    | D=pageName                                                                                                   |
            | prop8     | english                                                                                                      |
            | prop57    | D=v64                                                                                                        |
            | prop58    | D=v65                                                                                                        |
            | prop59    | D=v66                                                                                                        |
            | prop60    | D=c67                                                                                                        |
            | prop68    | D=v68                                                                                                        |
            | evar2     | D=c8                                                                                                         |
            | evar64    | Media\|The Optional Imageless Card Group Heading - Three \|Override Title for Multimedia|
            | evar65    | Imageless Card\|Not Defined\|3 Card Row                                                                      |
            | evar66    | 6\|6\|0\|0\|5\|1\|Not Defined                                                                            |
            | evar67    | Title\|1\|1                                                                                                  |
            | evar68    | Body                                                                                                         |
            | pageName  | {CANONICAL_HOST}/test/ncids-imageless-card-test                                                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-imageless-card-test                                                 |
            | event112  |                                                                                                              |
            | channel   | NCI Homepage                                                                                                 |
            | pev2      | MLP:ImagelessCard:LinkClick                                                                                  |
            | linkType  | lnk_o                                                                                                        |

