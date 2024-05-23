Feature: As a content editor, I would like to be able to embed a raw HTML block, so that I can promote the underlying content effectively.

    Scenario Outline: User views a Special Report landing page with a raw HTML block containing text and image on tablet and desktop
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then a content block should appear
        And the title of a content block will have a href "<href>"
        And the body of a content block will have a link with href "<href>"
        And the image of a content block is displayed with the source "<imageSource>" and alt text "<imageAlt>"
        And the image will have a link and text wrapped around

        Examples:
            | url                    | screenBreakpoint | href                    | imageSource                                                                                              | imageAlt          |
            | /special-report        | desktop          | https://www.cancer.gov/ | /profiles/custom/cgov_site/themes/custom/cgov/static/images/general/special-report-driving-discovery.png | Driving Discovery |
            | /special-report        | tablet           | https://www.cancer.gov/ | /profiles/custom/cgov_site/themes/custom/cgov/static/images/general/special-report-driving-discovery.png | Driving Discovery |
            | espanol/special-report | desktop          | https://www.cancer.gov/ | /profiles/custom/cgov_site/themes/custom/cgov/static/images/general/special-report-driving-discovery.png | Driving Discovery |

    Scenario Outline: User views a Special Report landing page with a raw HTML block containing text and image on mobile
        Given user is navigating to "/special-report"
        And screen breakpoint is set to "mobile"
        Then a content block should appear
        And the title of a content block will have a href "<href>"
        And the body of a content block will have a link with href "<href>"
        And the image will appear below the title
        And the image of a content block is displayed with the source "<imageSource>" and alt text "<imageAlt>"


        Examples:
            | href                    | imageSource                                                                                              | imageAlt          |
            | https://www.cancer.gov/ | /profiles/custom/cgov_site/themes/custom/cgov/static/images/general/special-report-driving-discovery.png | Driving Discovery |


    #################### Raw HTML Block Analytics#####################

    Scenario Outline: Click events for RawHTML Block on desktop when click on title
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/special-report"
        When user clicks on a "<blockComponent>" of a rawHTML block
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event27   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop59    | rawHTML:1                               |
            | prop60    | D=pageName                              |
            | prop67    | D=pageName                              |
            | evar2     | D=c8                                 |
            | channel   | NCI Homepage                            |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/special-report |
            | prop58    | /\n*\t*\Driving Discovery\n*\t*/        |
            | prop57    | /\n*\t*\Driving Discovery\n*\t*/        |

        Examples:
            | blockComponent |
            | title          |


    Scenario Outline: Click events for RawHTML Block on mobile when click on image
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/special-report"
        When user clicks on a "<blockComponent>" of a rawHTML block
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                   |
            | event27   |                                         |
            | prop4     | D=pev1                                  |
            | prop8     | english                                 |
            | prop59    | rawHTML:1                               |
            | prop60    | D=pageName                              |
            | prop67    | D=pageName                              |
            | evar2     | D=c8                                 |
            | channel   | NCI Homepage                            |
            | pageName  | {CANONICAL_HOST}/special-report         |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/special-report |
            | prop58    | /\n*\t*\Driving Discovery\n*\t*/        |
            | prop57    | /\n*\t*\Driving Discovery\n*\t*/        |

        Examples:
            | blockComponent |
            | image          |