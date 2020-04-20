Feature: Analytics events raised by hovering over mega menu in desktop, clicking in mobile and tablet modes


    Scenario Outline: Hover over mega menu home page
        Given user is navigating to "/"
        When screen breakpoint is set to "desktop"
        When user is hovering over mega menu with href "<href>"
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                   |
            | pev2     | MegaMenuDesktopReveal     |
            | evar43   | Mega Menu                 |
            | linkType | lnk_o                     |
            | prop67   | D=pageName                |
            | prop4    | D=pev1                    |
            | evar2    | english                   |
            | prop8    | english                   |
            | pageName | {CANONICAL_HOST}/         |
            | pageURL  | https://{CANONICAL_HOST}/ |
            | channel  | NCI Homepage              |

        Examples:
            | href             |
            | /about-cancer    |
            | /types           |
            | /research        |
            | /grants-training |
            | /news-events     |
            | /about-nci       |

    Scenario Outline: Hover over mega menu Spanish home page
        Given user is navigating to "/espanol"
        When screen breakpoint is set to "desktop"
        When user is hovering over mega menu with href "<href>"
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                          |
            | pev2     | MegaMenuDesktopReveal            |
            | evar43   | Mega Menu                        |
            | linkType | lnk_o                            |
            | prop67   | D=pageName                       |
            | prop4    | D=pev1                           |
            | evar2    | spanish                          |
            | prop8    | spanish                          |
            | pageName | {CANONICAL_HOST}/espanol         |
            | pageURL  | https://{CANONICAL_HOST}/espanol |
            | channel  | NCI Home - Spanish               |


        Examples:
            | href                   |
            | /espanol/cancer        |
            | /espanol/tipos         |
            | /espanol/investigacion |
            | /espanol/noticias      |
            | /espanol/instituto     |


    Scenario: Mobile mega menu reveal on Home Page
        Given user is navigating to "/"
        When screen breakpoint is set to "mobile"
        When user is clicking on mega menu button
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                   |
            | pev2     | MegaMenuMobileReveal      |
            | evar43   | Hamburger Menu            |
            | linkType | lnk_o                     |
            | prop67   | D=pageName                |
            | prop4    | D=pev1                    |
            | evar2    | english                   |
            | prop8    | english                   |
            | pageName | {CANONICAL_HOST}/         |
            | pageURL  | https://{CANONICAL_HOST}/ |
            | channel  | NCI Homepage              |


    Scenario: Mobile mega menu reveal on Spanish home page
        Given user is navigating to "/espanol"
        When screen breakpoint is set to "mobile"
        When user is clicking on mega menu button
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                          |
            | pev2     | MegaMenuMobileReveal             |
            | evar43   | Hamburger Menu                   |
            | linkType | lnk_o                            |
            | prop67   | D=pageName                       |
            | prop4    | D=pev1                           |
            | evar2    | spanish                          |
            | prop8    | spanish                          |
            | pageName | {CANONICAL_HOST}/espanol         |
            | pageURL  | https://{CANONICAL_HOST}/espanol |
            | channel  | NCI Home - Spanish               |



    Scenario: Tablet mega menu reveal is behaving as mobile breakpoint on home page
        Given user is navigating to "/"
        When screen breakpoint is set to "tablet"
        When user is clicking on mega menu button
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                   |
            | pev2     | MegaMenuMobileReveal      |
            | evar43   | Hamburger Menu            |
            | linkType | lnk_o                     |
            | prop67   | D=pageName                |
            | prop4    | D=pev1                    |
            | evar2    | english                   |
            | prop8    | english                   |
            | pageName | {CANONICAL_HOST}/         |
            | pageURL  | https://{CANONICAL_HOST}/ |
            | channel  | NCI Homepage              |




    Scenario: Tablet mega menu reveal is behaving as mobile breakpoint on Spanish home page
        Given user is navigating to "/espanol"
        When screen breakpoint is set to "tablet"
        When user is clicking on mega menu button
        And page click request is sent
        Then the following parameters should be captured
            | events   | event28                          |
            | pev2     | MegaMenuMobileReveal             |
            | evar43   | Hamburger Menu                   |
            | linkType | lnk_o                            |
            | prop67   | D=pageName                       |
            | prop4    | D=pev1                           |
            | evar2    | spanish                          |
            | prop8    | spanish                          |
            | pageName | {CANONICAL_HOST}/espanol         |
            | pageURL  | https://{CANONICAL_HOST}/espanol |
            | channel  | NCI Home - Spanish               |
