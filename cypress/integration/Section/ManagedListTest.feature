Feature: Managed Lists Tests

    Scenario Outline: Verify managed list is visible and has expected number of items
        Given user is navigating to "<url>"
        And screen breakpoint is set to "mobile"
        Then managed list section is visible
        And number of items in the list is <count>
        And each managed list description text is within reasonable length

        Examples:
            | url                  | count |
            | /                    | 4     |
            | /about-cancer        | 4     |
            | /research            | 4     |
            | /about-cancer/coping | 4     |


    Scenario Outline: Verify managed list item's components
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then managed list section is visible
        And list items at positions "<indexes>" have "titles" as "<title>"
        And list items at positions "<indexes>" have "links" as "<itemLink>"
        And list items at positions "<indexes>" have "alt texts" as "<altText>"
        And list items at positions "<indexes>" have "sources" as "/sites/default/files/styles/cgov_thumbnail/public/cgov_image/thumbnail/"
        And list items at positions "<indexes>" have "files" as "<file>"
        Examples:
            | url                  | indexes | title                                                                     | itemLink                                                                                                         | altText                                                                                                      | file                                                                                                                                                    |
            | /                    | 0,1,2,3 | Overridden Title,External Card Title,Feelings and Cancer,Overridden Title | /about-cancer/coping/feelings,https://www.google.com,/about-cancer/coping/feelings,/about-cancer/coping/feelings | Sad Woman Looking Out Window,Find a Clinical Trial,Sad Woman Looking Out Window,Sad Woman Looking Out Window | sad-woman-looking-out-window-thumb.jpg,find-clinical-trial-blue-thumb.jpg,sad-woman-looking-out-window-thumb.jpg,sad-woman-looking-out-window-thumb.jpg |
            | /about-cancer        | 0,1,2,3 | Overridden Title,External Card Title,Feelings and Cancer,Overridden Title | /about-cancer/coping/feelings,https://www.google.com,/about-cancer/coping/feelings,/about-cancer/coping/feelings | Sad Woman Looking Out Window,Find a Clinical Trial,Sad Woman Looking Out Window,Sad Woman Looking Out Window | sad-woman-looking-out-window-thumb.jpg,find-clinical-trial-blue-thumb.jpg,sad-woman-looking-out-window-thumb.jpg,sad-woman-looking-out-window-thumb.jpg |
            | /research            | 0,1,2,3 | Overridden Title,External Card Title,Feelings and Cancer,Overridden Title | /about-cancer/coping/feelings,https://www.google.com,/about-cancer/coping/feelings,/about-cancer/coping/feelings | Sad Woman Looking Out Window,Find a Clinical Trial,Sad Woman Looking Out Window,Sad Woman Looking Out Window | sad-woman-looking-out-window-thumb.jpg,find-clinical-trial-blue-thumb.jpg,sad-woman-looking-out-window-thumb.jpg,sad-woman-looking-out-window-thumb.jpg |
            | /about-cancer/coping | 0,1,2,3 | Overridden Title,External Card Title,Feelings and Cancer,Overridden Title | /about-cancer/coping/feelings,https://www.google.com,/about-cancer/coping/feelings,/about-cancer/coping/feelings | Sad Woman Looking Out Window,Find a Clinical Trial,Sad Woman Looking Out Window,Sad Woman Looking Out Window | sad-woman-looking-out-window-thumb.jpg,find-clinical-trial-blue-thumb.jpg,sad-woman-looking-out-window-thumb.jpg,sad-woman-looking-out-window-thumb.jpg |

    Scenario Outline: Verify managed list external item's components on tablet
        Given user is navigating to "<url>"
        And screen breakpoint is set to "tablet"
        Then managed list section is visible
        And the number of exit disclaimers is <externalLinkCount>
        And list items at positions "<indexes>" have "links" as "<titleLink>"
        And list items at positions "<indexes>" have "exit notification link" as "<href>"

        Examples:
            | url                  | indexes | externalLinkCount | href              | titleLink              |
            | /                    | 1       | 1                 | /policies/linking | https://www.google.com |
            | /about-cancer        | 1       | 1                 | /policies/linking | https://www.google.com |
            | /research            | 1       | 1                 | /policies/linking | https://www.google.com |
            | /about-cancer/coping | 1       | 1                 | /policies/linking | https://www.google.com |

    Scenario Outline: Negative: managed list do no appear where they should not
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then managed list does not exist

        Examples:
            | url                                                                              |
            | /about-cancer/coping/feelings/relaxation                                         |
            | /espanol/hoja-informativa-vitamina-d                                             |
            | /about-cancer/coping/feelings/relaxation/loukissas-jennifer                      |
            | /espanol/noticias/temas-y-relatos-blog/2019/my-blog-post                         |
            | /about-cancer/coping/feelings/relaxation/dfharvard                               |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site                 |
            | /news-events/press-releases/2019/annual-report-nation-2018                       |
            | /espanol/noticias/comunicados-de-prensa/2019/informe-anual-a-la-nacion-1975-2014 |
            | /about-cancer/treatment/side-effects/fatigue/fatigue-pdq                         |
            | /espanol/cancer/tratamiento/efectos-secundarios/fatiga/fatiga-pdq                |
            | /espanol/noticias/temas-y-relatos-blog                                           |
            | /types/breast                                                                    |
            | /espanol/tipos/seno                                                              |
            | /about-nci/organization/nci-at-a-glance                                          |
            | /espanol/infografia-nci                                                          |
            | /about-cancer/coping/feelings/relaxation/hedge-maze                              |