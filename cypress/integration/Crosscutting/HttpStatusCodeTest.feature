Feature: Test for checking HTTP Status Code

  Scenario Outline: Check received status code from get request
    Then correct status code <code> is received for the "<path>"

    Examples:
      | path                                                             | code |
      | /news-events/cancer-currents-blog                                | 200  |
      | /espanol/noticias/temas-y-relatos-blog                           | 200  |
      | /types/breast/research                                           | 200  |
      | /types/breast                                                    | 200  |
      | /espanol/tipos/seno                                              | 200  |
      | /types/breast/hp                                                 | 200  |
      | /about-cancer/coping/feelings/relaxation/2019-investigators-site | 200  |
      | /about-cancer                                                    | 200  |
      | /espanol/cancer                                                  | 200  |
      | /news-events/press-releases/2018                                 | 200  |
      | /espanol/noticias/comunicados-de-prensa/2018                     | 200  |
      | /about-nci/organization/screen-to-save-infographic               | 200  |
      | /espanol/infografia-nci                                          | 200  |
      | /research/progress/discovery/gutcheck-intro-video                | 200  |
      | /nano                                                            | 200  |
      | /nano/espanol/cancer/sobrellevar/sentimientos                    | 200  |
      | /pediatric-adult-rare-tumor                                      | 200  |
      | /pediatric-adult-rare-tumor/espanol                              | 200  |
      | /publications/dictionaries/cancer-terms/def/45413                | 200  |
      | /publications/dictionaries/cancer-drug                           | 200  |
      | /espanol/publicaciones/diccionario/ampliar/C                     | 200  |
      | /about-cancer/treatment/clinical-trials/search                   | 200  |
      | /about-cancer/treatment/clinical-trials/search/advanced          | 200  |
      | /research/resources                                              | 200  |
      | /research/resources/search?from=0&researchAreas=cancer_biology   | 200  |
      | /search/results?swKeyword=cancer                                 | 200  |
