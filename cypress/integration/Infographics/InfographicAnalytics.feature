Feature: As an analytics analyst, I want to be able embed specific tracking codes on the view and enlarge functionality, so I can track their use

    Scenario: Click events for “View and Print Infographic” link from the medium template english
        Given user is navigating to "/test/embed-info-med"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewprint\|inline\|Pediatric MATCH Infographic |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the medium template spanish
        Given user is navigating to "/espanol/test-es/embed-info-med-es"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                     |
            | event71   |                                           |
            | prop66    | viewprint\|inline\|Estudio MATCH Infantil |
            | prop67    | D=pageName                                |



    Scenario: Click events for “View and Print Infographic” link from the large template english
        Given user is navigating to "/test/embed-info-lrg"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewprint\|inline\|Pediatric MATCH Infographic |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the large template spanish
        Given user is navigating to "/espanol/test-es/embed-info-lrg-es"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                     |
            | event71   |                                           |
            | prop66    | viewprint\|inline\|Estudio MATCH Infantil |
            | prop67    | D=pageName                                |

    Scenario: Click events for “View and Print Infographic” link from the full page infographic english
        Given user is navigating to "/about-nci/organization/nci-at-a-glance"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                          |
            | event71   |                                                |
            | prop66    | viewprint\|inline\|NCI at a Glance Infographic |
            | prop67    | D=pageName                                     |

    Scenario: Click events for “View and Print Infographic” link from the full page infographic spanish
        Given user is navigating to "/espanol/infografia-nci"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                     |
            | event71   |                                                           |
            | prop66    | viewprint\|inline\|Instituto Nacional del Cáncer Panorama |
            | prop67    | D=pageName                                                |


    Scenario: Click events for “View and Print Infographic” link from the full page infographic without translation
        Given user is navigating to "/about-nci/organization/screen-to-save-infographic"
        When user clicks on View and Print Infographic button
        And page click request is sent
        Then the following parameters should be captured
            | parameter | value                                                                      |
            | event71   |                                                                            |
            | prop66    | viewprint\|inline\|Cancer and the Human Tumor Atlas Network Infographic |
            | prop67    | D=pageName                                                                 |
