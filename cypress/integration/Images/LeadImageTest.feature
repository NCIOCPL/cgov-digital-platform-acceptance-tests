Feature: Lead Image tests

    Scenario Outline: As a user, I want to view the Lead image and Caption on pages with lead image
        Given user is navigating to "<url>"
        Then lead image is visible
        And caption text is "<caption>"

        Examples:
            | url                                           | caption                                                                                                                                                   |
            | /research-areas-genomics                      | This Circos plot visualizes data from The Cancer Genome Atlas (TCGA) and allows scientists to explore the interrelationships among different data points. |
            | /espanol/espanol-investigacion-areas-genomica | El diagrama de Circos visualiza datos del Atlas del Genoma de Cáncer (TCGA) y permite a los científicos                                                   |
            | /espanol/efectos-secundarios                  | Los implantes se insertan debajo de la piel o del músculo del pecho                                                                                       |
            | /about-cancer/treatment/side-effects          | Tell your doctor about side effects you are experiencing, so you get the care and treatment you need to manage these problems.                            |

    Scenario Outline: As a user, I want to view the Lead image and Credit on pages with lead image
        Given user is navigating to "<url>"
        Then lead image is visible
        And credit text is "<credit>"

        Examples:
            | url                                                        | credit                                 |
            | /research-areas-genomics                                   | Credit: National Cancer Institute      |
            | /espanol/espanol-investigacion-areas-genomica              | Fuente: Instituto Nacional del Cáncer |
            | /espanol/efectos-secundarios                               | Fuente: Instituto Nacional del Cáncer |
            | /about-cancer/treatment/side-effects                       | Credit: National Cancer Institute      |
            | /news-events/press-releases/2019/annual-report-nation-2018 | Credit: iStock                         |
    
    Scenario Outline: As a user, I want to view the Lead image and Alt text on pages with lead image
        Given user is navigating to "<url>"
        Then lead image is visible
        And alt text is "<alttext>"

        Examples:
            | url                                                        | alttext                                                                     |
            | /research-areas-genomics                                   | Circos plot shows data from The Cancer Genome Atlas (TCGA)                  |
            | /espanol/espanol-investigacion-areas-genomica              | El diagrama de Circos visualiza datos del Atlas del Genoma de Cáncer (TCGA) |
            | /espanol/efectos-secundarios                               | Reconstrucción                                                              |
            | /about-cancer/treatment/side-effects                       | Reconstruction                                                              |
            | /news-events/press-releases/2019/annual-report-nation-2018 | Cancer death rate chart ALT                                                 |
    
    Scenario Outline: Negative: As a user, I do not want to view the Lead image on pages without lead image
        Given user is navigating to "<url>"
        Then lead image is not visible

        Examples:
            | url                                                               |
            | /about-cancer/coping/feelings/relaxation/stress-fact-sheet        |
            | /espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres  |
            | /research/key-initiatives/ras/ras-central/blog/2017/ras-dependent |
