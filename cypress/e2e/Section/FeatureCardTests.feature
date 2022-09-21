Feature: Feature Card tests

    Scenario Outline: Verify feature cards are visible and have expected number of items
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then feature cards are visible
        And number of feature cards is <count>

        Examples:
            | url                          | count |
            | /about-nci/organization/ccct | 2     |
            | /espanol/noticias            | 3     |

    Scenario Outline: Verify feature card's components
        Given user is navigating to "<url>"
        And screen breakpoint is set to "tablet"
        Then feature cards are visible
        And feature cards at positions "<indexes>" have "titles" as "<title>"
        And feature cards at positions "<indexes>" have "descriptions" as "<description>"
        And feature cards at positions "<indexes>" have "links" as "<itemLink>"
        And feature cards at positions "<indexes>" have "alt texts" as "<altText>"
        And feature cards at positions "<indexes>" have "sources" as "/sites/default/files/styles/cgov_featured/public/cgov_image/featured/"
        And feature cards at positions "<indexes>" have "files" as "<files>"

        Examples:
            | url                          | indexes | title                                                             | description                                           | itemLink                                                                                                 | altText                                                                                               | files                                                                                                                                          |
            | /about-nci/organization/ccct | 0,1     | Feelings and Cancer,External Card Title                           | null,External Card Description                        | /about-cancer/coping/feelings,https://www.google.com                                                     | Sad Woman Looking Out Window,Find a Clinical Trial                                                    | sad-woman-looking-out-window-feature.jpg,find-clinical-trial-blue-feature-card-feat.jpg                                                        |
            | /espanol/noticias            | 0,1,2   | Los sentimientos y el cáncer,Overridden Title,External Card Title | null,Overridden description,External Card Description | /espanol/cancer/sobrellevar/sentimientos,/espanol/cancer/sobrellevar/sentimientos,https://www.google.com | Un hombre de edad mira hacia el frente.,Un hombre de edad mira hacia el frente.,Find a Clinical Trial | elderly-man-looking-out-window-feature-card.jpg,elderly-man-looking-out-window-feature-card.jpg,find-clinical-trial-blue-feature-card-feat.jpg |

    Scenario Outline: Verify feature card external item's components
        Given user is navigating to "<url>"
        And screen breakpoint is set to "mobile"
        Then feature cards are visible
        And the number of exit disclaimers is <externalLinkCount>
        And feature cards at positions "<indexes>" have "links" as "<itemLink>"
        And feature cards at positions "<indexes>" have "exit notification link href" as "<href>"

        Examples:
            | url                          | indexes | externalLinkCount | href                       | itemLink               |
            | /about-nci/organization/ccct | 1       | 1                 | /policies/linking          | https://www.google.com |
            | /espanol/noticias            | 2       | 1                 | /espanol/politicas/enlaces | https://www.google.com |