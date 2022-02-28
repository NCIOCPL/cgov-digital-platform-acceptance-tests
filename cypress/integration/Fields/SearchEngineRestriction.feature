Feature: Search Engine restrictions test

    Scenario Outline: Check 'Include Search' is selected in pages with Index
        Given user is navigating to "<path>"
        And screen breakpoint is set to "<breakpoint>"
        Then the page contains meta tags with the following names
            | name   | content |
            | robots | index   |

        Examples:
            | path                                                                                        | breakpoint |
            | /about-cancer/coping/feelings/relaxation                                                    | desktop    |
            | /espanol/efectos-secundarios                                                                | mobile     |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 | tablet     |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | tablet     |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio                 | mobile     |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial                               | desktop    |
            | /news-events/cancer-currents-blog                                                           | mobile     |
            | /espanol/noticias/temas-y-relatos-blog                                                      | tablet     |
            | /about-cancer/coping/feelings/relaxation/chanock-stephen                                    | tablet     |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          | desktop    |
            | /types/breast/research                                                                      | mobile     |
            | /espanol/tipos/seno/investigacion                                                           | tablet     |
            | /types/breast                                                                               | tablet     |
            | /espanol/tipos/seno                                                                         | desktop    |
            | /types/breast/hp                                                                            | mobile     |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            | tablet     |
            | /about-cancer                                                                               | desktop    |
            | /espanol/cancer                                                                             | mobile     |
            | /news-events/press-releases/2018                                                            | tablet     |
            | /espanol/noticias/comunicados-de-prensa/2018                                                | desktop    |
            | /about-nci/organization/screen-to-save-infographic                                          | mobile     |
            | /espanol/infografia-nci                                                                     | tablet     |
            | /research/progress/discovery/gutcheck-intro-video                                           | desktop    |

