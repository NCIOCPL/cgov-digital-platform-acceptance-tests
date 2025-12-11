Feature: Viewing glossary pop-ups when available while visiting cancer info summary and drug info summary pages

    Scenario Outline: PDQ Information summary glossary links
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        When user is clicking on definition for "<termName>"
        Then pop-up definition box is displayed for "<termName>"
        And definition box displays all "<features>" provided by glossary


        Examples:
            | breakpoint | url                                                               | termName                                  | features                              |
            | desktop    | /types/breast/patient/breast-treatment-pdq                        | breast                                    | definition,pronunciation,audio,img[2] |
            | desktop    | /espanol/tipos/seno/paciente/tratamiento-seno-pdq                 | mama                                      | definition,audio,img[2]               |
            | desktop    | /types/breast/hp/breast-ovarian-genetics-pdq                      | family history                            | definition,pronunciation,audio        |
            | desktop    | /types/breast/patient/breast-screening-pdq                        | screening                                 | definition,pronunciation,audio        |
            | desktop    | /espanol/tipos/seno/paciente/deteccion-seno-pdq                   | científico                                | definition,audio                      |
            | desktop    | /types/breast/patient/breast-prevention-pdq                       | cancer                                    | definition,pronunciation,audio        |
            | desktop    | /espanol/tipos/seno/paciente/prevencion-seno-pdq                  | prevención                                | definition,audio                      |
            | tablet     | /types/brain/patient/child-glioma-treatment-pdq                   | oxygen                                    | definition,pronunciation,audio        |
            | tablet     | /types/brain/hp/child-glioma-treatment-pdq                        | 3-dimensional conformal radiation therapy | definition,pronunciation,audio        |
            | tablet     | /espanol/tipos/cerebro/paciente/tratamiento-cerebro-infantil-pdq  | sistema nervioso central                  | definition,audio,img[1]               |
            | tablet     | /about-cancer/treatment/cam/patient/vitamin-c-pdq                 | collagen                                  | definition,pronunciation,audio        |
            | tablet     | /about-cancer/treatment/cam/hp/vitamin-c-pdq                      | cancer                                    | definition,pronunciation,audio        |
            | tablet     | /espanol/cancer/tratamiento/mca/paciente/vitamina-c-pdq           | vitamina C                                | definition,audio                      |
            | tablet     | /espanol/cancer/tratamiento/mca/pro/vitamina-c-pdq                | cáncer                                    | definition,audio                      |
            | tablet     | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq          | chemotherapy                              | definition,pronunciation,audio        |
            | tablet     | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq | cáncer                                    | definition,audio                      |
            | tablet     | /about-cancer/treatment/drugs/bevacizumab                         | drug                                      | definition,pronunciation,audio        |
            | tablet     | /about-cancer/treatment/drugs/bep                                 | malignant                                 | definition,pronunciation,audio        |

    Scenario Outline: Glossary popup link styles
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        When user is clicking on definition for "<termName>"
        Then pop-up definition box is displayed for "<definition>"
        And definition box displays all "<features>" provided by glossary


        Examples:
            | breakpoint | url                                      | termName                            | features                              | definition                          |
            | desktop    | /test/dictionary-link-test-press-release | chemotherapy                        | definition,pronunciation,audio        | chemotherapy                        |
            | desktop    | /test/dictionary-link-test-press-release | Metastatic                          | definition,pronunciation,audio,img[1] | metastasis                          |
            | desktop    | /test/dictionary-link-test-press-release | stage III esophageal adenocarcinoma | definition,pronunciation,audio,img[3] | stage III esophageal adenocarcinoma |
            | desktop    | /test/dictionary-link-test-press-release | Squamous cell carcinoma             | definition,pronunciation,audio        | squamous cell carcinoma             |
            | desktop    | /test/dictionary-link-test-press-release | pleural cavity                      | definition,audio,pronunciation        | pleural cavity                      |
            | desktop    | /test/dictionary-link-test-press-release | first-degree relative               | definition,pronunciation,audio        | first-degree relative               |
            | desktop    | /test/dictionary-link-test-press-release | retinoblastoma                      | definition,pronunciation,audio        | retinoblastoma                      |
            | tablet     | /test/dictionary-link-test-press-release | autosomal dominant                  | definition,pronunciation,audio,img[1] | autosomal dominant inheritance      |

    Scenario: Negative test cases for popups that 404
        Given user is navigating to "/test/dictionary-link-test-press-release"
        When user is clicking on definition for "unknown definition"
        And definition box displays "Definition Not Found"


    Scenario Outline: PDQ Information summary glossary links on mobile
        Given screen breakpoint is set to "mobile"
        When user is navigating to "<url>"
        And user expands accordion section "<sectionName>"
        And user is clicking on definition for "<termName>"
        Then pop-up definition box is displayed for "<termName>"
        And definition box displays all "<features>" provided by glossary

        Examples:
            | url                                               | termName       | features                              | sectionName                                 |
            | /types/breast/patient/breast-treatment-pdq        | breast         | definition,pronunciation,audio,img[2] | General Information About Breast Cancer     |
            | /espanol/tipos/seno/paciente/tratamiento-seno-pdq | mama           | definition,audio,img[2]               | Información general sobre el cáncer de mama |
            | /types/breast/hp/breast-ovarian-genetics-pdq      | family history | definition,pronunciation,audio        | Introduction                                |