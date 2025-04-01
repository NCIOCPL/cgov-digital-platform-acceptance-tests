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
            | mobile     | espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres                     | Aprenda a relajarse                     | /espanol/cancer/sobrellevar/sentimientos/relajarse   |

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


