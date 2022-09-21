Feature: Language toggle tests

    Scenario Outline: Verify that language toggle exists on the pages
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then language toggle is displayed
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


    Scenario Outline: Negative: toggle does not exist on pages without translation
        Given user is navigating to "<url>"
        And screen breakpoint is set to "mobile"
        Then language toggle does not exist

        Examples:
            | url                                                             |
            | about-nci/organization/ccct                                     |
            | about-cancer/coping/feelings/relaxation/duke-university         |
            | about-cancer/coping/feelings/relaxation/loukissas-jen-biography |