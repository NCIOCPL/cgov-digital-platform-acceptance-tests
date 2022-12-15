Feature: Test for checking HTTP Status Code

  Scenario Outline: Check received status code from get request
    And screen breakpoint is set to "<breakpoint>"
    Then correct status code <code> is received for the "<path>"

    Examples:
      | breakpoint | path                                                             | code |
      | desktop    | /news-events/cancer-currents-blog                                | 200  |
      | desktop    | /espanol/noticias/temas-y-relatos-blog                           | 200  |
      | desktop    | /types/breast/research                                           | 200  |
      | tablet     | /types/breast                                                    | 200  |
      | desktop    | /espanol/tipos/seno                                              | 200  |
      | desktop    | /types/breast/hp                                                 | 200  |
      | tablet     | /about-cancer/coping/feelings/relaxation/2019-investigators-site | 200  |
      | tablet     | /about-cancer                                                    | 200  |
      | tablet     | /espanol/cancer                                                  | 200  |
      | mobile     | /news-events/press-releases/2018                                 | 200  |
      | mobile     | /espanol/noticias/comunicados-de-prensa/2018                     | 200  |
      | mobile     | /about-nci/organization/screen-to-save-infographic               | 200  |
      | mobile     | /espanol/infografia-nci                                          | 200  |
      | desktop    | /research/progress/discovery/gutcheck-intro-video                | 200  |
      | desktop    | /nano                                                            | 200  |
      | tablet     | /nano/espanol/cancer/sobrellevar/sentimientos                    | 200  |
      | desktop    | /pediatric-adult-rare-tumor                                      | 200  |
      | tablet     | /pediatric-adult-rare-tumor/espanol                              | 200  |
      | desktop    | /publications/dictionaries/cancer-terms/def/45413                | 200  |
      | desktop    | /publications/dictionaries/cancer-drug                           | 200  |
      | desktop    | /espanol/publicaciones/diccionarios/diccionario-cancer/ampliar/C | 200  |
      | desktop    | /about-cancer/treatment/clinical-trials/search                   | 200  |
      | desktop    | /about-cancer/treatment/clinical-trials/search/advanced          | 200  |
      | desktop    | /research/resources                                              | 200  |
      | desktop    | /research/resources/search?from=0&researchAreas=cancer_biology   | 200  |
      | desktop    | /search/results?swKeyword=cancer                                 | 200  |
