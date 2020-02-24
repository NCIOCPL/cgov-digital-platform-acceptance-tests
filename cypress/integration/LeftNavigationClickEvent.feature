Feature: Common Google Analytics Load events properties are captured across all content types

    Scenario: Click Events for left navogation Learning to relax

        Given user is navigating to "/about-cancer/coping/feelings"
        Then user is clicking on a menu section with href "/about-cancer/coping/feelings/relaxation"
        Then the common click event properties are captured
        And the following analytics variables should be captured
            | evar43    | Section Menu     |
            | events | event33          |
            | pev2   | SectionLinkClick |

            Scenario: Click Events for left navigation feelings

        Given user is navigating to "/about-cancer/coping"
       Then user is clicking on a menu section with href "/about-cancer/coping/feelings"
        Then the common click event properties are captured
        And the following analytics variables should be captured
            | evar43    | Section Menu     |
            | events | event33          |
            | pev2   | SectionLinkClick |

    


