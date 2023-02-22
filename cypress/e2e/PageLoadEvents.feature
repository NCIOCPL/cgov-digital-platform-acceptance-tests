Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario: Load Event Spanish Home Page
        Given user is navigating to "/espanol"
        And screen breakpoint is set to "desktop"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                |
            | prop6     | Cáncer en español                    |
            | prop10    | Cáncer en español - NCI              |
            | prop44    | NCI Home - Spanish                   |
            | prop3     | /espanol                             |
            | prop65    | /^\d{1,4}$/                          |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/ |
            | prop29    |                                      |
            | prop8     | spanish                              |
            | evar44    | D=c44                                |
            | evar2     | D=c8                                 |
            | evar5     | Desktop                              |
            | channel   | NCI Home - Spanish                   |
            | pageName  | {CANONICAL_HOST}/espanol             |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/espanol     |
            | hier1     | {CANONICAL_HOST}\|espanol            |
            | event1    |                                      |
            | event47   | /d{0,2}/                             |
            | evar61    | cgvHomeLanding                       |



    Scenario: Load Event Home Page
        Given user is navigating to "/"
        And screen breakpoint is set to "desktop"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                  |
            | prop6     | Comprehensive Cancer Information       |
            | prop10    | Comprehensive Cancer Information - NCI |
            | prop44    | NCI Homepage                           |
            | prop8     | english                                |
            | prop3     | /                                      |
            | prop65    | /^\d{1,4}$/                            |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/   |
            | prop29    |                                        |
            | evar44    | D=c44                                  |
            | evar2     | D=c8                                   |
            | evar5     | Desktop                                |
            | channel   | NCI Homepage                           |
            | pageName  | {CANONICAL_HOST}/                      |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/              |
            | hier1     | {CANONICAL_HOST}                       |
            | event47   | /d{0,2}/                               |
            | event1    |                                        |
            | evar61    | cgvHomeLanding                         |


    Scenario: Load Event MiniLanding
        Given user is navigating to "/about-cancer/coping"
        And screen breakpoint is set to "desktop"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                        |
            | prop6     | Coping with Cancer                           |
            | prop10    | Coping with Cancer - NCI                     |
            | prop44    | Coping                                       |
            | prop3     | /about-cancer/coping                         |
            | prop65    | /^\d{1,4}$/                                  |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/         |
            | prop29    |                                              |
            | prop8     | english                                      |
            | evar44    | D=c44                                        |
            | evar2     | D=c8                                         |
            | evar5     | Desktop                                      |
            | channel   | About Cancer                                 |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping         |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping |
            | hier1     | {CANONICAL_HOST}\|about-cancer\|coping       |
            | event1    |                                              |
            | event47   | /d{0,2}/                                     |
            | evar61    | cgvMiniLanding                               |


    Scenario: Load Event Article
        Given user is navigating to "/about-cancer/coping/feelings"
        And screen breakpoint is set to "desktop"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                 |
            | prop6     | Feelings and Cancer                                   |
            | prop10    | Feelings and Cancer - NCI                             |
            | prop44    | Coping                                                |
            | prop3     | /about-cancer/coping/feelings                         |
            | prop65    | /^\d{1,4}$/                                           |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                  |
            | prop29    |                                                       |
            | prop8     | english                                               |
            | evar44    | D=c44                                                 |
            | evar2     | D=c8                                                  |
            | evar5     | Desktop                                               |
            | channel   | About Cancer                                          |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |
            | prop1     | {PROTOCOL}://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | hier1     | {CANONICAL_HOST}\|about-cancer\|coping\|feelings      |
            | event1    |                                                       |
            | event47   | /d{0,2}/                                              |
            | evar61    | cgvArticle                                            |