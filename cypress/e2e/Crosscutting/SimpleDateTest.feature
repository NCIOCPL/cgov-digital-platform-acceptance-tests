Feature: Test for checking dates

    Scenario Outline:Verify pages with simple dates
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then date is displayed
        And the date "text" is "<text>"
        And the date "label" is "<label>"
        And the date "stamp" is "<stamp>"

        Examples:
            | breakpoint | url                                                        | label          | stamp                 | text                 |
            | desktop    | about-cancer/coping/feelings                               | Updated:       | August 20, 2018       | 2018-08-20T12:00:00Z |
            | desktop    | espanol/cancer/sobrellevar/sentimientos                    | Actualización: | 20 de agosto de 2018  | 2018-08-20T12:00:00Z |
            | desktop    | about-cancer/coping/feelings/relaxation                    | Posted:        | February 29, 2016     | 2016-02-29T12:00:00Z |
            | desktop    | espanol/cancer/sobrellevar/sentimientos/relajarse          | Publicación:   | 29 de febrero de 2016 | 2016-02-29T12:00:00Z |
            | tablet     | types/breast/reconstruction-fact-sheet                     | Reviewed:      | March 12, 2016        | 2016-03-12T12:00:00Z |
            | tablet     | espanol/hoja-informativa-reconstruccion                    | Revisión:      | 12 de marzo de 2016   | 2016-03-12T12:00:00Z |
            | tablet     | about-cancer/coping/feelings/relaxation/loukissas-jennifer | Updated:       | February 7, 2019      | 2019-02-07T12:00:00Z |
            | mobile     | about-cancer/coping/feelings/relaxation/chanock-stephen    | Updated:       | February 7, 2019      | 2019-02-07T12:00:00Z |
            | mobile     | about-cancer/coping/feelings/relaxation/duke-university    | Updated:       | January 9, 2015       | 2015-01-09T12:00:00Z |


    Scenario Outline: Negative: Verify that dates do not exist
        Given user is navigating to "<url>"
        And screen breakpoint is set to "mobile"
        Then dates do not appear
        Examples:
            | url                                                       |
            | about-cancer/coping/article-no-date                       |
            | about-cancer/coping/feelings/relaxation/duke-no-date      |
            | about-cancer/coping/feelings/relaxation/biography-no-date |
            | espanol/cancer/sobrellevar/esparticle-no-date             |
            | about-nci/organization/nci-at-a-glance                    |
            | espanol/match-infantil-infografia                         |
            | about-cancer/coping/feelings/relaxation/hedge-maze        |
            | espanol/investigacion/es-hedge-maze                       |