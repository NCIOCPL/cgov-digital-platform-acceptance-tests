Feature: As a user I want to be able to add a NCIDS flag card group component onto a page

    Scenario Outline: Flag card group components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/test/ncids-flag-card-test"
        And the optional flag card group heading is "The Optional Flag Card Group Heading"
        Then NCIDS flag cards have the following attributes
            | index | title                   | description                                                                                                                                                                                  | link                                    | altText              | source                                                                            | file                         |
            | 0     | About Cancer            | This flag card is an internal link to About Cancer                                                                                                                                           | /about-cancer                           | No Image Placeholder | /default/files/styles/ncids_promo_1x1/module/cgov_image                           | placeholder-1x1.png          |
            | 1     | External Card to Google | This is an extremely long description on an external card that will redirect the user to Google.com. Extra text in this card to test the behavior of a card when the text is very very long. | https://www.google.com                  | Override Placeholder | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | override-placeholder-1x1.png |
            | 2     | NCI at a Glance         | Discover more about what NCI does, what we fund, and some highlights from our long history in leading cancer research in this infographic.                                                   | /about-nci/organization/nci-at-a-glance | Promo Placeholder    | /sites/default/files/styles/ncids_promo_1x1/public/cgov_image/ncids_promo_art_1x1 | promo-placeholder-1x1.png    |
            | 3     | Cancer Types            | none                                                                                                                                                                                         | /types                                  | No Image Placeholder | /default/files/styles/ncids_promo_1x1/module/cgov_image                           | placeholder-1x1.png          |
            | 4     | Cancer Research         | This is another card that should be on its own line when cards appear in the side-by-side orientation.                                                                                       | /research                               | No Image Placeholder | /default/files/styles/ncids_promo_1x1/module/cgov_image                           | placeholder-1x1.png          |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Flag card external button click event
        Given user is navigating to "/test/ncids-flag-card-test"
        When user clicks on 2 flag card
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
            | evar64    | External\|The Optional Flag Card Group Heading\|External Card to Google |
            | evar65    | Flag Card\|Not Defined\|Not Defined                                     |
            | evar66    | 3\|3\|0\|0\|5\|2\|undefined                                             |
            | evar67    | Card\|1\|1                                                              |
            | evar68    | Body                                                                    |
            | pageName  | {CANONICAL_HOST}/test/ncids-flag-card-test                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-flag-card-test                 |
            | event112  |                                                                         |
            | channel   | NCI Homepage                                                            |
            | pev2      | MLP:FlagCard:LinkClick                                                  |
            | linkType  | lnk_o                                                                   |

    Scenario: Flag card internal button click event
        Given user is navigating to "/test/ncids-flag-card-test"
        When user clicks on 1 flag card
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
            | evar64    | Internal\|The Optional Flag Card Group Heading\|About Cancer |
            | evar65    | Flag Card\|Not Defined\|Not Defined                                     |
            | evar66    | 3\|3\|0\|0\|5\|1\|undefined                                             |
            | evar67    | Card\|1\|1                                                              |
            | evar68    | Body                                                                    |
            | pageName  | {CANONICAL_HOST}/test/ncids-flag-card-test                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-flag-card-test                 |
            | event112  |                                                                         |
            | channel   | NCI Homepage                                                            |
            | pev2      | MLP:FlagCard:LinkClick                                                  |
            | linkType  | lnk_o                                                                   |

Scenario: Flag card media click event
    Given user is navigating to "/test/ncids-flag-card-test"
    When user clicks on 3 flag card
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
            | evar64    | Media\|The Optional Flag Card Group Heading\|NCI at a Glance |
            | evar65    | Flag Card\|Not Defined\|Not Defined                                     |
            | evar66    | 3\|3\|0\|0\|5\|3\|undefined                                             |
            | evar67    | Card\|1\|1                                                              |
            | evar68    | Body                                                                    |
            | pageName  | {CANONICAL_HOST}/test/ncids-flag-card-test                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-flag-card-test                 |
            | event112  |                                                                         |
            | channel   | NCI Homepage                                                            |
            | pev2      | MLP:FlagCard:LinkClick                                                  |
            | linkType  | lnk_o                                                                   |





