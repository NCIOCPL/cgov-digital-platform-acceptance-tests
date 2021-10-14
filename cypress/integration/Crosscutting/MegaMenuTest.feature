Feature: As a user, I want to be able to view and interact with the Mega Menu

    Scenario Outline: As a user, I want to view the Mega Menu with correct categories and menu items when I am on desktop
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then mega menu is displayed
        And main categories titles are "<titles>"
        And correct <number> of top-level menu items is displayed
        And each menu <number> is within reasonable text length "<boundary>"
        Examples:
            | breakpoint | url                                                                      | number | boundary | titles                                                                       |
            | desktop    | /espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin | 5      | 150:1800 | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           |
            | desktop    | /about-cancer/coping/feelings                                            | 6      | 200:1800 | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI |
            | desktop    | /annual-report-nation-2018                                               | 6      | 200:1800 | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI |
            | desktop    | /news-events/press-releases/2018/oropharyngeal-hpv-cisplatin             | 6      | 200:1800 | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI |
            | desktop    | /espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres         | 5      | 150:1800 | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           |
            | desktop    | /nano                                                                    | 6      | 200:1800 | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI |
            | desktop    | /nano/espanol/cancer/sobrellevar/sentimientos                            | 5      | 150:1800 | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           |
            | desktop    | /pediatric-adult-rare-tumor                                              | 6      | 200:1800 | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI |
            | desktop    | /pediatric-adult-rare-tumor/espanol                                      | 5      | 150:1800 | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           |



    Scenario Outline: as a user, I want to interact with mega menu while I am on tablet or mobile
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then hamburger menu is displayed
        When user clicks on hamburger menu
        Then correct <number> of top-level menu items is displayed
        And main categories titles are "<titles>"
        Then the length of the side sub menus text is within reasonable "<range>"
        Examples:
            | breakpoint | url                                           | titles                                                                       | number | range  |
            | tablet     | /publications/dictionaries/cancer-terms       | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /                                             | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /espanol                                      | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | tablet     | /espanol/publicaciones/diccionario            | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | tablet     | /nano                                         | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /nano/espanol/cancer/sobrellevar/sentimientos | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | tablet     | /research                                     | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /pediatric-adult-rare-tumor/grants-training   | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /rare-brain-spine-tumor                       | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | tablet     | /rare-brain-spine-tumor/espanol               | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | mobile     | /publications/dictionaries/cancer-terms       | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | /                                             | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | /espanol                                      | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | mobile     | /espanol/publicaciones/diccionario            | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | mobile     | /nano                                         | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | /nano/espanol/cancer/sobrellevar/sentimientos | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
            | mobile     | /research                                     | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | /pediatric-adult-rare-tumor/grants-training   | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | rare-brain-spine-tumor                        | ABOUT CANCER,CANCER TYPES,RESEARCH,GRANTS & TRAINING,NEWS & EVENTS,ABOUT NCI | 6      | 40:800 |
            | mobile     | rare-brain-spine-tumor/espanol                | EL CÁNCER,TIPOS DE CÁNCER,INVESTIGACIÓN,NOTICIAS,NUESTRO INSTITUTO           | 5      | 40:800 |
