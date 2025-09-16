
Feature: Page Options tests

    Scenario Outline: Verify that Page options exists on the pages
        Given user is navigating to "<url>"
        Then the following "<pageOption>" buttons are displayed at top and bottom of the page
        When screen breakpoint is set to "mobile"
        Then the page options are not displayed
        Examples:
            | url                                                                                         | pageOption                             |
            | /about-cancer/coping/feelings/relaxation                                                    | Print,Email                            |
            | /espanol/hoja-informativa-vitamina-d                                                        | Imprimir,Enviar por correo electrónico |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 | Print,Email                            |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | Print,Email                            |
            | /espanol/noticias/temas-y-relatos-blog/2017/tobacco-corrective-es                           | Imprimir,Enviar por correo electrónico |
            | /types/breast/research                                                                      | Print,Email                            |
            | /espanol/tipos/seno/investigacion                                                           | Imprimir,Enviar por correo electrónico |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          | Print,Email                            |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            | Print,Email                            |
            | /news-events/press-releases/2019/annual-report-nation-2018                                  | Print,Email                            |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014            | Imprimir,Enviar por correo electrónico |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                                    | Print,Email                            |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                           | Imprimir,Enviar por correo electrónico |
            | /news-events/cancer-currents-blog                                                           | Print,Email                            |
            | /espanol/noticias/temas-y-relatos-blog                                                      | Imprimir,Enviar por correo electrónico |
            | /news-events/press-releases/2018                                                            | Print,Email                            |
            | /espanol/noticias/comunicados-de-prensa/2018                                                | Imprimir,Enviar por correo electrónico |
            | /about-nci/organization/nci-at-a-glance                                                     | Print,Email                            |
            | /espanol/infografia-nci                                                                     | Imprimir,Enviar por correo electrónico |
            | /about-cancer/coping/feelings/relaxation/hedge-maze                                         | Print,Email                            |

    Scenario Outline: Verify that Page options do not exist exists on the home page, landing page, cthp and special template pages
        Given user is navigating to "<url>"
        Then the page options do not exist

        Examples:
            | url                 |
            | /                   |
            | /about-cancer       |
            | /espanol            |
            | /types/breast       |
            | /espanol/tipos/seno |

    Scenario: Verify english email contents
        Given user is navigating to "/about-cancer/coping/feelings"
        Then email page option will pre-populate email subject line with "Information from the National Cancer Institute Web Site"
        And email body will have the following text "I found this information on www.cancer.gov and I'd like to share it with you"
        And email body will contain shared page url as "{PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping/feelings"

    Scenario: Verify spanish email contents
        Given user is navigating to "/espanol/hoja-informativa-vitamina-d"
        Then email page option will pre-populate email subject line with "Información del portal de Internet del Instituto Nacional del Cáncer "
        And email body will have the following text "Encontré esta información en cancer.gov/espanol y quiero compartirla contigo"
        And email body will contain shared page url as "{PROTOCOL}://{CANONICAL_HOST}/espanol/hoja-informativa-vitamina-d"

    Scenario: Click event fires when user clicks on print share option
        Given user is navigating to "/about-cancer/coping/feelings/"
        When user clicks on "print" share option at the "top"
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                 |
            | prop4     | D=pev1                                                |
            | prop67    | D=pageName                                            |
            | prop43    | D=v43                                                 |
            | prop68    | D=v68                                                 |
            | prop8     | english                                               |
            | evar2     | D=c8                                                  |
            | evar43    | BodyTop\|Print                                        |
            | evar68    | BodyTop                                               |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | event17   |                                                       |
            | channel   | About Cancer                                          |
            | pev2      | PageOptions:LinkClick                                 |
            | linkType  | lnk_o                                                 |
            | link      | Print                                                 |

    Scenario: Click event fires when user clicks on email share option
        Given user is navigating to "/about-cancer/coping/feelings/"
        When user clicks on "email" share option at the "bottom"
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                 |
            | prop4     | D=pev1                                                |
            | prop67    | D=pageName                                            |
            | prop43    | D=v43                                                 |
            | prop68    | D=v68                                                 |
            | prop8     | english                                               |
            | evar2     | D=c8                                                  |
            | evar43    | BodyBottom\|Email                                     |
            | evar68    | BodyBottom                                            |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | event17   |                                                       |
            | channel   | About Cancer                                          |
            | pev2      | PageOptions:LinkClick                                 |
            | linkType  | lnk_o                                                 |


    Scenario: Click event fires when user clicks on print share option in spanish content
        Given user is navigating to "/espanol/cancer/sobrellevar/sentimientos/relajarse"
        When user clicks on "print" share option at the "bottom"
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                      |
            | prop4     | D=pev1                                                                     |
            | prop67    | D=pageName                                                                 |
            | prop43    | D=v43                                                                      |
            | prop68    | D=v68                                                                      |
            | prop8     | spanish                                                                    |
            | evar2     | D=c8                                                                       |
            | evar43    | BodyBottom\|Print                                                          |
            | evar68    | BodyBottom                                                                 |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/espanol/cancer/sobrellevar/sentimientos/relajarse |
            | pageName  | {CANONICAL_HOST}/espanol/cancer/sobrellevar/sentimientos/relajarse         |
            | event17   |                                                                            |
            | channel   | About Cancer - Spanish                                                     |
            | pev2      | PageOptions:LinkClick                                                      |
            | linkType  | lnk_o                                                                      |
            | link      | Imprimir                                                                   |

    Scenario: Click event fires when user clicks on email share option in spanish content
        Given user is navigating to "/espanol/cancer/sobrellevar/sentimientos/relajarse"
        When user clicks on "email" share option at the "top"
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                      |
            | prop4     | D=pev1                                                                     |
            | prop67    | D=pageName                                                                 |
            | prop43    | D=v43                                                                      |
            | prop68    | D=v68                                                                      |
            | prop8     | spanish                                                                    |
            | evar2     | D=c8                                                                       |
            | evar43    | BodyTop\|Email                                                             |
            | evar68    | BodyTop                                                                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/espanol/cancer/sobrellevar/sentimientos/relajarse |
            | pageName  | {CANONICAL_HOST}/espanol/cancer/sobrellevar/sentimientos/relajarse         |
            | event17   |                                                                            |
            | channel   | About Cancer - Spanish                                                     |
            | pev2      | PageOptions:LinkClick                                                      |
            | linkType  | lnk_o                                                                      |
