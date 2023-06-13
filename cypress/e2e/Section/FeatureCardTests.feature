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
        And feature cards at positions "<indexes>" have "sources" as "/files/styles/cgov_featured/public/cgov_image/featured/"
        And feature cards at positions "<indexes>" have "files" as "<files>"

        Examples:
            | url                          | indexes | title                                                                      | description                                                   | itemLink                                                                                                 | altText                                                                                               | files                                                                                                                                          |
            | /about-nci/organization/ccct | 0,1     | Feelings and Cancer,External Card Title                                    | null,External Card Description                                | /about-cancer/coping/feelings,https://www.google.com                                                     | Sad Woman Looking Out Window,Find a Clinical Trial                                                    | sad-woman-looking-out-window-feature.jpg,find-clinical-trial-blue-feature-card-feat.jpg                                                        |
            | /espanol/noticias            | 0,1,2   | Los sentimientos y el cáncer,Overridden Title,Título de la tarjeta externa | null,Overridden description,Descripción de la tarjeta externa | /espanol/cancer/sobrellevar/sentimientos,/espanol/cancer/sobrellevar/sentimientos,https://www.google.com | Un hombre de edad mira hacia el frente.,Un hombre de edad mira hacia el frente.,Find a Clinical Trial | elderly-man-looking-out-window-feature-card.jpg,elderly-man-looking-out-window-feature-card.jpg,find-clinical-trial-blue-feature-card-feat.jpg |

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


    Scenario Outline: Verify NCIDS 3 feature card row components
        Given screen breakpoint is set to "<breakpoint"
        And user is navigating to "/ncids-internal-feature-card-test"
        Then NCIDS feature cards are visible
        And NCIDS feature cards have the following attributes
            | index | title                              | description                                                                   | link                                  | altText                       | source                                                                   | file                                       |
            | 0     | [Internal Feature Card] Card Title | N/A                                                                           | /test/internal-card-test-article      | Feature Card Cat              | /files/styles/ncids_featured_16x9/public/cgov_image/media_image          | feature_card_test_cat_override_source.jpeg |
            | 1     | Internal Card Title Override       | N/A                                                                           | /test/internal-card-test-16x9-article | 16x9 Override Image           | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | feature_card_test_cat_16x9_override.jpeg   |
            | 2     | Internal Card Title Override       | Internal Card Description Override                                            | /test/internal-card-test-4x3-article  | Feature Card Cat 4x3 Override | /files/styles/ncids_featured_16x9/public/cgov_image/media_image          | feature_card_test_cat_override_source.jpeg |
            | 3     | [Lead IMG] Card Title              | N/A                                                                           | /test/lead-img                        | Lead Placeholder              | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | lead-placeholder-16x9.png                  |
            | 4     | Internal Card Title Override       | N/A                                                                           | /test/lead-promo-img                  | Promo Placeholder             | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | promo-placeholder-16x9.png                 |
            | 5     | Internal Card Title Override       | Internal Card Description Override                                            | /test/lead-promo-img                  | Override Placeholder          | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | override-placeholder-16x9.png              |
            | 6     | Internal Card Title Override       | Image has no crops -> show placeholder                                        | /test/clinical-trial-test-article     | No Image Placeholder          | /files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9.png                       |
            | 7     | Feelings and Cancer                | Internal Card Description Override - Small Lead Article Image being scaled up | /about-cancer/coping/feelings         | Sad Woman Looking Out Window  | /files/styles/ncids_featured_16x9/public/cgov_image/media_image          | sad-woman-looking-out-window-article.jpg   |
            | 8     | [No IMG] Card Title                | [No IMG] List Description                                                     | /test/no-img                          | No Image Placeholder          | /files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9.png                       |
        And NCIDS component has "aria-labelledby" and "id" attributes

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario Outline: Verify NCIDS 3 external feature card row components
        Given screen breakpoint is set to "<breakpoint"
        And user is navigating to "/ncids-external-feature-card-test"
        Then NCIDS feature cards are visible
        And NCIDS feature cards have the following attributes
            | index | title               | description                                                            | link                   | altText                       | source                                                                   | file                                       |
            | 0     | External Card Title | Image using 16x9 and 4x3 Override Fields                               | https://www.google.com | Override Placeholder          | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | override-placeholder-16x9.png              |
            | 1     | External Card Title | This is a use case of the card using the images crops for 16x9 and 4x3 | https://www.google.com | Feature Card Cat              | /files/styles/ncids_featured_16x9/public/cgov_image/media_image          | feature_card_test_cat_override_source.jpeg |
            | 2     | External Card Title | This uses the 4x3 crop and the 16x9 override                           | https://www.google.com | 16x9 Override Image           | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | feature_card_test_cat_16x9_override.jpeg   |
            | 3     | External Card Title | Image using 16x9 crop and 4x3 Override Fields                          | https://www.google.com | Feature Card Cat 4x3 Override | /files/styles/ncids_featured_16x9/public/cgov_image/media_image          | feature_card_test_cat_override_source.jpeg |
            | 4     | External Card Title | N/A                                                                    | https://www.google.com | Override Placeholder          | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | override-placeholder-16x9.png              |
            | 5     | External Card Title | External Card Description                                              | https://www.google.com | No Image Placeholder          | /files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9.png                       |
            | 6     | External Card Title | Image has no crop -> Show placeholder                                  | https://www.google.com | No Image Placeholder          | /files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9.png                       |
        And NCIDS component has "aria-labelledby" and "id" attributes

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Internal Feature card click event
        Given user is navigating to "/ncids-internal-feature-card-test"
        When user clicks on NCIDS feature card at position 4
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar64    | Internal\|[Lead IMG] Card Title\|Image                         |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 3\|2\|3\|1                                                     |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/ncids-internal-feature-card-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-internal-feature-card-test |
            | event27   |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | LP:FeatureCard:LinkClick                                       |
            | linkType  | lnk_o                                                          |


    Scenario: External Feature card click event
        Given user is navigating to "/ncids-external-feature-card-test"
        When user clicks on NCIDS feature card at position 7
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar64    | External\|External Card Title\|Image                           |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 3\|3\|1\|1                                                     |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/ncids-external-feature-card-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-external-feature-card-test |
            | event27   |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | LP:FeatureCard:LinkClick                                       |
            | linkType  | lnk_o                                                          |

