Feature: As a user, I want to be able to see article page components


    Scenario: Glossified link click event in intro text
        Given user is navigating to "/test/ncids-article-def-link-test"
        When user clicks on glossified link with id "304687" in intro text
        And popup loads
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop67    | D=pageName                                                     |
            | evar2     | D=c8                                                           |
            | evar60    | glossifiedTerm                                                 |
            | evar81    | Glossified Link\|Glossary Load                                 |
            | evar82    | Glossified Link\|chest x-rays                                  |
            | evar85    | chest x-rays\|304687                                           |
            | evar84    | Glossified Link\|8\|1                                          |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-article-def-link-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-article-def-link-test |
            | event91   |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | Body:Glossified:PopupLoad                                      |
            | linkType  | lnk_o                                                          |

    Scenario: Glossified link click event in the body
        Given user is navigating to "/test/ncids-article-def-link-test"
        When user clicks on glossified link with id "304687" in the body
        And popup loads
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop67    | D=pageName                                                     |
            | evar2     | D=c8                                                           |
            | evar60    | glossifiedTerm                                                 |
            | evar81    | Glossified Link\|Glossary Load                                 |
            | evar82    | Glossified Link\|chest x-rays                                  |
            | evar85    | chest x-rays\|304687                                           |
            | evar84    | Glossified Link\|8\|5                                          |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-article-def-link-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-article-def-link-test |
            | event91   |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | Body:Glossified:PopupLoad                                      |
            | linkType  | lnk_o                                                          |


    Scenario: External Feature card click event
        Given user is navigating to "/test/article-feature-card-embed-test-page"
        When user clicks on NCIDS feature card at position 9
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                             |
            | prop4     | D=pev1                                                                            |
            | prop8     | english                                                                           |
            | prop67    | D=pageName                                                                        |
            | evar2     | D=c8                                                                              |
            | evar60    | EmbeddedCardClick                                                                 |
            | evar81    | Embedded Card\|External                                                           |
            | evar82    | Embedded Card\|Testing for Derek Override Title\|Testing for Derek Override Title |
            | evar86    | Feature\|None\|Title                                                              |
            | evar68    | Body                                                                              |
            | pageName  | {CANONICAL_HOST}/test/article-feature-card-embed-test-page                        |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/article-feature-card-embed-test-page           |
            | event135  |                                                                                   |
            | channel   | NCI Homepage                                                                      |
            | pev2      | Body:EmbeddedCard:LinkClick                                                       |
            | linkType  | lnk_o                                                                             |

    Scenario: Internal Feature card click event
        Given user is navigating to "/test/article-feature-card-embed-test-page"
        When user clicks on NCIDS feature card at position 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                   |
            | prop4     | D=pev1                                                                  |
            | prop8     | english                                                                 |
            | prop67    | D=pageName                                                              |
            | evar2     | D=c8                                                                    |
            | evar60    | EmbeddedCardClick                                                       |
            | evar81    | Embedded Card\|Internal                                                 |
            | evar82    | Embedded Card\|Learning to Relax\|Learning to Relax                     |
            | evar86    | Feature\|Left\|Image                                                    |
            | evar68    | Body                                                                    |
            | pageName  | {CANONICAL_HOST}/test/article-feature-card-embed-test-page              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/article-feature-card-embed-test-page |
            | event135  |                                                                         |
            | channel   | NCI Homepage                                                            |
            | pev2      | Body:EmbeddedCard:LinkClick                                             |
            | linkType  | lnk_o                                                                   |


    Scenario: Embedded video click event
        Given user is navigating to "/test/embedded-video-sizes-caption-ad"
        When user clicks on 1 video
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                 |
            | prop4     | D=pev1                                                                |
            | prop8     | english                                                               |
            | prop67    | D=pageName                                                            |
            | evar2     | D=c8                                                                  |
            | evar81    | Embedded Video\|play                                                  |
            | evar82    | Video\|Nonspecific Immune Stimulation\|Nonspecific Immune Stimulation |
            | evar68    | Body                                                                  |
            | pageName  | {CANONICAL_HOST}/test/embedded-video-sizes-caption-ad                 |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/embedded-video-sizes-caption-ad    |
            | event51   |                                                                       |
            | channel   | NCI Homepage                                                          |
            | pev2      | Body:EmbeddedMedia:LinkClick                                          |
            | linkType  | lnk_o                                                                 |


