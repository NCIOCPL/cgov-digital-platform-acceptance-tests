Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario: Load Event Home Page
        Given user is navigating to "/"
        When page load request is sent
        Then the following page load parameters should be captured
            | pageType | cgvHomeLanding                                               |
            | prop6    | Comprehensive Cancer Information                             |
            | prop10   | Comprehensive Cancer Information - National Cancer Institute |
            | prop42   | Normal                                                       |
            | prop44   | NCI Homepage                                                 |
            | evar44   | NCI Homepage                                                 |
            | evar2    | english                                                      |
            | prop8    | english                                                      |
            | channel  | NCI Homepage                                                 |
            | prop3    | /                                                            |
        And the following parameters contain current url
            | prop1    |
            | evar1    |
            | hier1    |
            | pageName |
            | pageURL  |
        And prop26, prop29, prop 65 are matching expected format
        And the following events are captured
            | events | event1  |
            | events | event47 |


    Scenario: Load Event Spanish Home Page
        Given user is navigating to "/espanol"
        When page load request is sent
        Then the following page load parameters should be captured

            | pageType | cgvHomeLanding                                    |
            | prop6    | Cáncer en español                                 |
            | prop10   | Cáncer en español - Instituto Nacional del Cáncer |
            | prop42   | Normal                                            |
            | prop44   | NCI Home - Spanish                                |
            | evar44   | NCI Home - Spanish                                |
            | evar2    | spanish                                           |
            | prop8    | spanish                                           |
            | channel  | NCI Home - Spanish                                |
            | prop3    | /espanol                                          |
        And the following parameters contain current url
            | prop1    |
            | evar1    |
            | pageName |
            | pageURL  |
        And prop26, prop29, prop 65 are matching expected format
        And the following events are captured
            | events | event1  |
            | events | event47 |

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

