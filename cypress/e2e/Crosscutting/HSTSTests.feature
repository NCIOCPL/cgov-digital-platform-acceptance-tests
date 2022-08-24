Feature: As a site visitor, I want HSTS to be in place, so HTTPS is always enforced.

    Scenario Outline: Security protocol
        Given request is sent to "<path>"
        Then the "strict-transport-security" header specifies the following
            | headerContents    |
            | max-age           |
            | includeSubDomains |
            | preload           |

        Examples:
            | path                                                                                 |
            | /about-cancer/treatment/side-effects                                                 |
            | /news-events/cancer-currents-blog                                                    |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                   |
            | /types/breast/research                                                               |
            | /types/breast                                                                        |
            | /types/breast/hp                                                                     |
            | /news-events/events/schiffman-gordon-lecture                                         |
            | /about-cancer                                                                        |
            | /                                                                                    |
            | /dceg-connect                                                                        |
            | /sbir                                                                                |
            | /about-cancer/coping                                                                 |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                             |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-hp-pdq                          |
            | /about-cancer/treatment/drugs/bevacizumab                                            |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial                        |
            | /espanol/cancer/tratamiento/efectos-secundarios                                      |
            | /news-events/cancer-currents-blog                                                    |
            | /espanol/noticias/temas-y-relatos-blog                                               |
            | /espanol/tipos/seno/investigacion                                                    |
            | /espanol/tipos/seno                                                                  |
            | /espanol/tipos/seno/pro                                                              |
            | /espanol/cancer                                                                      |
            | /espanol                                                                             |
            | /research/key-initiatives                                                            |
            | /espanol/investigacion/iniciativas-clave                                             |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                    |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pro-pdq                |
            | /news-events/press-releases/2019                                                     |
            | /espanol/noticias/comunicados-de-prensa/2019                                         |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial                        |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio          |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                          |
            | /espanol/cancer/sobrellevar                                                          |
            | /special-report                                                                      |
            | /test/borderless-card                                                                |
            | /espanol/test-es/borderless-card                                                     |
            | /espanol/special-report                                                              |
            | /about-cancer/coping/feelings                                                        |
            | /about-cancer/coping/feelings/relaxation                                             |
            | /news-events/cancer-currents-blog/2019/vitamin-d-supplement-cancer-prevention        |
            | /espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                     |
            | /about-cancer/coping/feelings/relaxation/chanock-stephen                             |






