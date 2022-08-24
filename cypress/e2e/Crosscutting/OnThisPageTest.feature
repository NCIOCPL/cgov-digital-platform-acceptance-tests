Feature: As a user, I want to be able to use On this Page links to easily navigate between page sections

    Scenario Outline: On this page section displays on article and PDQ CIS on desktop
        Given screen breakpoint is set to "tablet"
        Given user is navigating to "<url>"
        Then "<otpTitle>" is displayed
        And OTP links have the following "<titles>"
        And OTP links have the "<hrefs>" as follows
        Examples:
            | content type           | url                                                  | titles                                                                                                                                                                                                  | hrefs                                                                                                                                                                                            | otpTitle       |
            | article english        | /about-cancer/treatment/side-effects/                | What is...,How to...                                                                                                                                                                                    | #what-is,#how-to                                                                                                                                                                                 | On This Page   |
            | article spanish        | /espanol/hoja-informativa-reconstruccion             | ¿Qué es la reconstrucción del seno?,¿Cómo usan los cirujanos implantes para reconstruir el seno de una mujer?,¿Cómo usan los cirujanos el tejido del cuerpo mismo de la mujer para reconstruir su seno? | #qu-es-la-reconstruccin-del-seno,#cmo-usan-los-cirujanos-implantes-para-reconstruir-el-seno-de-una-mujer,#cmo-usan-los-cirujanos-el-tejido-del-cuerpo-mismo-de-la-mujer-para-reconstruir-su-seno | En Esta Página |
            | pdq Patient version EN | /types/lung/patient/lung-prevention-pdq              | What is prevention?,General Information About Lung Cancer,Lung Cancer Prevention,About This PDQ Summary                                                                                                 | #_29,#_4,#_12,#_AboutThis_1                                                                                                                                                                      | On This Page   |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   | Overview,Description of the Evidence,Changes to This Summary (03/02/2018),About This PDQ Summary                                                                                                        | #_171,#_16,#_80,#_AboutThis_1                                                                                                                                                                    | On This Page   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq | ¿Qué es la prevención?,Información general sobre el cáncer de pulmón,Prevención del cáncer de pulmón,Información sobre este sumario del PDQ                                                             | #_1,#_4,#_94,#_AboutThis_1                                                                                                                                                                       | En Esta Página |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      | Aspectos generales,Descripción de las pruebas,Modificaciones a este sumario (03/19/2018),Información sobre este sumario del PDQ                                                                         | #_1,#_177,#_136,#_AboutThis_1                                                                                                                                                                    | En Esta Página |

    Scenario Outline: On this page section displays on article and PDQ CIS on tablet breakpoint
        Given screen breakpoint is set to "tablet"
        When user is navigating to "<url>"
        Then "<otpTitle>" is displayed
        And OTP links have the following "<titles>"
        And OTP links have the "<hrefs>" as follows
        Examples:
            | content type           | url                                                  | titles                                                                                                                                                                                                  | hrefs                                                                                                                                                                                            | otpTitle       |
            | article english        | /about-cancer/treatment/side-effects/                | What is...,How to...                                                                                                                                                                                    | #what-is,#how-to                                                                                                                                                                                 | On This Page   |
            | article spanish        | /espanol/hoja-informativa-reconstruccion             | ¿Qué es la reconstrucción del seno?,¿Cómo usan los cirujanos implantes para reconstruir el seno de una mujer?,¿Cómo usan los cirujanos el tejido del cuerpo mismo de la mujer para reconstruir su seno? | #qu-es-la-reconstruccin-del-seno,#cmo-usan-los-cirujanos-implantes-para-reconstruir-el-seno-de-una-mujer,#cmo-usan-los-cirujanos-el-tejido-del-cuerpo-mismo-de-la-mujer-para-reconstruir-su-seno | En Esta Página |
            | pdq Patient version EN | /types/lung/patient/lung-prevention-pdq              | What is prevention?,General Information About Lung Cancer,Lung Cancer Prevention,About This PDQ Summary                                                                                                 | #_29,#_4,#_12,#_AboutThis_1                                                                                                                                                                      | On This Page   |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   | Overview,Description of the Evidence,Changes to This Summary (03/02/2018),About This PDQ Summary                                                                                                        | #_171,#_16,#_80,#_AboutThis_1                                                                                                                                                                    | On This Page   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq | ¿Qué es la prevención?,Información general sobre el cáncer de pulmón,Prevención del cáncer de pulmón,Información sobre este sumario del PDQ                                                             | #_1,#_4,#_94,#_AboutThis_1                                                                                                                                                                       | En Esta Página |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      | Aspectos generales,Descripción de las pruebas,Modificaciones a este sumario (03/19/2018),Información sobre este sumario del PDQ                                                                         | #_1,#_177,#_136,#_AboutThis_1                                                                                                                                                                    | En Esta Página |


    Scenario Outline: On this page section displays as an accordion on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        Then on this page section title is not displayed
        And on this page accordion is displayed
        And all of the accordion items are collapsed

        Examples:
            | content type           | url                                                  |
            | article english        | /about-cancer/treatment/side-effects/                |
            | article spanish        | /espanol/hoja-informativa-reconstruccion             |
            | pdq Patient version EN | /types/lung/patient/lung-prevention-pdq              |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      |


    Scenario Outline: OTP section does not exist on any content types, beside article and pdq
        Given user is navigating to "<url>"
        Then On This page section does not exist

        Examples:
            | url                                                                                  |
            | /about-cancer/coping/feelings/relaxation/loukissas-jen-biography                     |
            | /news-events/cancer-currents-blog/2019/vitamin-d-supplement-cancer-prevention        |
            | /espanol/noticias/temas-y-relatos-blog/2019/vitamina-d-complemento-cancer-prevencion |
            | /news-events/cancer-currents-blog                                                    |
            | /espanol/noticias/temas-y-relatos-blog                                               |
            | /about-cancer/coping/feelings/relaxation/dfharvard                                   |
            | /types/breast/research                                                               |
            | /espanol/tipos/seno/investigacion                                                    |
            | /types/breast                                                                        |
            | /espanol/tipos/seno                                                                  |
            | /types/breast/hp                                                                     |
            | /espanol/tipos/seno/pro                                                              |
            | /about-cancer/coping/nci-workshop-event                                              |
            | /news-events                                                                         |
            | /espanol/noticias                                                                    |
            | /research/key-initiatives                                                            |
            | /espanol/investigacion/iniciativas-clave                                             |
            | /about-cancer/treatment/drugs/bevacizumab                                            |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial                        |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio          |

