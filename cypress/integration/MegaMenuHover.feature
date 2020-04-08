Feature: Analytics events raised by hovering over mega menu in desktop, clicking in mobile and tablet modes


    Scenario Outline: Hover over mega menu home page
        Given user is navigating to "/"
        When user is hovering over mega menu with href "<href>"
        Then the following parameters should be captured
            | events   | event28               |
            | pev2     | MegaMenuDesktopReveal |
            | evar43   | Mega Menu             |
            | linkType | lnk_o                 |
            | prop67   | D=pageName            |
            | prop4    | D=pev1                |
            | evar2    | english               |
            | prop8    | english               |
            | channel  | NCI Homepage          |
        And pageName and pageURL parameters contain current url

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
        When user is hovering over mega menu with href "<href>"
        Then the following parameters should be captured
            | events   | event28               |
            | pev2     | MegaMenuDesktopReveal |
            | evar43   | Mega Menu             |
            | linkType | lnk_o                 |
            | prop67   | D=pageName            |
            | prop4    | D=pev1                |
            | evar2    | spanish               |
            | prop8    | spanish               |
            | channel  | NCI Home - Spanish    |
        And pageName and pageURL parameters contain current url

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
        Then the following parameters should be captured
            | events   | event28              |
            | pev2     | MegaMenuMobileReveal |
            | evar43   | Hamburger Menu       |
            | linkType | lnk_o                |
            | prop67   | D=pageName           |
            | prop4    | D=pev1               |
            | evar2    | english              |
            | prop8    | english              |
            | channel  | NCI Homepage         |
        And pageName and pageURL parameters contain current url


    Scenario: Mobile mega menu reveal on Spanish home page
        Given user is navigating to "/espanol"
        When screen breakpoint is set to "mobile"
        When user is clicking on mega menu button
        Then the following parameters should be captured
            | events   | event28              |
            | pev2     | MegaMenuMobileReveal |
            | evar43   | Hamburger Menu       |
            | linkType | lnk_o                |
            | prop67   | D=pageName           |
            | prop4    | D=pev1               |
            | evar2    | spanish              |
            | prop8    | spanish              |
            | channel  | NCI Home - Spanish   |
        And pageName and pageURL parameters contain current url


    Scenario: Tablet mega menu reveal is behaving as mobile breakpoint on home page
        Given user is navigating to "/"
        When screen breakpoint is set to "tablet"
        When user is clicking on mega menu button
        Then the following parameters should be captured
            | events   | event28              |
            | pev2     | MegaMenuMobileReveal |
            | evar43   | Hamburger Menu       |
            | linkType | lnk_o                |
            | prop67   | D=pageName           |
            | prop4    | D=pev1               |
            | evar2    | english              |
            | prop8    | english              |
            | channel  | NCI Homepage         |
        And pageName and pageURL parameters contain current url


    Scenario: Tablet mega menu reveal is behaving as mobile breakpoint on Spanish home page
        Given user is navigating to "/espanol"
        When screen breakpoint is set to "tablet"
        When user is clicking on mega menu button
        Then the following parameters should be captured
            | events   | event28              |
            | pev2     | MegaMenuMobileReveal |
            | evar43   | Hamburger Menu       |
            | linkType | lnk_o                |
            | prop67   | D=pageName           |
            | prop4    | D=pev1               |
            | evar2    | spanish              |
            | prop8    | spanish              |
            | channel  | NCI Home - Spanish   |
        And pageName and pageURL parameters contain current url
