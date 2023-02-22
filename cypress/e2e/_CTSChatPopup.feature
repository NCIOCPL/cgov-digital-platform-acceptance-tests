Feature: As an user, I should see the chat popup in Spanish

Scenario: Clicking on chat now will fire an analytics event
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/espanol/cancer/tratamiento/medicamentos"
        Then page title is "ES Cancer Medicamentos - Test"
        And Spanish chat pop up is displayed
        When user clicks on chat button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                            |
            | event44   |                                                                  |
            | link      | ProactiveChat                                                    |
            | linkType  | lnk_o                                                            |
            | prop67    | D=pageName                                                       |
            | prop4     | D=pev1                                                           |
            | prop8     | spanish                                                          |
            | prop5     | livehelp_proactive chat - launch\|D=pageName                     |
            | pageName  | {CANONICAL_HOST}/espanol/cancer/tratamiento/medicamentos         |
            | evar2     | spanish                                                          |

 Scenario: Clicking on chat now will fire an analytics event English
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/about-cancer/treatment/clinical-trials/search/r?loc=0&rl=1"
        Then page title is "Clinical Trials Search Results"
        And chat pop up is displayed
        When user clicks on chat button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                            |
            | event44   |                                                                  |
            | link      | ProactiveChat                                                    |
            | linkType  | lnk_o                                                            |
            | prop67    | D=pageName                                                       |
            | prop4     | D=pev1                                                           |
            | prop8     | english                                                          |
            | prop5     | livehelp_proactive chat - launch\|D=pageName                     |
            | pageName  | {CANONICAL_HOST}/about-cancer/treatment/clinical-trials/search/r |
            | evar2     | english                                                          |
