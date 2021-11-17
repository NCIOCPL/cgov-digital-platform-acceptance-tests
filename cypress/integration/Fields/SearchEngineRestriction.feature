Feature: Search Engine restrictions test

    Scenario Outline: Check 'Include Search' is selected in pages with Index
        Given user is navigating to "<path>"
        Then the page contains meta tags with the following names
            | name   | content |
            | robots | index   |

        Examples:
            | path                                                                                        |
            | /about-cancer/coping/feelings/relaxation                                                    |
            | /espanol/efectos-secundarios                                                                |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio                 |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial                               |
            | /news-events/cancer-currents-blog                                                           |
            | /espanol/noticias/temas-y-relatos-blog                                                      |
            | /about-cancer/coping/feelings/relaxation/chanock-stephen                                    |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          |
            | /types/breast/research                                                                      |
            | /espanol/tipos/seno/investigacion                                                           |
            | /types/breast                                                                               |
            | /espanol/tipos/seno                                                                         |
            | /types/breast/hp                                                                            |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            |
            | /about-cancer                                                                               |
            | /espanol/cancer                                                                             |
            | /news-events/press-releases/2018                                                            |
            | /espanol/noticias/comunicados-de-prensa/2018                                                |
            | /about-nci/organization/screen-to-save-infographic                                          |
            | /espanol/infografia-nci                                                                     |
            | /research/progress/discovery/gutcheck-intro-video                                           |

