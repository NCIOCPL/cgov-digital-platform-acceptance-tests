Feature: As an analytics analyst, I want to be able embed specific tracking codes on the view and enlarge functionality, so I can track their use

    Scenario: Click events for “View and Print Infographic” link from the medium template english
        Given user is navigating to "/test/embed-info-med"
        And screen breakpoint is set to "desktop"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewPrint\|inline                              |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the medium template spanish
        Given user is navigating to "/espanol/test-es/embed-info-med-es"
        And screen breakpoint is set to "desktop"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                     |
            | event71   |                                           |
            | prop66    | viewPrint\|inline                         |
            | prop67    | D=pageName                                |



    Scenario: Click events for “View and Print Infographic” link from the large template english
        Given user is navigating to "/test/embed-info-lrg"
        And screen breakpoint is set to "tablet"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewPrint\|inline                              |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the large template spanish
        Given user is navigating to "/espanol/test-es/embed-info-lrg-es"
        And screen breakpoint is set to "desktop"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                     |
            | event71   |                                           |
            | prop66    | viewPrint\|inline                         |
            | prop67    | D=pageName                                |

    Scenario: Click events for “View and Print Infographic” link from the full page infographic english
        Given user is navigating to "/about-nci/organization/nci-at-a-glance"
        And screen breakpoint is set to "tablet"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewPrint\|inline                              |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the full page infographic spanish
        Given user is navigating to "/espanol/infografia-nci"
        And screen breakpoint is set to "desktop"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                     |
            | event71   |                                                           |
            | prop66    | viewPrint\|inline                                         |
            | prop67    | D=pageName                                                |


    Scenario: Click events for “View and Print Infographic” link from the full page infographic without translation
        Given user is navigating to "/about-nci/organization/screen-to-save-infographic"
        And screen breakpoint is set to "tablet"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                                      |
            | event71   |                                                                            |
            | prop66    | viewPrint\|inline                                                          |
            | prop67    | D=pageName                                                                 |
