Feature: As a user I want to be able to add a NCIDS guide card component onto a page

    Scenario Outline: Guide card components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/ncids-guide-card-test"
        Then NCIDS guide cards have the following attributes
            | index | title                                                                      | description                                                                                                                                                                      | btnLinkAndText                                                                                                                                                                                                                                                                                                                                                                                                 |
            | 0     | Patients and Caregivers, with a Title Long Enough to Wrap to a Second Line | NCI is the nation's trusted source for cancer information. We're here with information about causes and risk factors, early detection and diagnosis, and treatment options.      | Default External\|https://www.google.com;Default Internal\|https://www.cancer.gov;Force Display External\|https://www.google.com;Force Display Internal\|https://www.cancer.gov;Force Hide External\|https://www.google.com;Force Hide Internal\|https://www.cancer.gov                                                                                                                                        |
            | 1     | Researchers                                                                | Support for the best science underpins everything NCI does. NCI supports the best scientists and research projects through a rigorous grant application and peer review process. | Learn More\|https://www.google.com;Learn More 1\|https://www.google.com;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m\|/test/internal-promo-block-test-article;[Guide Card] Browser Title\|/test/internal-promo-block-test-article-0;Internal Button Text\|/test/internal-promo-block-test-article-0;Feelings and Cancer\|/about-cancer/coping/feelings |
        And NCIDS "guide-card" component does not have "aria-labelledby" but has header "id" attributes

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: 3 Guide card row components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/ncids-guide-card-test"
        And the 1 NCIDS 3 guide card row has a heading "Your Guide to NCI Grants & Training"
        Then NCIDS 3 guide card row at position 1 have the following attributes
            | index | title                  | btnLinkAndText                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
            | 0     | Research Grant Funding | Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m\|https://www.google.com;Learn More 1\|https://www.google.com;[Internal Promo Block] Card Title\|/test/internal-promo-block-test-article;[Guide Card] Browser Title\|/test/internal-promo-block-test-article-0;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m\|/test/internal-promo-block-test-article-0;Feelings and Cancer\|/about-cancer/coping/feelings |
            | 1     | Grant Process          | Default External\|https://www.google.com;Default Internal\|https://www.cancer.gov;Force Display External\|https://www.google.com;Force Display Internal\|https://www.cancer.gov;Force Hide External\|https://www.google.com;Force Hide Internal\|https://www.cancer.gov                                                                                                                                                                                                                                               |
            | 2     | Funding for Training   | Learn More\|https://www.google.com;Learn More 1\|https://www.google.com;[Internal Promo Block] Card Title\|/test/internal-promo-block-test-article;[Guide Card] Browser Title\|/test/internal-promo-block-test-article-0                                                                                                                                                                                                                                                                                              |
        And the 2 NCIDS 3 guide card row has no heading



    Scenario: Guide card external button click event
        Given user is navigating to "/ncids-guide-card-test"
        When user clicks on "Default External" button on a 1 NCIDS guide card
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                            |
            | prop4     | D=pev1                                                                                                           |
            | prop67    | D=pageName                                                                                                       |
            | prop8     | english                                                                                                          |
            | prop57    | D=v64                                                                                                            |
            | prop58    | D=v65                                                                                                            |
            | prop59    | D=v66                                                                                                            |
            | prop60    | D=c67                                                                                                            |
            | prop68    | D=v68                                                                                                            |
            | evar2     | D=c8                                                                                                             |
            | evar64    | External\|Patients and Caregivers, with a Title Long Enough \|Default External |
            | evar65    | Guide Card\|Light\|Image and Description                                                                         |
            | evar66    | 5\|1\|0\|0\|2\|1                                                                                                 |
            | evar67    | Button\|6\|1                                                                                                     |
            | evar68    | Body                                                                                                             |
            | pageName  | {CANONICAL_HOST}/ncids-guide-card-test                                                                           |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-guide-card-test                                                              |
            | event27   |                                                                                                                  |
            | channel   | NCI Homepage                                                                                                     |
            | pev2      | LP:GuideCard:LinkClick                                                                                           |
            | linkType  | lnk_o                                                                                                            |

    Scenario: Guide card internal button click event
        Given user is navigating to "/ncids-guide-card-test"
        When user clicks on "Feelings and Cancer" button on a 2 NCIDS guide card
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                               |
            | prop4     | D=pev1                                              |
            | prop67    | D=pageName                                          |
            | prop8     | english                                             |
            | prop57    | D=v64                                               |
            | prop58    | D=v65                                               |
            | prop59    | D=v66                                               |
            | prop60    | D=c67                                               |
            | prop68    | D=v68                                               |
            | evar2     | D=c8                                                |
            | evar64    | Internal\|Researchers\|Feelings and Cancer          |
            | evar65    | Guide Card\|Light\|Image and Description            |
            | evar66    | 5\|1\|0\|0\|2\|2                                    |
            | evar67    | Button\|6\|6                                        |
            | evar68    | Body                                                |
            | pageName  | {CANONICAL_HOST}/ncids-guide-card-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-guide-card-test |
            | event27   |                                                     |
            | channel   | NCI Homepage                                        |
            | pev2      | LP:GuideCard:LinkClick                              |
            | linkType  | lnk_o                                               |



