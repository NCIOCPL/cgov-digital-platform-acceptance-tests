Feature: Public use tests

    Scenario Outline: As a user, I want to view the public use text on pages with public use text
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then public use text is displayed
        And the public use text contains "<title>"
        Examples:
            | breakpoint | url                                                           | title                                                                                                      |
            | mobile     | /about-cancer/coping/feelings                                 | Feelings and Cancer                                                                                        |
            | desktop    | /espanol/espanol-investigacion-areas-genomica                 | Investigación de genómica del cáncer                                                                       |
            | tablet     | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial | Leukemia - Ibrutinib plus rituximab superior to standard treatment for some patients with chronic leukemia |
            | desktop    | /types/breast/hp/breast-prevention-pdq                        | Breast Cancer Prevention (PDQ®)–Health Professional Version                                                |
            | mobile     | /espanol/tipos/seno/pro/prevencion-seno-pdq                   | Prevención del cáncer de seno (mama) (PDQ®)–Versión para profesionales de salud                            |

    Scenario Outline: As a user, I do not want to view the public use text on pages with no public use text
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then public use text is not displayed
        Examples:
            | breakpoint | url                                                         |
            | desktop    | /news-events/press-releases/2019/brca-exchange              |
            | mobile     | /about-cancer/treatment/drugs/bevacizumab                   |
            | tablet     | /about-cancer/coping/feelings/relaxation/loukissas-jennifer |

    Scenario Outline: As a user, I want to check the length of public use text on pages is correct
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then the length of public use text is within correct range
        Examples:
            | breakpoint | url                                                           |
            | desktop    | /about-cancer/coping/feelings                                 |
            | mobile     | /espanol/espanol-investigacion-areas-genomica                 |
            | tablet     | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial |
            | desktop    | /types/breast/hp/breast-prevention-pdq                        |
            | mobile     | /espanol/tipos/seno/pro/prevencion-seno-pdq                   |