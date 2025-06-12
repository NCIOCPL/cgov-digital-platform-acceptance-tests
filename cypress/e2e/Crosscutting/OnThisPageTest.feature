Feature: As a user, I want to be able to use On this Page links to easily navigate between page sections

    Scenario Outline: On this page section displays on article
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "<url>"
        Then "<otpTitle>" is displayed
        And OTP links have the following '<titles>'
        And OTP links have the "<hrefs>" as follows
        Examples:
            | content type    | url                                           | titles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | hrefs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | otpTitle       |
            | article english | /about-cancer/treatment/side-effects/         | What is...,How to...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | #what-is,#how-to                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | On This Page   |
            | article spanish | /espanol/hoja-informativa-reconstruccion      | ¿Qué es la reconstrucción del seno?,¿Cómo usan los cirujanos implantes para reconstruir el seno de una mujer?,¿Cómo usan los cirujanos el tejido del cuerpo mismo de la mujer para reconstruir su seno?                                                                                                                                                                                                                                                                                                                                                                                                                                        | #que-es-la-reconstruccion-del-seno,#como-usan-los-cirujanos-implantes-para-reconstruir-el-seno-de-una-mujer,#como-usan-los-cirujanos-el-tejido-del-cuerpo-mismo-de-la-mujer-para-reconstruir-su-seno                                                                                                                                                                                                                                                                                                                                                                                                               | En esta página |
            | article english | /research-areas-genomics                      | Why Genomics Research Is "Critical" to Progress  & against <Cancer>,Opportunities in Cancer Genomics©  Research Σ -φ-ψ-Ω- τ,Challenges° in Cancer Genomics Research€,NCI’s Role in Cancer Genomics Research,Characterizing Cancer Genomes,Analyzing Standard of Care and Novel Treatments at a Molecular Level,Relating Inherited Risk Factors to Cancer Genomics,ÁÉÍÓÚÑÜ Data Sharing áéíóúñü                                                                                                                                                                                                                                                 | #why-genomics-research-is-critical-to-progress-against-cancer,#opportunities-in-cancer-genomics-research-s-f-ps-o-t,#challenges-in-cancer-genomics-research,#ncis-role-in-cancer-genomics-research,#characterizing-cancer-genomes,#analyzing-standard-of-care-and-novel-treatments-at-a-molecular-level,#relating-inherited-risk-factors-to-cancer-genomics,#aeiounu-data-sharing-aeiounu                                                                                                                                                                                                                          | On This Page   |
            | article spanish | /espanol/espanol-investigacion-areas-genomica | Por qué es crítica la investigación & de ↥¼4 genómica para el <progreso> contra el cáncer ÁÉÍÓÚÑÜ,ÁÉÍÓÚÑÜ Oportunidades ℜ en la "investigación" de la genómica del cáncer,áéíóúñü Desafíos en la investigación de ₳ genómica del cáncer,Papel del NCI en la investigación de la –genómica— del cáncer áéíóúñü,Caracterización de los genomas© de cáncer Σ -φ-ψ-Ω- τ,Análisis de ®normas de la atención y de tratamientos novedosos a nivel molecular,Modelado de la≈ actividad de ΗëĹĺ𝕠 los genes™ de cáncer,Relación de factores° de riesgo≠ heredados €con£ la genómica del cáncer,Participación de datos αβγδεζ -η- -θ- -ι-κ-λ-μ-ν-ξ-ο-π-ρ | #por-que-es-critica-la-investigacion-de-genomica-para-el-progreso-contra-el-cancer-aeiounu,#aeiounu-oportunidades-en-la-investigacion-de-la-genomica-del-cancer,#aeiounu-desafios-en-la-investigacion-de-genomica-del-cancer,#papel-del-nci-en-la-investigacion-de-la-genomica-del-cancer-aeiounu,#caracterizacion-de-los-genomas-de-cancer-s-f-ps-o-t,#analisis-de-normas-de-la-atencion-y-de-tratamientos-novedosos-a-nivel-molecular,#modelado-de-la-actividad-de-los-genes-de-cncer,#relacion-de-factores-de-riesgo-heredados-con-la-genomica-del-cancer,#participacion-de-datos-abgdez-i-th-i-k-l-m-n-x-o-p-r | En esta página |

    Scenario Outline: On this page section displays on PDQ CIS on desktop
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "<url>"
        Then legacy "<otpTitle>" is displayed
        And legacy OTP links have the following '<titles>'
        And legacy OTP links have the "<hrefs>" as follows
        Examples:
            | content type           | url                                                  | titles                                                                                                                                      | hrefs                         | otpTitle       |
            | pdq Patient version EN | /types/lung/patient/lung-prevention-pdq              | What is prevention?,General Information About Lung Cancer,Lung Cancer Prevention,About This PDQ Summary                                     | #_29,#_4,#_12,#_AboutThis_1   | On This Page   |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   | Overview,Description of the Evidence,Changes to This Summary (03/02/2018),About This PDQ Summary                                            | #_171,#_16,#_80,#_AboutThis_1 | On This Page   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq | ¿Qué es la prevención?,Información general sobre el cáncer de pulmón,Prevención del cáncer de pulmón,Información sobre este sumario del PDQ | #_1,#_4,#_94,#_AboutThis_1    | En esta página |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      | Aspectos generales,Descripción de las pruebas,Modificaciones a este sumario (03/19/2018),Información sobre este sumario del PDQ             | #_1,#_177,#_136,#_AboutThis_1 | En esta página |


    Scenario Outline: On this page section displays on article and PDQ CIS on tablet breakpoint
        Given screen breakpoint is set to "tablet"
        When user is navigating to "<url>"
        Then "<otpTitle>" is displayed
        And OTP links have the following '<titles>'
        And OTP links have the "<hrefs>" as follows
        Examples:
            | content type    | url                                           | titles                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | hrefs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | otpTitle       |
            | article english | /about-cancer/treatment/side-effects/         | What is...,How to...                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | #what-is,#how-to                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | On This Page   |
            | article spanish | /espanol/hoja-informativa-reconstruccion      | ¿Qué es la reconstrucción del seno?,¿Cómo usan los cirujanos implantes para reconstruir el seno de una mujer?,¿Cómo usan los cirujanos el tejido del cuerpo mismo de la mujer para reconstruir su seno?                                                                                                                                                                                                                                                                                                                                                                                                                                        | #que-es-la-reconstruccion-del-seno,#como-usan-los-cirujanos-implantes-para-reconstruir-el-seno-de-una-mujer,#como-usan-los-cirujanos-el-tejido-del-cuerpo-mismo-de-la-mujer-para-reconstruir-su-seno                                                                                                                                                                                                                                                                                                                                                                                                               | En esta página |
            | article english | /research-areas-genomics                      | Why Genomics Research Is "Critical" to Progress  & against <Cancer>,Opportunities in Cancer Genomics©  Research Σ -φ-ψ-Ω- τ,Challenges° in Cancer Genomics Research€,NCI’s Role in Cancer Genomics Research,Characterizing Cancer Genomes,Analyzing Standard of Care and Novel Treatments at a Molecular Level,Relating Inherited Risk Factors to Cancer Genomics,ÁÉÍÓÚÑÜ Data Sharing áéíóúñü                                                                                                                                                                                                                                                 | #why-genomics-research-is-critical-to-progress-against-cancer,#opportunities-in-cancer-genomics-research-s-f-ps-o-t,#challenges-in-cancer-genomics-research,#ncis-role-in-cancer-genomics-research,#characterizing-cancer-genomes,#analyzing-standard-of-care-and-novel-treatments-at-a-molecular-level,#relating-inherited-risk-factors-to-cancer-genomics,#aeiounu-data-sharing-aeiounu                                                                                                                                                                                                                          | On This Page   |
            | article spanish | /espanol/espanol-investigacion-areas-genomica | Por qué es crítica la investigación & de ↥¼4 genómica para el <progreso> contra el cáncer ÁÉÍÓÚÑÜ,ÁÉÍÓÚÑÜ Oportunidades ℜ en la "investigación" de la genómica del cáncer,áéíóúñü Desafíos en la investigación de ₳ genómica del cáncer,Papel del NCI en la investigación de la –genómica— del cáncer áéíóúñü,Caracterización de los genomas© de cáncer Σ -φ-ψ-Ω- τ,Análisis de ®normas de la atención y de tratamientos novedosos a nivel molecular,Modelado de la≈ actividad de ΗëĹĺ𝕠 los genes™ de cáncer,Relación de factores° de riesgo≠ heredados €con£ la genómica del cáncer,Participación de datos αβγδεζ -η- -θ- -ι-κ-λ-μ-ν-ξ-ο-π-ρ | #por-que-es-critica-la-investigacion-de-genomica-para-el-progreso-contra-el-cancer-aeiounu,#aeiounu-oportunidades-en-la-investigacion-de-la-genomica-del-cancer,#aeiounu-desafios-en-la-investigacion-de-genomica-del-cancer,#papel-del-nci-en-la-investigacion-de-la-genomica-del-cancer-aeiounu,#caracterizacion-de-los-genomas-de-cancer-s-f-ps-o-t,#analisis-de-normas-de-la-atencion-y-de-tratamientos-novedosos-a-nivel-molecular,#modelado-de-la-actividad-de-los-genes-de-cncer,#relacion-de-factores-de-riesgo-heredados-con-la-genomica-del-cancer,#participacion-de-datos-abgdez-i-th-i-k-l-m-n-x-o-p-r | En esta página |

    Scenario Outline: On this page section displays on PDQ CIS on tablet breakpoint
        Given screen breakpoint is set to "tablet"
        When user is navigating to "<url>"
        Then legacy "<otpTitle>" is displayed
        And legacy OTP links have the following '<titles>'
        And legacy OTP links have the "<hrefs>" as follows
        Examples:
            | content type           | url                                                  | titles                                                                                                                                      | hrefs                         | otpTitle       |
            | pdq Patient version EN | /types/lung/patient/lung-prevention-pdq              | What is prevention?,General Information About Lung Cancer,Lung Cancer Prevention,About This PDQ Summary                                     | #_29,#_4,#_12,#_AboutThis_1   | On This Page   |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   | Overview,Description of the Evidence,Changes to This Summary (03/02/2018),About This PDQ Summary                                            | #_171,#_16,#_80,#_AboutThis_1 | On This Page   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq | ¿Qué es la prevención?,Información general sobre el cáncer de pulmón,Prevención del cáncer de pulmón,Información sobre este sumario del PDQ | #_1,#_4,#_94,#_AboutThis_1    | En esta página |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      | Aspectos generales,Descripción de las pruebas,Modificaciones a este sumario (03/19/2018),Información sobre este sumario del PDQ             | #_1,#_177,#_136,#_AboutThis_1 | En esta página |


    Scenario Outline: On this page section displays as an accordion on mobile breakpoint on legacy content
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        Then legacy on this page section title is not displayed
        And legacy on this page accordion is displayed
        And all of the legacy accordion items are collapsed

        Examples:
            | content type           | url                                                  |
            | pdq HP version EN      | /types/lung/hp/lung-prevention-pdq                   |
            | pdq Patient version ES | /espanol/tipos/pulmon/paciente/prevencion-pulmon-pdq |
            | pdq HP version ES      | /espanol/tipos/pulmon/pro/prevencion-pulmon-pdq      |

    Scenario Outline: On this page section displays as an accordion on mobile breakpoint on article
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        Then on this page section title is not displayed
        And on this page accordion is displayed
        And all of the accordion items are collapsed

        Examples:
            | content type    | url                                           |
            | article english | /about-cancer/treatment/side-effects/         |
            | article spanish | /espanol/hoja-informativa-reconstruccion      |
            | article english | /research-areas-genomics                      |
            | article spanish | /espanol/espanol-investigacion-areas-genomica |


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

