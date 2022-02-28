Feature: function test for share options on special report template for Annual Plan
    Scenario: User views the AP landing page
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "desktop"
        Then the page options should appear in a fixed position to the right of the main content area
        And the following page options are displayed
            | pageOption |
            | Facebook   |
            | Twitter    |
            | Print      |
            | Email      |

    Scenario: User views the AP landing page on Tablet and Mobile
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "mobile"
        Then the page options should appear under the bottom of the content area
        And the following page options are displayed
            | pageOption |
            | Facebook   |
            | Twitter    |
            | Email      |
        And "Print" option is not displayed
        And the page options will have a header "SHARE THIS PAGE"

    Scenario: User views the Spanish AP landing page on Tablet
        Given user is navigating to "/espanol/special-report"
        And screen breakpoint is set to "tablet"
        Then the page options should appear under the bottom of the content area
        And the following page options are displayed
            | pageOption                    |
            | Facebook                      |
            | Twitter                       |
            | Enviar por correo electrónico |
        And "Print" option is not displayed
        And the page options will have a header "COMPARTIR ESTA PÁGINA"


    ###############AP Share Options Analytics#############
    Scenario: Click events for Facebook page options on tablet
        Given screen breakpoint is set to "tablet"
        And user is navigating to "/special-report"
        When user clicks on a page option "Facebook" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event17   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop43    | Facebook                                |
            | prop66    | social-share_facebook                   |
            | prop67    | D=pageName                              |
            | evar2     | english                                 |
            | pageURL   | https://{CANONICAL_HOST}/special-report |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | link      | BookmarkShareClick                      |

    Scenario: Click events for Twitter page options on mobile
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/special-report"
        When user clicks on a page option "Twitter" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event17   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop43    | Twitter                                 |
            | prop66    | social-share_twitter                    |
            | prop67    | D=pageName                              |
            | evar2     | english                                 |
            | pageURL   | https://{CANONICAL_HOST}/special-report |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | link      | BookmarkShareClick                      |

    Scenario: Click events for Print page options on desktop
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/special-report"
        When user clicks on a page option "Print" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event17   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop43    | Print                                   |
            | prop66    | print                                   |
            | prop67    | D=pageName                              |
            | evar2     | english                                 |
            | pageURL   | https://{CANONICAL_HOST}/special-report |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | link      | PrintLink                               |

    Scenario: Click events for Email page options for spanish desktop
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/espanol/special-report"
        When user clicks on a page option "Enviar por correo electrónico" link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                           |
            | event17   |                                                 |
            | prop4     | D=pev1                                          |
            | prop8     | spanish                                         |
            | prop43    | Email                                           |
            | prop66    | email                                           |
            | prop67    | D=pageName                                      |
            | pageURL   | https://{CANONICAL_HOST}/espanol/special-report |
            | pageName  | {CANONICAL_HOST}/espanol/special-report         |
            | link      | eMailLink                                       |