Feature: Footer tests

    Scenario Outline: Verify that Footer exists on the pages and it's components are correct
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then footer section is visible
        And there is only one footer on a page
        And footer is broken into 2 sections
        And footer header text is "<header>"
        And the footer text does not contain any broken links

        Examples:
            | breakpoint | url                                                                               | header                        |
            | desktop    | espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin           | Instituto Nacional del Cáncer |
            | desktop    | about-cancer/coping/feelings                                                      | National Cancer Institute     |
            | desktop    | annual-report-nation-2018                                                         | National Cancer Institute     |
            | tablet     | types/breast/patient/breast-treatment-pdq                                         | National Cancer Institute     |
            | tablet     | /news-events/press-releases/2018/oropharyngeal-hpv-cisplatin                      | National Cancer Institute     |
            | mobile     | espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres                   | Instituto Nacional del Cáncer |
            | mobile     | news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly | National Cancer Institute     |


    Scenario Outline: Live chat popup and site feedback survey English and sign up for updates
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then clicking on "Live Chat" link with href "https://livehelp.cancer.gov/" in the footer opens a chat pop-up
        And clicking on "Site Feedback" link in the footer opens a "qualtrics" survey
        And "Sign up for email updates" heading is present
        And the "email" input box is present
        And "Sign up" button is visible
        When user clicks on "Sign up" button
        Then the error message "Enter a valid email address" is displayed

        Examples:
            | breakpoint | url                                                          |
            | desktop    | about-cancer/coping/feelings                                 |
            | mobile     | types/breast/patient/breast-treatment-pdq                    |
            | tablet     | /news-events/press-releases/2018/oropharyngeal-hpv-cisplatin |



    Scenario Outline: Live chat popup,site feedback survey Spanish and sign up for updates
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then clicking on "Chat en vivo" link with href "https://livehelp-es.cancer.gov/" in the footer opens a chat pop-up
        And clicking on "Comentarios y sugerencias" link in the footer opens a "qualtrics" survey
        And "Reciba actualizaciones por correo electrónico" heading is present
        And the "email" input box is present
        And "Suscríbase" button is visible
        When user clicks on "Suscríbase" button
        Then the error message "Ingrese su dirección de correo electrónico" is displayed

        Examples:
            | breakpoint | url                                                                     |
            | desktop    | espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin |
            | mobile     | espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres         |
            | tablet     | /espanol/cancer/sobrellevar/sentimientos                                |



    Scenario: User is on mobile breakpoint and main area links collapse to headings
        Given user is navigating to "/about-cancer/treatment/side-effects"
        And screen breakpoint is set to "mobile"
        Then there are 3 accordion sections in the footer
        And the following links have become section's headers
            | header    |
            | About     |
            | Resources |
            | Policies  |
        And sections are collapsed
        When user clicks on "About" link header
        Then following are the states of sections accordions
            | header    | expanded |
            | About     | true     |
            | Resources | false    |
            | Policies  | false    |
        When user clicks on "About" link header
        Then following are the states of sections accordions
            | header    | expanded |
            | About     | false    |
            | Resources | false    |
            | Policies  | false    |

    Scenario: Footer link click
        When user is navigating to "/"
        And screen breakpoint is set to "desktop"
        Then footer section is visible
        When user clicks on "Contact Us" footer link
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                     |
            | prop4     | D=pev1                    |
            | prop67    | D=pageName                |
            | prop36    | D=v36                     |
            | prop68    | D=v68                     |
            | prop8     | english                   |
            | evar2     | D=c8                      |
            | evar36    | Resources\|Contact Us     |
            | evar68    | Footer                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ |
            | pageName  | {CANONICAL_HOST}/         |
            | event16   |                           |
            | channel   | NCI Homepage              |
            | pev2      | Footer:LinkClick          |
            | linkType  | lnk_o                     |
            | link      | Contact Us                |


    Scenario: Email sign up form error event
        When user is navigating to "/"
        And screen breakpoint is set to "desktop"
        Then footer section is visible
        When user clicks on "Sign up" button
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                     |
            | prop4     | D=pev1                    |
            | prop67    | D=pageName                |
            | prop74    | D=v74                     |
            | prop68    | D=v68                     |
            | prop8     | english                   |
            | evar2     | D=c8                      |
            | evar74    | EmailSignUp\|Error        |
            | evar68    | Footer                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ |
            | pageName  | {CANONICAL_HOST}/         |
            | event41   |                           |
            | channel   | NCI Homepage              |
            | pev2      | Footer:EmailForm:Error    |
            | linkType  | lnk_o                     |
            | link      | Sign up                   |

    Scenario: Email sign up form submit event
        When user is navigating to "/"
        And screen breakpoint is set to "desktop"
        Then footer section is visible
        When user enters "test@gmail.com" into email field
        And user clicks on "Sign up" button
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                     |
            | prop4     | D=pev1                    |
            | prop67    | D=pageName                |
            | prop74    | D=v74                     |
            | prop68    | D=v68                     |
            | prop8     | english                   |
            | evar2     | D=c8                      |
            | evar74    | D=v36                     |
            | evar36    | EmailSignUp\|Complete     |
            | evar68    | Footer                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ |
            | pageName  | {CANONICAL_HOST}/         |
            | event39   |                           |
            | channel   | NCI Homepage              |
            | pev2      | Footer:EmailForm:Complete |
            | linkType  | lnk_o                     |
            | link      | Sign up                   |
    #TODO - update when this gets resolved https://github.com/NCIOCPL/cgov-digital-platform/issues/3528
    # Scenario: Email sign up form start event
    #     When user is navigating to "/"
    #     And screen breakpoint is set to "desktop"
    #     Then footer section is visible
    #     When user clicks on email field
    #     And browser waits
    #     Then page click request is sent
    #     And the following parameters should be captured
    #         | parameter | value                         |
    #         | prop4     | D=pev1                        |
    #         | prop67    | D=pageName                    |
    #         | prop74    | Footer\|EmailSignUp\|Complete |
    #         | prop68    | Footer                        |
    #         | prop8     | english                       |
    #         | evar2     | D=c8                          |
    #         | evar74    | D=c74                         |
    #         | evar68    | D=c68                         |
    #         | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/     |
    #         | pageName  | {CANONICAL_HOST}/             |
    #         | event39   |                               |
    #         | channel   | NCI Homepage                  |
    #         | pev2      | Footer:EmailForm:Start        |
    #         | linkType  | lnk_o                         |
    #         | link      | Sign up                       |

    Scenario: Footer links accordion expand click event
        When user is navigating to "/"
        And screen breakpoint is set to "mobile"
        Then footer section is visible
        When user clicks on "About" link header
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                     |
            | prop4     | D=pev1                    |
            | prop67    | D=pageName                |
            | prop36    | D=v36                     |
            | prop68    | D=v68                     |
            | prop8     | english                   |
            | evar2     | D=c8                      |
            | evar36    | Footer\|About\|Expand     |
            | evar68    | Footer                    |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ |
            | pageName  | {CANONICAL_HOST}/         |
            | event17   |                           |
            | channel   | NCI Homepage              |
            | pev2      | Footer:SectionExpand      |
            | linkType  | lnk_o                     |
            | link      | About                     |
