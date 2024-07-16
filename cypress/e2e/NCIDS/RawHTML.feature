Feature: As a user I want to be able to add NCIDS Raw HTML block to my content

    Scenario: Home/Landing Raw Html link click event
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
            | evar61    | cgvHomeLanding\|ncids_without_title                 |
            | evar64    | Not Defined\|Information Sessions\|NCI SBIR Webinar |
            | evar65    | Raw HTML\|Not Defined\|Not Defined                  |
            | evar66    | 5\|4\|0\|0\|1\|1                                    |
            | evar67    | Raw HTML\|2\|1                                      |
            | evar68    | Body                                                |
            | pageName  | {CANONICAL_HOST}/ncids-raw-html-test                |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ncids-raw-html-test   |
            | event27   |                                                     |
            | channel   | NCI Homepage                                        |
            | pev2      | LP:RawHTML:LinkClick                                |
            | linkType  | lnk_o                                               |

    Scenario: Mini Landing Raw Html link click event
        Given user is navigating to "/test/raw-html-sample-page"
        When user clicks on link "https://www.google.com/" in raw html block
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
            | evar61    | cgvMiniLanding\|ncids_default                       |
            | evar64    | Internal\|I am a header in a prose block\|Go to some website for more information |
            | evar65    | Raw HTML\|Not Defined\|Not Defined                  |
            | evar66    | 2\|2\|0\|0\|1\|1                                    |
            | evar67    | Prose Block\|1\|1                                   |
            | evar68    | Body                                                |
            | pageName  | {CANONICAL_HOST}/test/raw-html-sample-page          |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/raw-html-sample-page   |
            | event112  |                                                     |
            | channel   | NCI Homepage                                        |
            | pev2      | MLP:RawHTML:LinkClick                               |
            | linkType  | lnk_o                                               |
