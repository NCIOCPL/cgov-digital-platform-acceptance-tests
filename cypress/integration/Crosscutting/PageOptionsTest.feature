
Feature: Page Options tests

    Scenario Outline: Verify that Page options exists on the pages
        Given user is navigating to "<url>"
        Then page options are displayed
        And "<pageOption>" button is displayed

        Examples:
            | url                                                                                         | pageOption                             |
            | /about-cancer/coping/feelings/relaxation                                                    | print,email,facebook,twitter,pinterest |
            | /espanol/hoja-informativa-vitamina-d                                                        | print,email,facebook,twitter,pinterest |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 | print,email,facebook,twitter,pinterest |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | print,email,facebook,twitter,pinterest |
            | /espanol/noticias/temas-y-relatos-blog/2017/tobacco-corrective-es                           | print,email,facebook,twitter,pinterest |
            | /types/breast/research                                                                      | print,email,facebook,twitter,pinterest |
            | /espanol/tipos/seno/investigacion                                                           | print,email,facebook,twitter,pinterest |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          | print,email,facebook,twitter,pinterest |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            | print,email,facebook,twitter,pinterest |
            | /news-events/press-releases/2019/annual-report-nation-2018                                  | print,email,facebook,twitter,pinterest |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014            | print,email,facebook,twitter,pinterest |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                                    | print,email,facebook,twitter,pinterest |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                           | print,email,facebook,twitter,pinterest |
            | /news-events/cancer-currents-blog                                                           | print,email,facebook,twitter,pinterest |
            | /espanol/noticias/temas-y-relatos-blog                                                      | print,email,facebook,twitter,pinterest |
            | /types/breast                                                                               | print,email,facebook,twitter,pinterest |
            | /espanol/tipos/seno                                                                         | print,email,facebook,twitter,pinterest |
            | /about-cancer                                                                               | print,email,facebook,twitter,pinterest |
            | /espanol/cancer                                                                             | print,email,facebook,twitter,pinterest |
            | /news-events/press-releases/2019                                                            | print,email,facebook,twitter,pinterest |
            | /espanol/noticias/comunicados-de-prensa/2019                                                | print,email,facebook,twitter,pinterest |
            | /about-nci/organization/nci-at-a-glance                                                     | print,email,facebook,twitter,pinterest |
            | /espanol/infografia-nci                                                                     | print,email,facebook,twitter,pinterest |
            | /about-cancer/coping/feelings/relaxation/hedge-maze                                         | print,email,facebook,twitter,pinterest |

    Scenario Outline: Negative: Verify that print and font resizer buttons are not visible at tablet and mobile viewpoints
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then page options are displayed
        And "<pageOption1>" button is not displayed
        Examples:
            | url                                                                                         | breakpoint | pageOption1        |
            | /about-cancer/coping/feelings/relaxation                                                    | tablet     | font resizer,print |
            | /espanol/hoja-informativa-vitamina-d                                                        | mobile     | font resizer,print |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 | tablet     | font resizer,print |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | mobile     | font resizer,print |
            | /espanol/noticias/temas-y-relatos-blog/2017/tobacco-corrective-es                           | tablet     | font resizer,print |
            | /types/breast/research                                                                      | mobile     | font resizer,print |
            | /espanol/tipos/seno/investigacion                                                           | tablet     | font resizer,print |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          | mobile     | font resizer,print |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            | tablet     | font resizer,print |
            | /news-events/press-releases/2019/annual-report-nation-2018                                  | mobile     | font resizer,print |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014            | tablet     | font resizer,print |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                                    | mobile     | font resizer,print |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                           | tablet     | font resizer,print |
            | /news-events/cancer-currents-blog                                                           | mobile     | print              |
            | /espanol/noticias/temas-y-relatos-blog                                                      | tablet     | print              |
            | /types/breast                                                                               | mobile     | print              |
            | /espanol/tipos/seno                                                                         | tablet     | print              |
            | /about-cancer                                                                               | mobile     | print              |
            | /espanol/cancer                                                                             | tablet     | print              |
            | /news-events/press-releases/2019                                                            | mobile     | print              |
            | /espanol/noticias/comunicados-de-prensa/2019                                                | tablet     | print              |
            | /about-nci/organization/nci-at-a-glance                                                     | mobile     | print              |
            | /espanol/infografia-nci                                                                     | tablet     | print              |
            | /about-cancer/coping/feelings/relaxation/hedge-maze                                         | mobile     | print              |

    Scenario Outline: Verify that font resizer button exists on the pages at Desktop breakpoint
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then page options are displayed
        And "font resizer" button is displayed
        Examples:
            | url                                                                                         |
            | /about-cancer/coping/feelings/relaxation                                                    |
            | /espanol/hoja-informativa-vitamina-d                                                        |
            | /about-cancer/coping/feelings/relaxation/loukissas-jen-biography                            |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake |
            | /espanol/noticias/temas-y-relatos-blog/2017/tobacco-corrective-es                           |
            | /types/breast/research                                                                      |
            | /espanol/tipos/seno/investigacion                                                           |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            |
            | /news-events/press-releases/2019/annual-report-nation-2018                                  |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014            |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                                    |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                           |

    Scenario Outline: Verify that font resizer button does not exist on the pages where it should not
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then page options are displayed
        And "font resizer" button does not exist
        Examples:
            | url                                                 |
            | /news-events/cancer-currents-blog                   |
            | /espanol/noticias/temas-y-relatos-blog              |
            | /types/breast                                       |
            | /espanol/tipos/seno                                 |
            | /about-cancer                                       |
            | /espanol/cancer                                     |
            | /news-events/press-releases/2019                    |
            | /espanol/noticias/comunicados-de-prensa/2019        |
            | /about-nci/organization/nci-at-a-glance             |
            | /espanol/infografia-nci                             |
            | /about-cancer/coping/feelings/relaxation/hedge-maze |