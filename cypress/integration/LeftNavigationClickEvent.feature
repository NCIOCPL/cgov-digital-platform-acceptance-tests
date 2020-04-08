Feature: Left Navigation click events

    Scenario: Click Events for left navigation 'Feelings and Cancer' submenu
        Given user is navigating to "/about-cancer/coping"
        When user is clicking on a menu section with href "/about-cancer/coping/feelings"
        Then the following parameters should be captured
            | evar43   | Section Menu        |
            | evar45   | Coping with Cancer  |
            | prop66   | feelings and cancer |
            | prop69   | Coping with Cancer  |
            | prop70   | Feelings and Cancer |
            | link     | SectionLinkClick    |
            | region   | nvcgSlSectionNav    |
            | prop72   | D=pageName          |
            | events   | event33             |
            | pev2     | SectionLinkClick    |
            | linkType | lnk_o               |
            | prop67   | D=pageName          |
            | prop4    | D=pev1              |
            | evar2    | english             |
            | prop8    | english             |
            | channel  | About Cancer        |
        And pageName and pageURL parameters contain current url

    Scenario: Click Events for left navigation 'Learning to relax' submenu
        Given user is navigating to "/about-cancer/coping/feelings"
        When user is clicking on a menu section with href "/about-cancer/coping/feelings/relaxation"
        Then the following parameters should be captured
            | evar43   | Section Menu       |
            | evar45   | Coping with Cancer |
            | prop66   | learning to relax  |
            | prop69   | Coping with Cancer |
            | prop70   | Learning to Relax  |
            | link     | SectionLinkClick   |
            | region   | nvcgSlSectionNav   |
            | events   | event33            |
            | pev2     | SectionLinkClick   |
            | linkType | lnk_o              |
            | prop67   | D=pageName         |
            | prop4    | D=pev1             |
            | evar2    | english            |
            | prop8    | english            |
            | channel  | About Cancer       |
        And pageName and pageURL parameters contain current url


