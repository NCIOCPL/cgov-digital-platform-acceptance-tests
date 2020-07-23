Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario: Load Event Spanish Home Page
        Given user is navigating to "/espanol"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                             |
            | prop6     | Cáncer en español                                 |
            | prop10    | Cáncer en español - Instituto Nacional del Cáncer |
            | prop44    | NCI Home - Spanish                                |
            | prop3     | /espanol                                          |
            | prop65    | /^\d{1,4}$/                                       |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/              |
            | prop29    |                                                   |
            | prop8     | spanish                                           |
            | evar44    | D=c44                                             |
            | evar2     | D=c8                                              |
            | evar5     | Desktop                                           |
            | channel   | NCI Home - Spanish                                |
            | pageName  | {CANONICAL_HOST}/espanol                          |
            | prop1     | https://{CANONICAL_HOST}/espanol                  |
            | hier1     | {CANONICAL_HOST}\|espanol                         |
            | event1    |                                                   |
            | event47   | /d{0,2}/                                          |



    Scenario: Load Event Home Page
        Given user is navigating to "/"
        When page load request is sent
        Then the following parameters should be captured
            | parameter | value                                                        |
            | prop6     | Comprehensive Cancer Information                             |
            | prop10    | Comprehensive Cancer Information - National Cancer Institute |
            | prop44    | NCI Homepage                                                 |
            | prop8     | english                                                      |
            | prop3     | /                                                            |
            | prop65    | /^\d{1,4}$/                                                  |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                         |
            | prop29    |                                                              |
            | evar44    | D=c44                                                        |
            | evar2     | D=c8                                                         |
            | evar5     | Desktop                                                      |
            | channel   | NCI Homepage                                                 |
            | prop3     | /                                                            |
            | pageName  | {CANONICAL_HOST}/                                            |
            | prop1     | https://{CANONICAL_HOST}/                                    |
            | hier1     | {CANONICAL_HOST}                                             |
            | event47   | /d{0,2}/                                                     |
            | event1    |                                                              |