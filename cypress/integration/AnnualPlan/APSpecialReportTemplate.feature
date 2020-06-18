Feature: function test for special report template for Annual Plan

    Scenario: User views the AP landing page
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "desktop"
        Then the hero image should be displayed full width with the following
            | attribute | value                                                                                |
            | alt       | AP FY 2022 Hero                                                                      |
            | image     | \/sites\/default\/files\/cgov_hero\/banner/\d{4}-\d{2}\/apfy22-hero-placeholder\.jpg |
            | width     | 2880                                                                                 |
            | height    | 1080                                                                                 |
        And the hero image title text is "NCI Annual Plan & Budget Proposal For Fiscal Year 2022"
        And the main content area should appear
        And left navigation menu is not displayed


    Scenario: User views the AP landing page on Tablet
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "tablet"
        Then the hero image should be displayed full width with the following
            | attribute    | value                                                                                |
            | alt          | AP FY 2022 Hero                                                                      |
            | desktopImage | \/sites\/default\/files\/cgov_hero\/banner/\d{4}-\d{2}\/apfy22-hero-placeholder\.jpg |
            | width        | 2880                                                                                 |
            | height       | 1080                                                                                 |
        And the hero image title text is "NCI Annual Plan & Budget Proposal For Fiscal Year 2022"
        And the main content area should appear


    Scenario: User views the AP landing page on Mobile
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "mobile"
        Then the hero image should be displayed full width with the following
            | attribute    | value                                                                                |
            | alt          | AP FY 2022 Hero                                                                      |
            | desktopImage | \/sites\/default\/files\/cgov_hero\/banner/\d{4}-\d{2}\/apfy22-hero-placeholder\.jpg |
            | width        | 2880                                                                                 |
            | height       | 1080                                                                                 |
        And the hero image title text is "NCI Annual Plan & Budget Proposal For Fiscal Year 2022"
        And the main content area should appear


    Scenario: User views the AP landing page in Spanish
        Given user is navigating to "/espanol/special-report"
        And screen breakpoint is set to "desktop"
        Then the hero image should be displayed full width with the following
            | attribute | value                                                                                |
            | alt       | AP FY 2022 Hero                                                                      |
            | image     | \/sites\/default\/files\/cgov_hero\/banner/\d{4}-\d{2}\/apfy22-hero-placeholder\.jpg |
            | width     | 2880                                                                                 |
            | height    | 1080                                                                                 |
        And the hero image title text is "Spanish: NCI Annual Plan & Budget Proposal For Fiscal Year 2022"
        And the main content area should appear
        And left navigation menu is not displayed