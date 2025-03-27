Feature: As a user I want to be able to add Hero and CTA components onto Home and landing page

    Scenario Outline: CTA on home and landong without a title
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-cta-test"
        And CTA strip has the following links
            | title                             | link                                      |
            | Learn More                        | https://www.google.com                    |
            | [Internal Promo Block] Card Title | /test/internal-promo-block-test-article   |
            | [Guide Card] Browser Title        | /test/internal-promo-block-test-article-0 |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario Outline: NCIDS Hero with a button
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-hero-button-test"
        And NCIDS Hero is displayed
        And tagline title reads "NCI is the nation's leader in cancer research"
        And tagline button has text "Default" with link "https://www.google.com"

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Default NCIDS Hero
        Given user is navigating to "/ncids-hero-default-test"
        And NCIDS Hero is displayed
        And tagline title reads "NCI is the nation's leader in cancer research"
        And tagline button doesn't exist


    Scenario: Analytics Hero Link click
        Given user is navigating to "/ncids-hero-button-test"
        When user clicks on tagline button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                            |
            | prop4     | D=pev1                                                           |
            | prop67    | D=pageName                                                       |
            | prop8     | english                                                          |
            | prop57    | D=v64                                                            |
            | prop58    | D=v65                                                            |
            | prop59    | D=v66                                                            |
            | prop60    | D=c67                                                            |
            | prop68    | D=v68                                                            |
            | evar2     | D=c8                                                             |
            | evar64    | External\|NCI is the nation's leader in cancer research\|Default |
            | evar65    | Hero\|Light\|Button with no CTA Strip                            |
            | evar66    | 3\|1\|0\|0\|1\|1                                                 |
            | evar67    | Primary Button\|1\|1-1                                           |
            | evar68    | Body                                                             |
            | pageName  | {CANONICAL_HOST}/ncids-hero-button-test                          |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-hero-button-test             |
            | event27   |                                                                  |
            | channel   | NCI Homepage                                                     |
            | pev2      | LP:Hero:LinkClick                                                |
            | linkType  | lnk_o                                                            |


    Scenario: Analytics CTA Link click
        Given user is navigating to "/ncids-cta-test"
        When user clicks on cta link at position 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                             |
            | prop4     | D=pev1                                                            |
            | prop67    | D=pageName                                                        |
            | prop8     | english                                                           |
            | prop57    | D=v64                                                             |
            | prop58    | D=v65                                                             |
            | prop59    | D=v66                                                             |
            | prop60    | D=c67                                                             |
            | prop68    | D=v68                                                             |
            | evar2     | D=c8                                                              |
            | evar64    | Internal\|Call to Action Strip\|[Internal Promo Block] Card Title |
            | evar65    | CTA Strip\|Dark\|Standard                                         |
            | evar66    | 3\|1\|0\|0\|1\|1                                                  |
            | evar67    | Button\|3\|2                                                      |
            | evar68    | Body                                                              |
            | pageName  | {CANONICAL_HOST}/ncids-cta-test                                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-cta-test                      |
            | event27   |                                                                   |
            | channel   | NCI Homepage                                                      |
            | pev2      | LP:CTAStrip:LinkClick                                             |
            | linkType  | lnk_o                                                             |
