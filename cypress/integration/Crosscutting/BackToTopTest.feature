Feature: As a user, I want to be able to use back to top arrow for easy page navigation

    Scenario Outline: Back to top arrow on desktop and tablet on the English site
        Given user is navigating to "<url>"
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user scrolls 601 px "down"
        Then back-to-top arrow appears with text "TOP" and href "#top"
        When user scrolls 100 px "up"
        Then back-to-top arrow is not displayed
        Examples:
            | url                                                           | screenBreakpoint |
            | /about-cancer/treatment/side-effects                          | desktop          |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer   | tablet           |
            | /news-events/cancer-currents-blog                             | desktop          |
            | /about-cancer/coping/feelings/relaxation/dfharvard            | tablet           |
            | /types/breast/research                                        | desktop          |
            | /types/breast                                                 | tablet           |
            | /types/breast/hp                                              | desktop          |
            | /news-events/events/schiffman-gordon-lecture                  | tablet           |
            | /about-cancer                                                 | desktop          |
            | /                                                             | tablet           |
            | /dceg-connect                                                 | desktop          |
            | /about-cancer/coping                                          | tablet           |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq      | desktop          |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-hp-pdq   | tablet           |
            | /about-cancer/treatment/drugs/bevacizumab                     | desktop          |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial | tablet           |

    Scenario Outline: Back to top arrow on desktop and tablet on the Spanish site
        Given user is navigating to "<url>"
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user scrolls 601 px "down"
        Then back-to-top arrow appears with text "SUBIR" and href "#top"
        When user scrolls 100 px "up"
        Then back-to-top arrow is not displayed
        Examples:
            | url                                                                         | screenBreakpoint |
            | /espanol/cancer/tratamiento/efectos-secundarios                             | desktop          |
            | /espanol/noticias/temas-y-relatos-blog                                      | tablet           |
            | /espanol/tipos/seno/investigacion                                           | desktop          |
            | /espanol/tipos/seno                                                         | tablet           |
            | /espanol/tipos/seno/pro                                                     | desktop          |
            | /espanol/cancer                                                             | tablet           |
            | /espanol                                                                    | desktop          |
            | /espanol/investigacion/iniciativas-clave                                    | tablet           |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq           | desktop          |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pro-pdq       | tablet           |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio | desktop          |

    Scenario Outline: Back to top arrow  does not appear on mobile for the English site.
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        When user scrolls 601 px "down"
        Then back-to-top arrow is not displayed
        Examples:
            | url                                                           |
            | /about-cancer/treatment/side-effects                          |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer   |
            | /news-events/cancer-currents-blog                             |
            | /about-cancer/coping/feelings/relaxation/dfharvard            |
            | /types/breast/research                                        |
            | /types/breast                                                 |
            | /types/breast/hp                                              |
            | /news-events/events/schiffman-gordon-lecture                  |
            | /about-cancer                                                 |
            | /                                                             |
            | /dceg-connect                                                 |
            | /about-cancer/coping                                          |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq      |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-hp-pdq   |
            | /about-cancer/treatment/drugs/bevacizumab                     |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial |

    Scenario Outline: Back to top arrow  does not appear on mobile for the Spanish site.
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        When user scrolls 601 px "down"
        Then back-to-top arrow is not displayed
        Examples:
            | url                                                                         |
            | /espanol/cancer/tratamiento/efectos-secundarios                                                |
            | /espanol/noticias/temas-y-relatos-blog                                      |
            | /espanol/tipos/seno/investigacion                                           |
            | /espanol/tipos/seno                                                         |
            | /espanol/tipos/seno/pro                                                     |
            | /espanol/cancer                                                             |
            | /espanol                                                                    |
            | /espanol/cancer/sobrellevar                                                 |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq           |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pro-pdq       |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio |