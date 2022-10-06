
Feature: Page Options tests

    Scenario Outline: Verify that Page options exists on the pages
        Given user is navigating to "<url>"
        Then the following "<pageOption>" buttons are displayed at top and bottom of the page
        When screen breakpoint is set to "mobile"
        Then the page options are not displayed
        Examples:
            | url                                                                                         | pageOption  |
            | /about-cancer/coping/feelings/relaxation                                                    | print,email |
            | /espanol/hoja-informativa-vitamina-d                                                        | print,email |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                                 | print,email |
            | /news-events/cancer-currents-blog/2019/hpv-vaccine-presidents-cancer-panel-improving-uptake | print,email |
            | /espanol/noticias/temas-y-relatos-blog/2017/tobacco-corrective-es                           | print,email |
            | /types/breast/research                                                                      | print,email |
            | /espanol/tipos/seno/investigacion                                                           | print,email |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                          | print,email |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                            | print,email |
            | /news-events/press-releases/2019/annual-report-nation-2018                                  | print,email |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014            | print,email |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                                    | print,email |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                           | print,email |
            | /news-events/cancer-currents-blog                                                           | print,email |
            | /espanol/noticias/temas-y-relatos-blog                                                      | print,email |
            | /news-events/press-releases/2019                                                            | print,email |
            | /espanol/noticias/comunicados-de-prensa/2019                                                | print,email |
            | /about-nci/organization/nci-at-a-glance                                                     | print,email |
            | /espanol/infografia-nci                                                                     | print,email |
            | /about-cancer/coping/feelings/relaxation/hedge-maze                                         | print,email |

    Scenario Outline: Verify that Page options do not exist exists on the home page, landing page, cthp and special template pages
        Given user is navigating to "<url>"
        Then the page options do not exist

        Examples:
            | url                 |
            | /                   |
            | /about-cancer       |
            | /espanol            |
            | /special-report     |
            | /types/breast       |
            | /espanol/tipos/seno |

    Scenario: Verify english email contents
        Given user is navigating to "/about-cancer/coping/feelings"
        Then email page option will pre-populate email subject line with "Information from the National Cancer Institute Web Site"
        And email body will have the following text "I found this information on www.cancer.gov and I'd like to share it with you"
        And email body will contain shared page url as "https://{CANONICAL_HOST}/about-cancer/coping/feelings"

    Scenario: Verify spanish email contents
        Given user is navigating to "/espanol/hoja-informativa-vitamina-d"
        Then email page option will pre-populate email subject line with "Información del portal de Internet del Instituto Nacional del Cáncer "
        And email body will have the following text "Encontré esta información en cancer.gov/espanol y quiero compartirla contigo"
        And email body will contain shared page url as "https://{CANONICAL_HOST}/espanol/hoja-informativa-vitamina-d"


    Scenario: Click event fires when user clicks on print share option
        Given user is navigating to "/about-cancer/coping/feelings/"
        When user clicks on "print" share option
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
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | event17   |                                                       |
            | channel   | About Cancer                                          |
            | pev2      | PageOptions:LinkClick                                 |
            | linkType  | lnk_o                                                 |
            | link      | Page options top                                      |

    Scenario: Click event fires when user clicks on print share option
        Given user is navigating to "/about-cancer/coping/feelings/"
        When user clicks on "print" share option
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
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | event17   |                                                       |
            | channel   | About Cancer                                          |
            | pev2      | PageOptions:LinkClick                                 |
            | linkType  | lnk_o                                                 |
            | link      | Page options top                                      |

    Scenario: Click event fires when user clicks on email share option
        Given user is navigating to "/about-cancer/coping/feelings/"
        When user clicks on "email" share option
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                 |
            | prop4     | D=pev1                                                |
            | prop67    | D=pageName                                            |
            | prop43    | D=v43                                                 |
            | prop68    | D=v68                                                 |
            | prop8     | english                                               |
            | evar2     | D=c8                                                  |
            | evar43    | BodyTop\|Email                                        |
            | evar68    | BodyTop                                               |
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | event17   |                                                       |
            | channel   | About Cancer                                          |
            | pev2      | PageOptions:LinkClick                                 |
            | linkType  | lnk_o                                                 |
