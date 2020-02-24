Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario Outline: Load Events

        Given user is navigating to "<url>"
        Then the common load event properties are captured

        Examples:
            | url                                                           |
            | /                                                             |
            | /news-events/cancer-currents-blog                             |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial |
            | /espanol/noticias/temas-y-relatos-blog                        |
            | /research/key-initiatives/ras/ras-central/blog                |
            | /espanol/noticias/comunicados-de-prensa/2018                  |
            | /espanol                                                      |
            | /nano/                                                        |
            | /rare-brain-spine-tumor/                                      |
            | /pediatric-adult-rare-tumor/                                  |
            | /about-nci                                                    |
            | /espanol/instituto                                            |
            | /news-events                                                  |
            | /espanol/noticias                                             |
            | /about-cancer/coping/feelings                                 |
            | /about-cancer/coping/feelings/relaxation                      |
            | /research/progress/discovery/gutcheck-intro-video             |
            |/about-cancer/coping/feelings/relaxation/2019-investigators-site|

