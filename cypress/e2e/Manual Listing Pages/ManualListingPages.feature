Feature: All manual pages

    Scenario Outline: All manual trial listing page components are displayed(with pagers)
        Given screen breakpoint is set to "<screen breakpoint>"
        When user is navigating to "<path>"
        Then page title is "<page title>"
        And the page displays pager info "Trials 1-N of N"
        And the 1 pager is displayed with the following "<pager items>"
        And the page "1" is highlighted
        And each result displays the trial title with a link in the following format "/clinicaltrials/NCI-"
        And each result displays the trial summary
        And each result displays "Location: " below the summary
        And the 2 pager is displayed with the following "<pager items>"
        And delighter is displayed with link "/about-cancer/treatment/clinical-trials/search"

        Examples:
            | screen breakpoint | path                                                                  | page title                                                             | pager items        |
            | desktop           | /about-cancer/treatment/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          | 1,2,Next >         |
            | mobile            | /about-cancer/treatment/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          | 1,2,Next >         |
            | tablet            | /about-cancer/treatment/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | 1,2,3,Next >       |
            | mobile            | /about-cancer/treatment/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | 1,2,3,Next >       |
            | desktop           | /about-cancer/treatment/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | 1,2,3,4,Next >     |
            | tablet            | /about-cancer/treatment/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | 1,2,3,4,Next >     |
            | desktop           | /about-cancer/treatment/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | 1,2,3,...,7,Next > |
            | mobile            | /about-cancer/treatment/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | 1,2,3,...,7,Next > |


    Scenario Outline: Manual trial listing page with intro text
        Given screen breakpoint is set to "<screen breakpoint>"
        When user is navigating to "/about-cancer/treatment/clinical-trials/covid-19"
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
            | path                                                                  | page title                                                             | title tag                                                                    | og:title                                                               | og:url                                                                                        | og:description                                                                                                                                                                                                | description                                                                                                                                                                                                   | canonical link                                                                                |
            | /about-cancer/treatment/clinical-trials/covid-19                      | NCI-Supported Clinical Trials for Coronavirus                          | NCI-Supported Clinical Trials for Coronavirus - NCI                          | NCI-Supported Clinical Trials for Coronavirus                          | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/covid-19                      | List of ongoing clinical trials for coronavirus disease 2019 (COVID-19) supported by the National Cancer Institute. Some trials may be specifically for people with cancer who also have coronavirus disease. | List of ongoing clinical trials for coronavirus disease 2019 (COVID-19) supported by the National Cancer Institute. Some trials may be specifically for people with cancer who also have coronavirus disease. | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/covid-19                      |
            | /about-cancer/treatment/clinical-trials/cam-procedures                | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | Clinical Trials for Complementary or Alternative Medicine Procedure(s) - NCI | Clinical Trials for Complementary or Alternative Medicine Procedure(s) | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures                | Find clinical trials for complementary or alternative medicine procedures.                                                                                                                                    | Find clinical trials for complementary or alternative medicine procedures.                                                                                                                                    | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures                |
            | /about-cancer/treatment/clinical-trials/adult-metastatic-brain-tumors | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | Clinical Trials to Treat Adult Metastatic Brain Tumors - NCI                 | Clinical Trials to Treat Adult Metastatic Brain Tumors                 | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/adult-metastatic-brain-tumors | Find clinical trials to treat adult metastatic brain tumors.                                                                                                                                                  | Find clinical trials to treat adult metastatic brain tumors.                                                                                                                                                  | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/adult-metastatic-brain-tumors |
            | /about-cancer/treatment/clinical-trials/kidney-cancer                 | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | Clinical Trials to Treat Kidney (Renal Cell) Cancer - NCI                    | Clinical Trials to Treat Kidney (Renal Cell) Cancer                    | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/kidney-cancer                 | Find clinical trials to treat kidney cancer.                                                                                                                                                                  | Find clinical trials to treat kidney cancer.                                                                                                                                                                  | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/kidney-cancer                 |


    Scenario Outline: Redirect to noTrialsFound
        When user is navigating to "<path>"
        And screen breakpoint is set to "desktop"
        Then user is directed to "<directedUrl>"
        Then page title is "<page title>"
        Then the text "<noTrialsText>" appears
        And delighter is displayed with link "/about-cancer/treatment/clinical-trials/search"

        Examples:
            | path                                                | directedUrl                                         | page title                           | noTrialsText                             |
            | /about-cancer/treatment/clinical-trials/chicken-pox | /about-cancer/treatment/clinical-trials/chicken-pox | Clinical Trials to Treat Chicken Pox | There are currently no available trials. |


    Scenario: Analytics
        When user is navigating to "/about-cancer/treatment/clinical-trials/cam-procedures" with added wait
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                          |
            | prop6     | Clinical Trials for Complementary or Alternative Medicine Procedure(s)         |
            | prop10    | Clinical Trials for Complementary or Alternative Medicine Procedure(s) - NCI   |
            | prop44    | Clinical Trials                                                                |
            | prop3     | /about-cancer/treatment/clinical-trials/cam-procedures/                        |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                           |
            | prop29    |                                                                                |
            | prop62    | Clinical Trials: Custom                                                        |
            | prop20    | /^manual parameters\|\d{1,2}/                                                  |
            | prop11    | clinicaltrials_custom                                                          |
            | prop8     | english                                                                        |
            | evar44    | D=c44                                                                          |
            | evar11    | D=c11                                                                          |
            | evar20    | D=c20                                                                          |
            | evar47    | clinicaltrials_custom                                                          |
            | evar62    | D=c62                                                                          |
            | pageName  | {CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures         |
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures |
            | event2    |                                                                                |
            | event1    |                                                                                |
            | channel   | About Cancer                                                                   |

    Scenario: Analytics click event
        When user is navigating to "/about-cancer/treatment/clinical-trials/cam-procedures"
        Then page title is "Clinical Trials for Complementary or Alternative Medicine Procedure(s)"
        When user clicks on 1 result
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                          |
            | prop4     | D=pev1                                                                         |
            | prop67    | D=pageName                                                                     |
            | prop13    | 1\|page 1                                                                      |
            | prop12    | clinicaltrials_custom                                                          |
            | prop8     | english                                                                        |
            | evar2     | D=c8                                                                           |
            | evar12    | D=c12                                                                          |
            | pageName  | {CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures         |
            | pageURL   | https://{CANONICAL_HOST}/about-cancer/treatment/clinical-trials/cam-procedures |
            | event42   |                                                                                |
            | channel   | About Cancer                                                                   |
            | pev2      | CTSLink                                                                        |
            | linkType  | lnk_o                                                                          |

