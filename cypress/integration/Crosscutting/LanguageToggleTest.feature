Feature: Language toggle tests

    Scenario Outline: Verify that language toggle exists on the pages
        Given user is navigating to "<url>"
        Then language toggle is displayed
        And toggle label is "<label>"
        And toggle links to "<link>"

        Examples:
            | url                                                                                                          | link                                                                                                          | label   |
            | about-cancer/coping/feelings/relaxation                                                                      | /espanol/cancer/sobrellevar/sentimientos/relajarse                                                            | Español |
            | about-cancer/coping/feelings                                                                                 | /espanol/cancer/sobrellevar/sentimientos                                                                      | Español |
            | types/breast/patient/breast-treatment-pdq                                                                    | /espanol/tipos/seno/paciente/tratamiento-seno-pdq                                                             | Español |
            | about-cancer/coping/feelings/relaxation/stress-fact-sheet                                                    | /espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres                                              | Español |
            | news-events/cancer-currents-blog/2018/fda-combo                                                              | /espanol/noticias/temas-y-relatos-blog/2018/fda-combo-es                                                      | Español |
            | news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                                                  | /espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin                                      | Español |
            | news-events/press-releases/2019/deep-learning-cervical-cancer-screening                                      | /espanol/noticias/comunicados-de-prensa/2019/aprendizaje-profundo-cancer-cuello-uterino-examenes-de-deteccion | Español |
            | espanol/noticias/comunicados-de-prensa/2019/aprendizaje-profundo-cancer-cuello-uterino-examenes-de-deteccion | /news-events/press-releases/2019/deep-learning-cervical-cancer-screening                                      | English |


    Scenario Outline: Negative: toggle does not exist on pages without translation
        Given user is navigating to "<url>"
        Then language toggle does not exist

        Examples:
            | url                                                             |
            | about-nci/organization/ccct                                     |
            | about-cancer/coping/feelings/relaxation/duke-university         |
            | about-cancer/coping/feelings/relaxation/loukissas-jen-biography |