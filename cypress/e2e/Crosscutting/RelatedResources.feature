Feature: Related Resources Tests

    Scenario Outline: User is able to verify the presence of related resouces section, links etc.
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then related resources section is visible
        And related resources have working link "<linkText>" with the href "<linkHref>"

        Examples:
            | breakpoint | url                                                                                 | linkText                                | linkHref                                             |
            | desktop    | about-cancer/coping/feelings                                                        | Learning to Relax                       | /about-cancer/coping/feelings/relaxation             |
            | desktop    | espanol/cancer/sobrellevar/sentimientos                                             | Aprenda a relajarse                     | /espanol/cancer/sobrellevar/sentimientos/relajarse   |
            | desktop    | espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion | Vitamina D y prevención del cáncer      | /espanol/hoja-informativa-vitamina-d                 |
            | tablet     | news-events/cancer-currents-blog/2019/vitamin-d-supplement-cancer-prevention        | Vitamin D and Cancer Prevention         | /about-cancer/causes-prevention/vitamin-d-fact-sheet |
            | tablet     | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                         | Sexual Health Issues in Men with Cancer | /about-cancer/coping/placeholder-men                 |
            | mobile     | about-cancer/coping/feelings/relaxation/duke-university                             | Feelings and Cancer                     | /about-cancer/coping/feelings                        |
            | mobile     | about-cancer/coping/feelings/relaxation/loukissas-jen-biography                     | Feelings and Cancer                     | /about-cancer/coping/feelings                        |
            | mobile     | espanol/cancer/sobrellevar/sentimientos/stress-fact-sheet                           | Aprenda a relajarse                     | /espanol/cancer/sobrellevar/sentimientos/relajarse   |

    Scenario Outline: Verify exit disclaimer
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then related resources section is visible
        And exit disclaimer is visible "<exitDisclaimer>"

        Examples:
            | breakpoint | url                                                                                        | exitDisclaimer                |
            | mobile     | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                                | 0,N/A;1,N/A;2,yes;3,yes;4,yes |
            | mobile     | about-cancer/coping/feelings                                                               | 0,N/A;1,N/A;2,yes             |
            | tablet     | espanol/cancer/sobrellevar/sentimientos                                                    | 0,N/A;1,N/A;2,yes             |
            | tablet     | news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | 0,N/A;1,N/A;2,N/A;3,yes       |
            | desktop    | about-cancer/coping/feelings/relaxation/duke-university                                    | 0,N/A;1,N/A;2,N/A;3,yes;4,yes |
            | desktop    | about-cancer/coping/feelings/relaxation/loukissas-jen-biography                            | 0,N/A;1,N/A;2,N/A;3,yes;4,yes |

    Scenario Outline: Negative: Verify pages without related resources
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then related resources section does not exist

        Examples:
            | breakpoint | url                                                                         |
            | mobile     | espanol/noticias/temas-y-relatos-blog/2019/my-blog-post                     |
            | tablet     | news-events/cancer-currents-blog/2019/human-tumor-atlas-network-cancer-maps |
            | desktop    | news-events/press-releases/2019/deep-learning-cervical-cancer-screening     |

    Scenario Outline: Negative: Verify pages without exit disclaimers
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then related resources section is visible
        And exit disclaimer is not visible

        Examples:
            | breakpoint | url                                                                                 |
            | mobile     | espanol/cancer/sobrellevar/self-image                                               |
            | desktop    | espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion |

    Scenario Outline: Click event fires when user clicks on related resource link
        Given user is navigating to "about-cancer/coping/feelings"
        When user clicks on <index> related resource link
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                      |
            | prop4     | D=pev1                                                     |
            | prop67    | D=pageName                                                 |
            | prop8     | english                                                    |
            | evar2     | D=c8                                                       |
            | evar61    | cgvArticle\|default                                        |
            | evar68    | Body                                                       |
            | evar81    | <evar81>                                                   |
            | evar82    | Related Resources                                          |
            | evar83    | <evar83>                                                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings              |
            | event57   |                                                            |
            | pev2      | Inner:RelatedResources:LinkClick                           |


        Examples:
            | index | evar81                                           | evar83                  |
            | 1     | Internal\|Learning to Relax\|Related Resources   | Related Resources\|4\|1 |
            | 3     | External\|External Card Title\|Related Resources | Related Resources\|4\|3 |
            | 4     | Media\|Test PDF File name\|Related Resources     | Related Resources\|4\|4 |