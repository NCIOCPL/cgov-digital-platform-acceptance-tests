Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario: Load Event Spanish Home Page
        Given user is navigating to "/espanol" with added wait
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                             |
            | prop6     | Cáncer en español                                 |
            | prop10    | Cáncer en español - Instituto Nacional del Cáncer |
            | prop42    | Normal                                            |
            | prop44    | NCI Home - Spanish                                |
            | prop3     | /espanol                                          |
            | prop65    | /^\d{1,4}$/                                       |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/              |
            | prop29    | /^\d{1,2}:\d{2} (AM\|PM)\|[a-zA-z]+day$/          |
            | prop8     | spanish                                           |
            | evar44    | NCI Home - Spanish                                |
            | evar2     | spanish                                           |
            | channel   | NCI Home - Spanish                                |
            | pageType  | cgvHomeLanding                                    |
            | pageName  | {CANONICAL_HOST}/espanol                          |
            | evar1     | {CANONICAL_HOST}/espanol                          |
            | prop1     | https://{CANONICAL_HOST}/espanol                  |
            | hier1     | {CANONICAL_HOST}\|espanol                         |
            | event1    |                                                   |
            | event47   | /d{0,2}/                                          |



    Scenario: Load Event Home Page
        Given user is navigating to "/" with added wait
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                        |
            | prop6     | Comprehensive Cancer Information                             |
            | prop10    | Comprehensive Cancer Information - National Cancer Institute |
            | prop42    | Normal                                                       |
            | prop44    | NCI Homepage                                                 |
            | prop8     | english                                                      |
            | prop3     | /                                                            |
            | prop65    | /^\d{1,4}$/                                                  |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                         |
            | prop29    | /^\d{1,2}:\d{2} (AM\|PM)\|[a-zA-z]+day$/                     |
            | evar44    | NCI Homepage                                                 |
            | evar2     | english                                                      |
            | pageType  | cgvHomeLanding                                               |
            | channel   | NCI Homepage                                                 |
            | prop3     | /                                                            |
            | pageName  | {CANONICAL_HOST}/                                            |
            | evar1     | {CANONICAL_HOST}/                                            |
            | prop1     | https://{CANONICAL_HOST}/                                    |
            | hier1     | {CANONICAL_HOST}                                             |
            | event47   | /d{0,2}/                                                     |
            | event1    |                                                              |





# Examples:
#     | url                                                              |
#     | /                                                                |
#     | /news-events/cancer-currents-blog                                |
#     | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial    |
#     | /espanol/noticias/temas-y-relatos-blog                           |
#     | /research/key-initiatives/ras/ras-central/blog                   |
#     | /espanol/noticias/comunicados-de-prensa/2018                     |
#     | /espanol                                                         |
#     | /nano/                                                           |
#     | /rare-brain-spine-tumor/                                         |
#     | /pediatric-adult-rare-tumor/                                     |
#     | /about-nci                                                       |
#     | /espanol/instituto                                               |
#     | /news-events                                                     |
#     | /espanol/noticias                                                |
#     | /about-cancer/coping/feelings                                    |
#     | /about-cancer/coping/feelings/relaxation                         |
#     | /research/progress/discovery/gutcheck-intro-video                |
#     | /about-cancer/coping/feelings/relaxation/2019-investigators-site |

