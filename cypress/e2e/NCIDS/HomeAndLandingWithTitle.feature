Feature: As a user I want to select NCIDS with Title from Home and Landing Page Style options

    Scenario Outline: Home and Landing with title page components
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-landing-with-title"
        Then NCIDS page title is "NCIDS Landing With Title"
        And NCIDS subheading is "Subheading Test"
        And NCIDS feature card row heading at position 1 is "Feature Card Row"
        And NCIDS feature cards have the following attributes
            | index | title               | description               | link                   | altText              | source                                                                                                                        |
            | 0     | External Card Title | External Card Description | https://www.google.com | Lead Placeholder     | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/lead-placeholder-16x9.png)$     |
            | 1     | External Card Title | External Card Description | https://www.google.com | Promo Placeholder    | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/promo-placeholder-16x9.png)$    |
            | 2     | External Card Title | External Card Description | https://www.google.com | Override Placeholder | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/override-placeholder-16x9.png)$ |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |


    Scenario: Home and landing with additional library
        Given user is navigating to "/test/landing-page-library-test"
        Then NCIDS page title is "Landing Page Library Test"
        And console log outputs "Hello World"
        And tagline displays in color "rgb(0, 0, 255)"

    Scenario: Spanish Home and landing with additional library
        Given user is navigating to "/espanol/test-es/landing-page-library-test"
        Then NCIDS page title is "Spanish Landing Page Library Test"
        And console log outputs "Hello World"
        And tagline displays in color "rgb(0, 0, 255)"


    Scenario: Types landin page summary box link click event
        Given user is navigating to "/types"
        When user clicks on summary box link "/types/breast"
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                        |
            | prop4     | D=pev1                                       |
            | prop8     | english                                      |
            | prop57    | D=v64                                        |
            | prop58    | D=v65                                        |
            | prop59    | D=v66                                        |
            | prop60    | D=c67                                        |
            | prop67    | D=pageName                                   |
            | prop68    | D=v68                                        |
            | evar2     | D=c8                                         |
            | evar64    | Internal\|Common Cancer Types\|Breast Cancer |
            | evar65    | Raw HTML\|Not Defined\|SummaryBox            |
            | evar66    | 3\|2\|2\|1\|1\|1                             |
            | evar67    | Text\|10\|2                                  |
            | evar68    | Body                                         |
            | pageName  | {CANONICAL_HOST}/types                       |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types          |
            | event27   |                                              |
            | channel   | Cancer Types                                 |
            | pev2      | LP:RawHTML:LinkClick                         |
            | linkType  | lnk_o                                        |


    Scenario: Types landin page accordion expand click event
        Given user is navigating to "/types"
        When user expands letter "B"
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                 |
            | prop4     | D=pev1                                |
            | prop8     | english                               |
            | prop57    | D=v64                                 |
            | prop58    | D=v65                                 |
            | prop59    | D=v66                                 |
            | prop60    | D=c67                                 |
            | prop67    | D=pageName                            |
            | prop68    | D=v68                                 |
            | evar2     | D=c8                                  |
            | evar64    | Anchor\|Cancer Types A-Z Accordion\|B |
            | evar65    | Raw HTML\|Not Defined\|Accordion      |
            | evar66    | 3\|3\|0\|0\|22\|2                     |
            | evar67    | B\|undefined\|undefined               |
            | evar68    | Body                                  |
            | pageName  | {CANONICAL_HOST}/types                |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types   |
            | event36   |                                       |
            | channel   | Cancer Types                          |
            | pev2      | LP:RawHTMLAccordion:ExpandCollapse    |
            | linkType  | lnk_o                                 |


    Scenario: Types landin page accordion link click event
        Given user is navigating to "/types"
        When user clicks on cancer type link "/types/adrenocortical"
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar64    | Internal\|Cancer Types A-Z Accordion\|Adrenocortical Carcinoma |
            | evar65    | Raw HTML\|Not Defined\|Accordion                               |
            | evar66    | 3\|3\|0\|0\|22\|1                                              |
            | evar67    | A\|11\|4                                                       |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/types                                         |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types                            |
            | event36   |                                                                |
            | channel   | Cancer Types                                                   |
            | pev2      | LP:RawHTMLAccordion:LinkClick                                  |
            | linkType  | lnk_o                                                          |


    Scenario: Types landin page user starts to interact with combobox
        Given user is navigating to "/types"
        When user clicks on combo box input field
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                        |
            | prop4     | D=pev1                                       |
            | prop8     | english                                      |
            | prop57    | D=v64                                        |
            | prop58    | D=v65                                        |
            | prop59    | D=v66                                        |
            | prop60    | D=c67                                        |
            | prop67    | D=pageName                                   |
            | prop68    | D=v68                                        |
            | evar2     | D=c8                                         |
            | evar64    | Interaction\|Cancer Types Search\|Form Focus |
            | evar65    | Raw HTML\|Not Defined\|Cancer Type Search    |
            | evar66    | 3\|1\|0\|0\|1\|1                             |
            | evar67    | Dropdown\|undefined\|undefined               |
            | evar68    | Body                                         |
            | pageName  | {CANONICAL_HOST}/types                       |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types          |
            | event38   |                                              |
            | channel   | Cancer Types                                 |
            | pev2      | LP:RawHTMLCancerTypeSearch:FormFocus         |
            | linkType  | lnk_o                                        |

    Scenario: Types landin page user selects item from combobox
        Given user is navigating to "/types"
        When user clicks on combo box input field
        And analytics storage is cleared
        And user selects 1 item in dropdown
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                           |
            | prop4     | D=pev1                                          |
            | prop8     | english                                         |
            | prop57    | D=v64                                           |
            | prop58    | D=v65                                           |
            | prop59    | D=v66                                           |
            | prop60    | D=c67                                           |
            | prop67    | D=pageName                                      |
            | prop68    | D=v68                                           |
            | evar2     | D=c8                                            |
            | evar64    | Interaction\|Cancer Types Search\|Selected Item |
            | evar65    | Raw HTML\|Not Defined\|Cancer Type Search       |
            | evar66    | 3\|1\|0\|0\|1\|1                                |
            | evar67    | Dropdown\|127\|1                                |
            | evar68    | Body                                            |
            | evar80    | Cancer Types Search\|Selected Item\|1\|0\|0\|0  |
            | pageName  | {CANONICAL_HOST}/types                          |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types             |
            | event88   |                                                 |
            | channel   | Cancer Types                                    |
            | pev2      | LP:RawHTMLCancerTypeSearch:SelectItem           |
            | linkType  | lnk_o                                           |

    Scenario: Types landin page user clears combobox
        Given user is navigating to "/types"
        When user clicks on combo box input field
        And analytics storage is cleared
        And user selects 1 item in dropdown
        And analytics storage is cleared
        And user clears combobox
        And browser waits
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                        |
            | prop4     | D=pev1                                       |
            | prop8     | english                                      |
            | prop57    | D=v64                                        |
            | prop58    | D=v65                                        |
            | prop59    | D=v66                                        |
            | prop60    | D=c67                                        |
            | prop67    | D=pageName                                   |
            | prop68    | D=v68                                        |
            | evar2     | D=c8                                         |
            | evar64    | Interaction\|Cancer Types Search\|Clear Form |
            | evar65    | Raw HTML\|Not Defined\|Cancer Type Search    |
            | evar66    | 3\|1\|0\|0\|1\|1                             |
            | evar67    | Dropdown\|undefined\|undefined               |
            | evar68    | Body                                         |
            | pageName  | {CANONICAL_HOST}/types                       |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/types          |
            | event89   |                                              |
            | channel   | Cancer Types                                 |
            | pev2      | LP:RawHTMLCancerTypeSearch:ClearForm         |
            | linkType  | lnk_o                                        |