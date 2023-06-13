Feature: As a user I want to be able to add Internal and External promo blocks to my content

    Scenario Outline: External promo blocks components
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-external-promo-block-test"
        And NCIDS promo blocks have the following attributes
            | index | title                              | description                                        | link                   | buttonText | source                                                                                                                                     |
            | 0     | NCIDS Promo Block External Title   | Promotional image has no crops -> show placeholder | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/module\/cgov_image\/img\/placeholder-16x9.png)$                                        |
            | 1     | NCIDS Promo Block External Title   | NCIDS Promo Block External Description             | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/override-placeholder-16x9.png)$ |
            | 2     | NCIDS Promo Block External         | No image variant with light theme                  | https://www.google.com | Learn More | N/A                                                                                                                                        |
            | 3     | NCIDS Promo Block External Title 2 | N/A                                                | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/override-placeholder-16x9.png)$ |
            | 4     | NCIDS Promo Block External Title 3 | This uses the 16x9 and 1x1 crops.                  | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/promo_block_dog_source.png)$             |
            | 5     | NCIDS Promo Block External Title 4 | This uses the 16x9 crop and 1x1 override.          | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/promo_block_dog_source.png)$             |
            | 6     | NCIDS Promo Block External Title 5 | This uses the 16x9 override and 1x1 crop.          | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/promo_block_dog_16x9.png)$      |
            | 7     | NCIDS Promo Block External Title 6 | This uses the placeholder image                    | https://www.google.com | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/module\/cgov_image\/img\/placeholder-16x9.png)$                                        |
            | 8     | NCIDS Promo Block External Title 7 | No Image shown because no image option selected    | https://www.google.com | Learn More | N/A                                                                                                                                        |
        And NCIDS component has "aria-labelledby" and "id" attributes
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario Outline: Internal promo blocks components
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-internal-promo-block-test"
        And NCIDS promo blocks have the following attributes
            | index | title                               | description                                           | link                                         | buttonText | source                                                                                                                                       |
            | 0     | [Find a Clinical Trial] Card Title  | Featured Items image has no crops -> show placeholder | /test/clinical-trial-test-article            | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/module\/cgov_image\/img\/placeholder-16x9.png)$                                          |
            | 1     | [Internal Promo Block] Card Title   | N/A                                                   | /test/internal-promo-block-test-article      | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/promo_block_dog_source.png)$               |
            | 2     | NCIDS Promo Block Internal          | No image variant with light theme                     | /test/internal-promo-block-test-article      | Learn More | N/A                                                                                                                                          |
            | 3     | Internal Promo Block Title Override | N/A                                                   | /test/internal-promo-block-test-1x1-article  | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/promo_block_dog_source.png)$               |
            | 4     | Internal Promo Block Title Override | Internal Promo Block Description Override             | /test/internal-promo-block-test-16x9-article | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/promo_block_dog_16x9.png)$        |
            | 5     | [Lead IMG] Card Title               | N/A                                                   | /test/lead-img                               | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/lead-placeholder-16x9.png)$       |
            | 6     | Internal Promo Block Title Override | N/A                                                   | /test/lead-promo-img                         | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/promo-placeholder-16x9.png)$      |
            | 7     | Internal Promo Block Title Override | Internal Promo Block Description Override             | /test/lead-promo-img                         | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/override-placeholder-16x9.png)$   |
            | 8     | Feelings and Cancer                 | Internal Promo Block Description Override             | /about-cancer/coping/feelings                | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/sad-woman-looking-out-window-article.jpg)$ |
            | 9     | [No IMG] Card Title                 | [No IMG] List Description                             | /test/no-img                                 | Learn More | (\/sites\/default\/files\/styles\/ncids_promo_16x9\/module\/cgov_image\/img\/placeholder-16x9.png)$                                          |
        And NCIDS component has "aria-labelledby" and "id" attributes
        
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |


    Scenario: Internal Promo Block Dark Theme click event
        Given user is navigating to "/ncids-internal-promo-block-test"
        When user clicks on NCIDS promo block at position 4
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                         |
            | prop4     | D=pev1                                                        |
            | prop8     | english                                                       |
            | prop57    | D=v64                                                         |
            | prop58    | D=v65                                                         |
            | prop59    | D=v66                                                         |
            | prop60    | D=c67                                                         |
            | prop67    | D=pageName                                                    |
            | prop68    | D=v68                                                         |
            | evar2     | D=c8                                                          |
            | evar64    | Internal\|Internal Promo Block Title Override\|Learn More     |
            | evar65    | Promo Block\|Dark\|Image Right                                |
            | evar66    | 10\|4\|1\|1                                                   |
            | evar67    | Button\|1\|1                                                  |
            | evar68    | Body                                                          |
            | pageName  | {CANONICAL_HOST}/ncids-internal-promo-block-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-internal-promo-block-test |
            | event27   |                                                               |
            | channel   | NCI Homepage                                                  |
            | pev2      | LP:PromoBlock:LinkClick                                       |
            | linkType  | lnk_o                                                         |

    Scenario: External Promo Block Light Theme click event
        Given user is navigating to "/ncids-external-promo-block-test"
        When user clicks on NCIDS promo block at position 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                         |
            | prop4     | D=pev1                                                        |
            | prop8     | english                                                       |
            | prop57    | D=v64                                                         |
            | prop58    | D=v65                                                         |
            | prop59    | D=v66                                                         |
            | prop60    | D=c67                                                         |
            | prop67    | D=pageName                                                    |
            | prop68    | D=v68                                                         |
            | evar2     | D=c8                                                          |
            | evar64    | External\|NCIDS Promo Block External Title\|Learn More        |
            | evar65    | Promo Block\|Light\|Image Left                                |
            | evar66    | 9\|2\|1\|1                                                    |
            | evar67    | Button\|1\|1                                                   |
            | evar68    | Body                                                          |
            | pageName  | {CANONICAL_HOST}/ncids-external-promo-block-test              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-external-promo-block-test |
            | event27   |                                                               |
            | channel   | NCI Homepage                                                  |
            | pev2      | LP:PromoBlock:LinkClick                                      |
            | linkType  | lnk_o                                                         |

 