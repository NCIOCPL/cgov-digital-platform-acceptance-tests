Feature: All manual pages

    Scenario Outline: All manual trial listing page components are displayed(with pagers)
        Given screen breakpoint is set to "<screen breakpoint>"
        When user is navigating to "<path>"
        Then page title is "<page title>"
        And the page displays pager info "Trials 1-N of N"
        And each result displays the trial title with a link in the following format "/clinicaltrials/NCI-"
        And each result displays the trial summary
        And each result displays "Location: " below the summary

        Examples:
            | screen breakpoint | path                                                                | page title                                                             |
            | desktop           | /research/participate/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          |
            | mobile            | /research/participate/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          |
            | tablet            | /research/participate/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) |
            | mobile            | /research/participate/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) |
            | desktop           | /research/participate/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 |
            | tablet            | /research/participate/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 |
            | desktop           | /research/participate/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    |
            | mobile            | /research/participate/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    |


    Scenario Outline: Manual trial listing page with intro text
        Given screen breakpoint is set to "<screen breakpoint>"
        When user is navigating to "/research/participate/clinical-trials/covid-19"
        Then page title is "NCI-Supported Clinical Trials for Coronavirus"
        And intro text 1 paragraph is "Clinical trials are research studies that involve people. Through clinical trials, doctors find new ways to improve treatments and the quality of life for people with disease."
        And intro text 2 paragraph is "NCI supports clinical trials to test promising treatments for patients with coronavirus disease 2019 (COVID-19) and to learn more about the disease's effects on the body. Some of the trials are specifically for patients with cancer. Your doctor can help you decide if a trial is right for you."
        And "Clinical trials" link has href "/publications/dictionaries/cancer-terms/def/clinical-trial"
        And "quality of life" link has href "/publications/dictionaries/cancer-terms/def/quality-of-life"

        Examples:
            | screen breakpoint |
            | desktop           |
            | mobile            |


    Scenario Outline: Meta Tags
        When user is navigating to "<path>"
        Then page title is "<page title>"
        Then the title tag should be "<title tag>"
        And the page contains meta tags with the following properties
            | property       | content          |
            | og:title       | <og:title>       |
            | og:url         | <og:url>         |
            | og:description | <og:description> |
        And the page contains meta tags with the following names
            | name        | content       |
            | description | <description> |
        And there is a canonical link with the href "<canonical link>"

        Examples:
            | path                                                                | page title                                                             | title tag                                                                    | og:title                                                               | og:url                                                                                           | og:description                                                                                                                                                                                                | description                                                                                                                                                                                                   | canonical link                                                                                   |
            | /research/participate/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          | NCI-Supported Clinical Trials for Coronavirus - NCI                          | NCI-Supported Clinical Trials for Coronavirus                          | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/covid-19                      | List of ongoing clinical trials for coronavirus disease 2019 (COVID-19) supported by the National Cancer Institute. Some trials may be specifically for people with cancer who also have coronavirus disease. | List of ongoing clinical trials for coronavirus disease 2019 (COVID-19) supported by the National Cancer Institute. Some trials may be specifically for people with cancer who also have coronavirus disease. | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/covid-19                      |
            | /research/participate/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | Clinical Trials for Complementary or Alternative Medicine Procedure(s) - NCI | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures                | Find clinical trials for complementary or alternative medicine procedures.                                                                                                                                    | Find clinical trials for complementary or alternative medicine procedures.                                                                                                                                    | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures                |
            | /research/participate/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | Clinical Trials to Treat Adult Metastatic Brain Tumors - NCI                 | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/adult-metastatic-brain-tumors | Find clinical trials to treat adult metastatic brain tumors.                                                                                                                                                  | Find clinical trials to treat adult metastatic brain tumors.                                                                                                                                                  | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/adult-metastatic-brain-tumors |
            | /research/participate/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | Clinical Trials to Treat Kidney (Renal Cell) Cancer - NCI                    | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/kidney-cancer                 | Find clinical trials to treat kidney cancer.                                                                                                                                                                  | Find clinical trials to treat kidney cancer.                                                                                                                                                                  | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/kidney-cancer                 |


    Scenario Outline: Redirect to noTrialsFound
        When user is navigating to "<path>"
        And screen breakpoint is set to "desktop"
        Then user is directed to "<directedUrl>"
        Then page title is "<page title>"
        Then the text "<noTrialsText>" appears

        Examples:
            | path                                              | directedUrl                                       | page title                           | noTrialsText                             |
            | /research/participate/clinical-trials/chicken-pox | /research/participate/clinical-trials/chicken-pox | Clinical Trials to Treat Chicken Pox | There are currently no available trials. |


    Scenario: Analytics
        When user is navigating to "/research/participate/clinical-trials/cam-procedures" with added wait
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                             |
            | prop6     | Clinical Trials for Complementary or Alternative Medicine Procedure(s)            |
            | prop10    | Clinical Trials for Complementary or Alternative Medicine Procedure(s) - NCI      |
            | prop44    | Research Landing Page                                                             |
            | prop3     | /research/participate/clinical-trials/cam-procedures/                             |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                              |
            | prop29    |                                                                                   |
            | prop62    | Clinical Trials: Custom                                                           |
            | prop20    | /^manual parameters\|\d{1,2}/                                                     |
            | prop11    | clinicaltrials_custom                                                             |
            | prop8     | english                                                                           |
            | evar44    | D=c44                                                                             |
            | evar11    | D=c11                                                                             |
            | evar20    | D=c20                                                                             |
            | evar47    | clinicaltrials_custom                                                             |
            | evar62    | D=c62                                                                             |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures |
            | event2    |                                                                                   |
            | event1    |                                                                                   |
            | channel   | Research                                                                          |
            | evar61    | nciAppModulePage                                                                  |

    Scenario: Analytics click event
        When user is navigating to "/research/participate/clinical-trials/cam-procedures"
        Then page title is "Clinical Trials for Complementary or Alternative Medicine Procedure(s)"
        When user clicks on 1 result
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                             |
            | prop4     | D=pev1                                                                            |
            | prop67    | D=pageName                                                                        |
            | prop13    | 1\|page 1                                                                         |
            | prop12    | clinicaltrials_custom                                                             |
            | prop8     | english                                                                           |
            | evar2     | D=c8                                                                              |
            | evar12    | D=c12                                                                             |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/cam-procedures |
            | event42   |                                                                                   |
            | channel   | Research                                                                          |
            | pev2      | CTSLink                                                                           |
            | linkType  | lnk_o                                                                             |

