Feature: Related Resources Tests

    Scenario Outline: User is able to verify the presence of related resouces section, links etc.
        Given user is navigating to "<url>"
        Then related resources section is visible
        And related resources have working link "<linkText>" with the href "<linkHref>"

        Examples:
            | url                                                                                 | linkText                           | linkHref                                             |
            | about-cancer/coping/feelings                                                        | Learning to Relax                  | /about-cancer/coping/feelings/relaxation             |
            | espanol/cancer/sobrellevar/sentimientos                                             | Aprenda a relajarse                | /espanol/cancer/sobrellevar/sentimientos/relajarse   |
            | espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion | Vitamina D y prevención del cáncer | /espanol/hoja-informativa-vitamina-d                 |
            | news-events/cancer-currents-blog/2019/vitamin-d-supplement-cancer-prevention        | Vitamin D and Cancer Prevention    | /about-cancer/causes-prevention/vitamin-d-fact-sheet |
            | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                         | Clickable Content                  | /pets/test-content                                   |
            | about-cancer/coping/feelings/relaxation/duke-university                             | Feelings and Cancer                | /about-cancer/coping/feelings                        |
            | about-cancer/coping/feelings/relaxation/loukissas-jen-biography                     | Feelings and Cancer                | /about-cancer/coping/feelings                        |

    Scenario Outline: Verify exit disclaimer
        Given user is navigating to "<url>"
        Then related resources section is visible
        And exit disclaimer is visible
        And the number of external links is <count>

        Examples:
            | url                                                                                        | count |
            | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                                | 3     |
            | about-cancer/coping/feelings                                                               | 1     |
            | espanol/cancer/sobrellevar/sentimientos                                                    | 1     |
            | news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | 1     |
            | about-cancer/coping/feelings/relaxation/duke-university                                    | 2     |
            | about-cancer/coping/feelings/relaxation/loukissas-jen-biography                            | 2     |

    Scenario Outline: Negative: Verify pages without related resources
        Given user is navigating to "<url>"
        Then related resources section does not exist

        Examples:
            | url                                                                         |
            | espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres             |
            | news-events/cancer-currents-blog/2019/human-tumor-atlas-network-cancer-maps |
            | news-events/press-releases/2019/deep-learning-cervical-cancer-screening     |

    Scenario Outline: Negative: Verify pages without exit disclaimers
        Given user is navigating to "<url>"
        Then related resources section is visible
        And exit disclaimer is not visible

        Examples:
            | url                                                                                 |
            | espanol/cancer/sobrellevar/self-image                                               |
            | espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion |


