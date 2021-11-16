Feature: Footer tests

Scenario Outline: Verify that Footer exists on the pages and it's components are correct
        Given user is navigating to "<url>"
        Then footer section is visible
        And there is only one footer on a page
        And footer header text is "<header>"
        And footer text is within reasonable range
        And the footer text does not contain any broken links
        
        Examples:
            | url                                                                               | header                        |
            | espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin           | Instituto Nacional del Cáncer |
            | about-cancer/coping/feelings                                                      | National Cancer Institute     |
            | annual-report-nation-2018                                                         | National Cancer Institute     |
            | types/breast/patient/breast-treatment-pdq                                         | National Cancer Institute     |
            | /news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                      | National Cancer Institute     |
            | espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres                   | Instituto Nacional del Cáncer |
            | news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly | National Cancer Institute     |