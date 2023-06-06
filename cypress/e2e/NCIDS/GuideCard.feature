Feature: As a user I want to be able to add a NCIDS guide card component onto a page

    Scenario Outline: Guide card components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/ncids-guide-card-test"
        Then NCIDS guide cards have the following attributes
            | index | title                                                                      | description                                                                                                                                                                      | btnLinkAndText                                                                                                                                                                                                                                                                                                                        |
            | 0     | Patients and Caregivers, with a Title Long Enough to Wrap to a Second Line | NCI is the nation's trusted source for cancer information. We're here with information about causes and risk factors, early detection and diagnosis, and treatment options.      | Learn More,https://www.google.com                                                                                                                                                                                                                                                                                                     |
            | 1     | Researchers                                                                | Support for the best science underpins everything NCI does. NCI supports the best scientists and research projects through a rigorous grant application and peer review process. | Learn More,https://www.google.com;Learn More 1,https://www.google.com;[Internal Promo Block] Card Title,/test/internal-promo-block-test-article;[Guide Card] Browser Title,/test/internal-promo-block-test-article-0;Internal Button Text,/test/internal-promo-block-test-article-0;Feelings and Cancer,/about-cancer/coping/feelings |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Guide card external button click event
        Given user is navigating to "/ncids-guide-card-test"
        When user clicks on "Learn More" button on a 1 NCIDS guide card
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                    |
            | prop4     | D=pev1                                                                   |
            | prop67    | D=pageName                                                               |
            | prop8     | english                                                                  |
            | prop57    | D=v64                                                                    |
            | prop58    | D=v65                                                                    |
            | prop59    | D=v66                                                                    |
            | prop60    | D=c67                                                                    |
            | prop68    | D=v68                                                                    |
            | evar2     | D=c8                                                                     |
            | evar64    | External\|Patients and Caregivers, with a Title Long Enough \|Learn More |
            | evar65    | Guide Card\|Light\|Image and Description                                 |
            | evar66    | 3\|1\|2\|1                                                               |
            | evar67    | Button\|1\|1                                                             |
            | evar68    | Body                                                                     |
            | pageName  | {CANONICAL_HOST}/ncids-guide-card-test                                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-guide-card-test                      |
            | event27   |                                                                          |
            | channel   | NCI Homepage                                                             |
            | pev2      | LP:GuideCard:LinkClick                                                   |
            | linkType  | lnk_o                                                                    |

 Scenario: Guide card internal button click event
        Given user is navigating to "/ncids-guide-card-test"
        When user clicks on "Feelings and Cancer" button on a 2 NCIDS guide card
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                    |
            | prop4     | D=pev1                                                                   |
            | prop67    | D=pageName                                                               |
            | prop8     | english                                                                  |
            | prop57    | D=v64                                                                    |
            | prop58    | D=v65                                                                    |
            | prop59    | D=v66                                                                    |
            | prop60    | D=c67                                                                    |
            | prop68    | D=v68                                                                    |
            | evar2     | D=c8                                                                     |
            | evar64    | Internal\|Researchers\|Feelings and Cancer |
            | evar65    | Guide Card\|Light\|Image and Description                                 |
            | evar66    | 3\|1\|2\|2                                                               |
            | evar67    | Button\|6\|6                                                             |
            | evar68    | Body                                                                     |
            | pageName  | {CANONICAL_HOST}/ncids-guide-card-test                                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-guide-card-test                      |
            | event27   |                                                                          |
            | channel   | NCI Homepage                                                             |
            | pev2      | LP:GuideCard:LinkClick                                                   |
            | linkType  | lnk_o                                                                    |



