Feature: As a user, I want to be able to use back to top arrow for easy page navigation

    Scenario Outline: Back to top arrow on desktop and tablet on the English site
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user is navigating to "<url>"
        And user scrolls 1 px "down"
        Then back-to-top arrow appears with text "Back To Top" and href "#"
        When user scrolls 1 px "up"
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
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user is navigating to "<url>"
        And user scrolls 1 px "down"
        Then back-to-top arrow appears with text "Volver arriba" and href "#"
        When user scrolls 1 px "up"
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

    Scenario Outline: Back to top arrow appears as an arrow on mobile
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        When user scrolls 5 px "down"
        Then back-to-top arrow is displayed
        Examples:
            | url                                                |
            | /about-cancer/treatment/side-effects               |
            | /news-events/cancer-currents-blog                  |
            | /about-cancer/coping/feelings/relaxation/dfharvard |
            | /types/breast/research                             |
            | /types/breast/hp                                   |
            | /news-events/events/schiffman-gordon-lecture       |
            | /about-cancer                                      |
            | /                                                  |


    Scenario: Click event on back to top
        Given user is navigating to "/"
        When user scrolls 5 px "down"
        Then back-to-top arrow appears with text "Back To Top" and href "#"
        When user clicks on back-to-top button
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                |
            | prop4     | D=pev1                               |
            | prop67    | D=pageName                           |
            | prop38    | D=v38                                |
            | prop68    | D=v68                                |
            | prop8     | english                              |
            | evar2     | D=c8                                 |
            | evar38    | Right Edge\|Back To Top\|Back To Top |
            | evar68    | Right Edge                           |
            | pageURL   | https://{CANONICAL_HOST}/            |
            | pageName  | {CANONICAL_HOST}/                    |
            | event21   |                                      |
            | channel   | NCI Homepage                         |
            | pev2      | RightEdge:LinkClick                  |
            | linkType  | lnk_o                                |
            | link      | BACK TO TOP                          |
