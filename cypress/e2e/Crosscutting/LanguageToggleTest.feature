Feature: Language toggle tests

    Scenario Outline: Verify that language toggle exists on the pages
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then the site banner appears
        And language toggle is displayed
        And toggle label is "<label>"
        And toggle links to "<link>"

        Examples:
            | breakpoint | url                                                                                                          | link                                                                                                          | label   |
            | desktop    | about-cancer/coping/feelings/relaxation                                                                      | /espanol/cancer/sobrellevar/sentimientos/relajarse                                                            | Español |
            | desktop    | about-cancer/coping/feelings                                                                                 | /espanol/cancer/sobrellevar/sentimientos                                                                      | Español |
            | desktop    | types/breast/patient/breast-treatment-pdq                                                                    | /espanol/tipos/seno/paciente/tratamiento-seno-pdq                                                             | Español |
            | desktop    | about-cancer/coping/feelings/relaxation/stress-fact-sheet                                                    | /espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres                                              | Español |
            | tablet     | news-events/cancer-currents-blog/2018/fda-combo                                                              | /espanol/noticias/temas-y-relatos-blog/2018/fda-combo-es                                                      | Español |
            | tablet     | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                                                  | /espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin                                      | Español |
            | mobile     | news-events/press-releases/2019/deep-learning-cervical-cancer-screening                                      | /espanol/noticias/comunicados-de-prensa/2019/aprendizaje-profundo-cancer-cuello-uterino-examenes-de-deteccion | Español |
            | mobile     | espanol/noticias/comunicados-de-prensa/2019/aprendizaje-profundo-cancer-cuello-uterino-examenes-de-deteccion | /news-events/press-releases/2019/deep-learning-cervical-cancer-screening                                      | English |
            | desktop    | espanol/publicaciones/diccionarios/diccionario-cancer                                                        | /publications/dictionaries/cancer-terms                                                                       | English |
            | tablet     | publications/dictionaries/genetics-dictionary                                                                | /espanol/publicaciones/diccionarios/diccionario-genetica                                                      | Español |

    Scenario Outline: Negative: toggle does not exist on pages without translation
        Given user is navigating to "<url>"
        And screen breakpoint is set to "mobile"
        Then the site banner appears
        Then language toggle does not exist

        Examples:
            | url                                                               |
            | about-nci/organization/ccct                                       |
            | about-cancer/coping/feelings/relaxation/duke-university           |
            | about-cancer/coping/feelings/relaxation/loukissas-jen-biography   |
            | research/participate/clinical-trials-search                       |
            | research/participate/clinical-trials-search/disease/breast-cancer |
            | espanol/buscar/resultados?swKeyword=cáncer                        |
            | research/participate/clinical-trials/covid-19                     |

    Scenario: Languager toggle click event
        Given user is navigating to "/"
        When user clicks on language toggle
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                    |
            | prop4     | D=pev1                                   |
            | prop67    | D=pageName                               |
            | prop52    | D=v52                                    |
            | prop68    | D=v68                                    |
            | prop8     | english                                  |
            | evar2     | D=c8                                     |
            | evar52    | Language\|Link Click\|English to Spanish |
            | evar68    | PreHeader                                |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/           |
            | pageName  | {CANONICAL_HOST}/                        |
            | event83   |                                          |
            | channel   | NCI Homepage                             |
            | pev2      | PreHeader:LinkClick                      |
            | linkType  | lnk_o                                    |
            | link      | Español                                  |

    Scenario: Scenario: Spanish language toggle click event
        Given user is navigating to "/espanol"
        When user clicks on language toggle
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                    |
            | prop4     | D=pev1                                   |
            | prop67    | D=pageName                               |
            | evar52    | Language\|Link Click\|Spanish to English |
            | evar68    | PreHeader                                |
            | prop8     | spanish                                  |
            | evar2     | D=c8                                     |
            | prop52    | D=v52                                    |
            | prop68    | D=v68                                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/espanol    |
            | pageName  | {CANONICAL_HOST}/espanol                 |
            | event83   |                                          |
            | channel   | NCI Home - Spanish                       |
            | pev2      | PreHeader:LinkClick                      |
            | linkType  | lnk_o                                    |
            | link      | English                                  |