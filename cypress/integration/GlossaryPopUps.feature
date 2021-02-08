Feature: Viewing glossary pop-ups when available while visiting cancer info summary and drug info summary pages

    Scenario Outline: PDQ Information summary glossary links
        Given user is navigating to "<url>"
        When user is clicking on definition for "<termName>"
        Then pop-up definition box is displayed for "<termName>"
        And definition box displays all "<features>" provided by glossary


        Examples:
            | url                                                               | termName                                  | features                              |
            | /types/breast/patient/breast-treatment-pdq                        | breast                                    | definition,pronunciation,audio,img[2] |
            | /espanol/tipos/seno/paciente/tratamiento-seno-pdq                 | mama                                      | definition,audio,img[2]               |
            | /types/breast/hp/breast-ovarian-genetics-pdq                      | family history                            | definition,pronunciation,audio        |
            | /types/breast/patient/breast-screening-pdq                        | screening                                 | definition,pronunciation,audio        |
            | /espanol/tipos/seno/paciente/deteccion-seno-pdq                   | científico                                | definition,audio                      |
            | /types/breast/patient/breast-prevention-pdq                       | cancer                                    | definition,pronunciation,audio        |
            | /espanol/tipos/seno/paciente/prevencion-seno-pdq                  | prevención                                | definition,audio                      |
            | /types/brain/patient/child-glioma-treatment-pdq                   | oxygen                                    | definition,pronunciation,audio        |
            | /types/brain/hp/child-glioma-treatment-pdq                        | 3-dimensional conformal radiation therapy | definition,pronunciation,audio        |
            | /espanol/tipos/cerebro/paciente/tratamiento-cerebro-infantil-pdq  | sistema nervioso central                  | definition,audio,img[1]               |
            | /about-cancer/treatment/cam/patient/vitamin-c-pdq                 | collagen                                  | definition,pronunciation,audio        |
            | /about-cancer/treatment/cam/hp/vitamin-c-pdq                      | cancer                                    | definition,pronunciation,audio        |
            | /espanol/cancer/tratamiento/mca/paciente/vitamina-c-pdq           | vitamina C                                | definition,audio                      |
            | /espanol/cancer/tratamiento/mca/pro/vitamina-c-pdq                | cáncer                                    | definition,audio                      |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq          | chemotherapy                              | definition,pronunciation,audio        |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq | cáncer                                    | definition,audio                      |
            | /about-cancer/treatment/drugs/bevacizumab                         | drug                                      | definition,pronunciation,audio        |
            | /about-cancer/treatment/drugs/bep                                 | malignant                                 | definition,pronunciation,audio        |
