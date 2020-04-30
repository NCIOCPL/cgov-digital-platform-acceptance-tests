Feature: Left Navigation click events

    Scenario: Click Events for left navigation 'Feelings and Cancer' submenu
        Given user is navigating to "/about-cancer/coping"
        When user is clicking on a menu section with href "/about-cancer/coping/feelings"
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                        |
            | evar43    | Section Menu                                 |
            | evar45    | Coping with Cancer                           |
            | prop66    | feelings and cancer                          |
            | prop69    | Coping with Cancer                           |
            | prop70    | Feelings and Cancer                          |
            | link      | SectionLinkClick                             |
            | region    | nvcgSlSectionNav                             |
            | prop72    | D=pageName                                   |
            | event33   |                                              |
            | pev2      | SectionLinkClick                             |
            | linkType  | lnk_o                                        |
            | prop67    | D=pageName                                   |
            | prop4     | D=pev1                                       |
            | evar2     | english                                      |
            | prop8     | english                                      |
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/coping |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping         |


    Scenario: Click Events for left navigation 'Learning to relax' submenu
        Given user is navigating to "/about-cancer/coping/feelings"
        When user is clicking on a menu section with href "/about-cancer/coping/feelings/relaxation"
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                 |
            | evar43    | Section Menu                                          |
            | evar45    | Coping with Cancer                                    |
            | prop66    | learning to relax                                     |
            | prop69    | Coping with Cancer                                    |
            | prop70    | Learning to Relax                                     |
            | link      | SectionLinkClick                                      |
            | region    | nvcgSlSectionNav                                      |
            | event33   |                                                       |
            | pev2      | SectionLinkClick                                      |
            | linkType  | lnk_o                                                 |
            | prop67    | D=pageName                                            |
            | prop4     | D=pev1                                                |
            | evar2     | english                                               |
            | prop8     | english                                               |
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/coping/feelings |
            | pageName  | {CANONICAL_HOST}/about-cancer/coping/feelings         |