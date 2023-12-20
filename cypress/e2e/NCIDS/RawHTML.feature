Feature: As a user I want to be able to add NCIDS Raw HTML block to my content

    Scenario: Raw Html link click event
        Given user is navigating to "/ncids-raw-html-test"
        When user clicks on link "https://sbir.cancer.gov/events/february-2023-nci-sbir-informational-webinar" in raw html block
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                               |
            | prop4     | D=pev1                                              |
            | prop8     | english                                             |
            | prop57    | D=v64                                               |
            | prop58    | D=v65                                               |
            | prop59    | D=v66                                               |
            | prop60    | D=c67                                               |
            | prop67    | D=pageName                                          |
            | prop68    | D=v68                                               |
            | evar2     | D=c8                                                |
            | evar64    | Not Defined\|Information Sessions\|NCI SBIR Webinar |
            | evar65    | Raw HTML\|Not Defined\|Not Defined                  |
            | evar66    | 5\|4\|0\|0\|1\|1                                          |
            | evar67    | Raw HTML\|2\|1                                   |
            | evar68    | Body                                                |
            | pageName  | {CANONICAL_HOST}/ncids-raw-html-test                |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-raw-html-test   |
            | event27   |                                                     |
            | channel   | NCI Homepage                                        |
            | pev2      | LP:RawHTML:LinkClick                                |
            | linkType  | lnk_o                                               |

