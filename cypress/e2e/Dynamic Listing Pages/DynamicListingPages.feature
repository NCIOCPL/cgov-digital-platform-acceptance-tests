Feature: Dynamic Listing Pages

    Scenario Outline: All dynamic trial listing pages components are displayed(with pagers) on results view for all routes
        Given screen breakpoint is set to "<screen breakpoint>"
        When user is navigating to "<path>"
        Then page title is "<page title>"
        And intro text 1 paragraph is "<firstParagraph>"
        And intro text 2 paragraph is "NCI’s basic information about clinical trials explains the types and phases of trials and how they are carried out. Clinical trials look at new ways to prevent, detect, or treat disease. You may want to think about taking part in a clinical trial. Talk to your doctor for help in deciding if one is right for you."
        And "basic information about clinical trials" link has href "/research/participate/clinical-trials/what-are-clinical-trials"
        And the page displays pager info "Trials 1-N of N"
        And each result displays the trial title with a link in the following format "/clinicaltrials/NCI-"
        And each result displays the trial summary
        And each result displays "Location: " below the summary


        Examples:
            | Route                           | screen breakpoint | path                                                                       | page title                                                             | firstParagraph                                                                                                                                                                                                                                                                                     |
            | Disease                         | desktop           | /research/participate/clinical-trials/disease/c4872                        | Breast Cancer Clinical Trials                                          | Clinical trials are research studies that involve people. The clinical trials on this list are for breast cancer. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                                         |
            | Disease                         | mobile            | /research/participate/clinical-trials/disease/breast-cancer                | Breast Cancer Clinical Trials                                          | Clinical trials are research studies that involve people. The clinical trials on this list are for breast cancer. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                                         |
            | Disease Trial Type Intervention | desktop           | /research/participate/clinical-trials/disease/c4872,C118809/treatment/C274 | Treatment Clinical Trials for Breast Cancer Using Antineoplastic Agent | Clinical trials are research studies that involve people. The clinical trials on this list are testing treatment methods for breast cancer that use antineoplastic agent. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI. |
            | Disease Trial Type Intervention | tablet            | /research/participate/clinical-trials/disease/breast-cancer/treatment/C274 | Treatment Clinical Trials for Breast Cancer Using Antineoplastic Agent | Clinical trials are research studies that involve people. The clinical trials on this list are testing treatment methods for breast cancer that use antineoplastic agent. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI. |
            | Intervention                    | desktop           | /research/participate/clinical-trials/intervention/trastuzumab             | Clinical Trials Using Trastuzumab                                      | Clinical trials are research studies that involve people. The clinical trials on this list are studying trastuzumab. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                                      |
            | Intervention                    | mobile            | /research/participate/clinical-trials/intervention/C1647                   | Clinical Trials Using Trastuzumab                                      | Clinical trials are research studies that involve people. The clinical trials on this list are studying trastuzumab. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                                      |
            | Intervention Trial Type         | desktop           | /research/participate/clinical-trials/intervention/C1647/treatment         | Treatment Clinical Trials Using Trastuzumab                            | Clinical trials are research studies that involve people. The clinical trials on this list are testing treatment methods that use trastuzumab. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                            |
            | Intervention Trial Type         | tablet            | /research/participate/clinical-trials/intervention/trastuzumab/treatment   | Treatment Clinical Trials Using Trastuzumab                            | Clinical trials are research studies that involve people. The clinical trials on this list are testing treatment methods that use trastuzumab. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                            |
            | Disease Trial Type              | desktop           | /research/participate/clinical-trials/disease/c4872/treatment              | Treatment Clinical Trials for Breast Cancer                            | Clinical trials are research studies that involve people. The clinical trials on this list are for breast cancer treatment. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                               |
            | Disease Trial Type              | mobile            | /research/participate/clinical-trials/disease/breast-cancer/treatment      | Treatment Clinical Trials for Breast Cancer                            | Clinical trials are research studies that involve people. The clinical trials on this list are for breast cancer treatment. All trials on the list are NCI-supported clinical trials, which are sponsored or otherwise financially supported by NCI.                                               |


    ## TODO append back &redirect=true to the end of redirectedUrls after this is fixed
    Scenario Outline: Redirect c-code to pretty url functionality
        When user is navigating to "<path>"
        And screen breakpoint is set to "desktop"
        Then user is redirected to "<redirectedUrl>"
        And the page contains meta tags with the following names
            | name                  | content           |
            | prerender-status-code | 301               |
            | prerender-header      | <prerenderHeader> |
        Examples:
            | Route                           | path                                                                        | redirectedUrl                                                                          | prerenderHeader                                                                                                          |
            | Disease                         | /research/participate/clinical-trials/disease/c4872                         | /research/participate/clinical-trials/disease/breast-cancer?pn=1                       | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer                       |
            | Disease Trial Type Intervention | /research/participate/clinical-trials/disease/c4872/treatment/trastuzumab   | /research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab |
            | Disease Trial Type Intervention | /research/participate/clinical-trials/disease/breast-cancer/treatment/c1647 | /research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab |
            | Disease Trial Type Intervention | /research/participate/clinical-trials/disease/c4872/treatment/c1647         | /research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab |
            | Intervention                    | /research/participate/clinical-trials/intervention/c1647                    | /research/participate/clinical-trials/intervention/trastuzumab?pn=1                    | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab                    |
            | Intervention Trial Type         | /research/participate/clinical-trials/intervention/c1647/treatment          | /research/participate/clinical-trials/intervention/trastuzumab/treatment?pn=1          | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab/treatment          |
            | Disease Trial Type              | /research/participate/clinical-trials/disease/c4872/treatment               | /research/participate/clinical-trials/disease/breast-cancer/treatment?pn=1             | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment             |


    Scenario Outline: Redirect to noTrialsFound
        When user is navigating to "<path>" with a 404 status
        And screen breakpoint is set to "desktop"
        Then user is redirected to "<redirectedUrl>"
        Then page title is "<page title>"
        Then the text "<noTrialsText>" appears
        And "new search" link has href "/research/participate/clinical-trials-search"
        And "contact our Cancer Information Service" link has href "/contact"
        And the page contains meta tags with the following names
            | name                  | content            |
            | prerender-status-code | 302                |
            | prerender-header      | <prerender-header> |
            | robots                | noindex            |

        Examples:
            | Route                           | path                                                                              | redirectedUrl                                                                                            | page title                                                    | noTrialsText                                                                                                                                                                                                         | prerender-header                                                                                                                           |
            | Disease                         | /research/participate/clinical-trials/disease/spiroplatin                         | /research/participate/clinical-trials/disease/notrials?p1=spiroplatin&pn=1                               | Spiroplatin Clinical Trials                                   | There are no NCI-supported clinical trials for spiroplatin at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials.                               | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials?p1=spiroplatin                               |
            | Disease Trial Type Intervention | /research/participate/clinical-trials/disease/spiroplatin/treatment/trastuzumab   | /research/participate/clinical-trials/disease/notrials?p1=spiroplatin&p2=treatment&p3=trastuzumab&pn=1   | Treatment Clinical Trials for Spiroplatin Using Trastuzumab   | There are no NCI-supported clinical trials for spiroplatin treatment using trastuzumab at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials.   | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials?p1=spiroplatin&p2=treatment&p3=trastuzumab   |
            | Disease Trial Type Intervention | /research/participate/clinical-trials/disease/breast-cancer/treatment/spiroplatin | /research/participate/clinical-trials/disease/notrials?p1=breast-cancer&p2=treatment&p3=spiroplatin&pn=1 | Treatment Clinical Trials for Breast Cancer Using Spiroplatin | There are no NCI-supported clinical trials for breast cancer treatment using spiroplatin at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials. | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials?p1=breast-cancer&p2=treatment&p3=spiroplatin |
            | Intervention                    | /research/participate/clinical-trials/intervention/spiroplatin                    | /research/participate/clinical-trials/intervention/notrials?p1=spiroplatin&pn=1                          | Clinical Trials Using Spiroplatin                             | There are no NCI-supported clinical trials studying spiroplatin at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials.                          | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/notrials?p1=spiroplatin                          |
            | Intervention Trial Type         | /research/participate/clinical-trials/intervention/spiroplatin/treatment          | /research/participate/clinical-trials/intervention/notrials?p1=spiroplatin&p2=treatment&pn=1             | Treatment Clinical Trials Using Spiroplatin                   | There are no NCI-supported clinical trials for treatment using spiroplatin at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials.               | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/notrials?p1=spiroplatin&p2=treatment             |
            | Disease Trial Type              | /research/participate/clinical-trials/disease/spiroplatin/treatment               | /research/participate/clinical-trials/disease/notrials?p1=spiroplatin&p2=treatment&pn=1                  | Treatment Clinical Trials for Spiroplatin                     | There are no NCI-supported clinical trials for spiroplatin treatment at this time. You can try a new search or contact our Cancer Information Service to talk about options for clinical trials.                     | Location: {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials?p1=spiroplatin&p2=treatment                  |


    Scenario Outline: Meta Tags
        When user is navigating to "<path>"
        And screen breakpoint is set to "mobile"
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
            | path                                                                      | page title                                                    | title tag                                                           | og:title                                                      | og:url                                                                                                              | og:description                                                                                                                                                            | description                                                                                                                                                               | canonical link                                                                                                      |
            | /research/participate/clinical-trials/disease/c4872                       | Breast Cancer Clinical Trials                                 | Breast Cancer Clinical Trials - NCI                                 | Breast Cancer Clinical Trials                                 | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer?pn=1                       | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find clinical trials for breast cancer.                                     | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find clinical trials for breast cancer.                                     | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer?pn=1                       |
            | /research/participate/clinical-trials/disease/c4872/treatment/trastuzumab | Treatment Clinical Trials for Breast Cancer Using Trastuzumab | Treatment Clinical Trials for Breast Cancer Using Trastuzumab - NCI | Treatment Clinical Trials for Breast Cancer Using Trastuzumab | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find clinical trials testing trastuzumab in the treatment of breast cancer. | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find clinical trials testing trastuzumab in the treatment of breast cancer. | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 |
            | /research/participate/clinical-trials/intervention/c1647                  | Clinical Trials Using Trastuzumab                             | Clinical Trials Using Trastuzumab - NCI                             | Clinical Trials Using Trastuzumab                             | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab?pn=1                    | NCI supports clinical trials that test new and more effective ways to treat cancer. Find clinical trials studying trastuzumab.                                            | NCI supports clinical trials that test new and more effective ways to treat cancer. Find clinical trials studying trastuzumab.                                            | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab?pn=1                    |
            | /research/participate/clinical-trials/intervention/c1647/treatment        | Treatment Clinical Trials Using Trastuzumab                   | Treatment Clinical Trials Using Trastuzumab - NCI                   | Treatment Clinical Trials Using Trastuzumab                   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab/treatment?pn=1          | NCI supports clinical trials studying new and more effective ways to treat cancer. Find clinical trials testing treatment methods that use trastuzumab.                   | NCI supports clinical trials studying new and more effective ways to treat cancer. Find clinical trials testing treatment methods that use trastuzumab.                   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab/treatment?pn=1          |
            | /research/participate/clinical-trials/disease/c4872/treatment             | Treatment Clinical Trials for Breast Cancer                   | Treatment Clinical Trials for Breast Cancer - NCI                   | Treatment Clinical Trials for Breast Cancer                   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment?pn=1             | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find treatment clinical trials for breast cancer.                           | NCI supports clinical trials studying new and more effective ways to detect and treat cancer. Find treatment clinical trials for breast cancer.                           | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment?pn=1             |

    Scenario Outline: Page not found
        When user is navigating to "<path>" with a 404 status
        And screen breakpoint is set to "mobile"
        Then page title is "Page Not Found"
        Then the text "We can't find the page you're looking for.Visit the homepage, browse by cancer type, or use the search below.Have a question? Get in touch." appears
        And "homepage" link has href "https://www.cancer.gov"
        And "cancer type" link has href "https://www.cancer.gov/types"
        And "Get in touch" link has href "https://www.cancer.gov/contact"

        Examples:
            | path                                                                   |
            | /research/participate/clinical-trials/disease/c123455                  |
            | /research/participate/clinical-trials/disease/c4872/tre/trastuzumab    |
            | /research/participate/clinical-trials/disease/c4872/treatment/tragshdj |
            | /research/participate/clinical-trials/disease/c123455                  |
            | /research/participate/clinical-trials/disease/c123455/treatment        |
            | /research/participate/clinical-trials/disease/c1647/treat              |
            | /research/participate/clinical-trials/disease/c123455/treatment        |
            | /research/participate/clinical-trials/disease/c4872/treat              |

    ###### Analytics #####

    Scenario: Analytics page load Disease
        When user is navigating to "/research/participate/clinical-trials/disease/breast-cancer" with added wait
        And screen breakpoint is set to "desktop"
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                                         |
            | prop6     | Breast Cancer Clinical Trials                                                                 |
            | prop10    | Breast Cancer Clinical Trials - NCI                                                           |
            | prop44    | Research Landing Page                                                                         |
            | prop3     | /research/participate/clinical-trials/disease/breast-cancer                                   |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                          |
            | prop29    |                                                                                               |
            | prop62    | Clinical Trials: Custom                                                                       |
            | prop20    | /^disease\|breast-cancer\|none\|none\|\d+/                                                    |
            | prop11    | clinicaltrials_custom                                                                         |
            | prop8     | english                                                                                       |
            | evar44    | D=c44                                                                                         |
            | evar11    | D=c11                                                                                         |
            | evar20    | D=c20                                                                                         |
            | evar47    | clinicaltrials_custom                                                                         |
            | evar62    | D=c62                                                                                         |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer?pn=1 |
            | event2    |                                                                                               |
            | event1    |                                                                                               |
            | channel   | Research                                                                                      |
            | evar61    | nciAppModulePage\|left_nav                                                           |

    Scenario: Analytics page load disease trial type no trials found
        When user is navigating to "/research/participate/clinical-trials/disease/spiroplatin/treatment" with a 404 status
        And screen breakpoint is set to "desktop"
        And browser waits
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                                |
            | prop6     | Treatment Clinical Trials for Spiroplatin                                                                            |
            | prop10    | Treatment Clinical Trials for Spiroplatin - NCI                                                                      |
            | prop44    | Research Landing Page                                                                                                |
            | prop3     | /research/participate/clinical-trials/disease/notrials                                                               |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                                 |
            | prop29    |                                                                                                                      |
            | prop62    | Clinical Trials: Custom                                                                                              |
            | prop20    | /^disease\|spiroplatin\|treatment\|none\|0/                                                                          |
            | prop11    | clinicaltrials_custom                                                                                                |
            | prop8     | english                                                                                                              |
            | evar44    | D=c44                                                                                                                |
            | evar11    | D=c11                                                                                                                |
            | evar20    | D=c20                                                                                                                |
            | evar47    | clinicaltrials_custom                                                                                                |
            | evar62    | D=c62                                                                                                                |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials                                               |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/notrials?p1=spiroplatin&p2=treatment&pn=1 |
            | event2    |                                                                                                                      |
            | event1    |                                                                                                                      |
            | channel   | Research                                                                                                             |
            | evar61    | nciAppModulePage\|left_nav                                                                                  |

    Scenario: Analytics page load disease trial type intervention
        When user is navigating to "/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab" with added wait
        And screen breakpoint is set to "desktop"
        And browser waits
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                               |
            | prop6     | Treatment Clinical Trials for Breast Cancer Using Trastuzumab                                                       |
            | prop10    | Treatment Clinical Trials for Breast Cancer Using Trastuzumab - NCI                                                 |
            | prop44    | Research Landing Page                                                                                               |
            | prop3     | /research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab                                   |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                                |
            | prop29    |                                                                                                                     |
            | prop62    | Clinical Trials: Custom                                                                                             |
            | prop20    | /^disease\|breast-cancer\|treatment\|trastuzumab\|\d+/                                                              |
            | prop11    | clinicaltrials_custom                                                                                               |
            | prop8     | english                                                                                                             |
            | evar44    | D=c44                                                                                                               |
            | evar11    | D=c11                                                                                                               |
            | evar20    | D=c20                                                                                                               |
            | evar47    | clinicaltrials_custom                                                                                               |
            | evar62    | D=c62                                                                                                               |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment/trastuzumab?pn=1 |
            | event2    |                                                                                                                     |
            | event1    |                                                                                                                     |
            | channel   | Research                                                                                                            |
            | evar61    | nciAppModulePage\|left_nav                                                                                 |

    Scenario: Analytics page load intervention trial type
        When user is navigating to "/research/participate/clinical-trials/intervention/trastuzumab/treatment" with added wait
        And screen breakpoint is set to "desktop"
        And browser waits
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                      |
            | prop6     | Treatment Clinical Trials Using Trastuzumab                                                                |
            | prop10    | Treatment Clinical Trials Using Trastuzumab - NCI                                                          |
            | prop44    | Research Landing Page                                                                                      |
            | prop3     | /research/participate/clinical-trials/intervention/trastuzumab/treatment                                   |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                                                       |
            | prop29    |                                                                                                            |
            | prop62    | Clinical Trials: Custom                                                                                    |
            | prop20    | /^intervention\|trastuzumab\|treatment\|\d+/                                                               |
            | prop11    | clinicaltrials_custom                                                                                      |
            | prop8     | english                                                                                                    |
            | evar44    | D=c44                                                                                                      |
            | evar11    | D=c11                                                                                                      |
            | evar20    | D=c20                                                                                                      |
            | evar47    | clinicaltrials_custom                                                                                      |
            | evar62    | D=c62                                                                                                      |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab/treatment                   |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab/treatment?pn=1 |
            | event2    |                                                                                                            |
            | event1    |                                                                                                            |
            | channel   | Research                                                                                                   |
            | evar61    | nciAppModulePage\|left_nav                                                                        |

    Scenario: Analytics page load no trial found
        When user is navigating to "/research/participate/clinical-trials/intervention/spiroplatin" with a 404 status
        And screen breakpoint is set to "desktop"
        And browser waits
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                                                       |
            | prop6     | Clinical Trials Using Spiroplatin                                           |
            | prop10    | Clinical Trials Using Spiroplatin - NCI                                     |
            | prop44    | Research Landing Page                                                       |
            | prop3     | /research/participate/clinical-trials/intervention/notrials                 |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/                                        |
            | prop29    |                                                                             |
            | prop62    | Clinical Trials: Custom                                                     |
            | prop20    | /^intervention\|spiroplatin\|none\|0/                                       |
            | prop11    | clinicaltrials_custom                                                       |
            | prop8     | english                                                                     |
            | evar44    | D=c44                                                                       |
            | evar11    | D=c11                                                                       |
            | evar20    | D=c20                                                                       |
            | evar47    | clinicaltrials_custom                                                       |
            | evar62    | D=c62                                                                       |
            | pageName  | {CANONICAL_HOST}/research/participate/clinical-trials/intervention/notrials |
            | event2    |                                                                             |
            | event1    |                                                                             |
            | channel   | Research                                                                    |
            | evar61    | nciAppModulePage\|left_nav                                         |


    Scenario Outline: Analytics click event
        When user is navigating to "<path>"
        And screen breakpoint is set to "mobile"
        Then page title is "<page title>"
        When user clicks on 1 result
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                 |
            | prop4     | D=pev1                |
            | prop67    | D=pageName            |
            | prop13    | 1\|page 1             |
            | prop12    | clinicaltrials_custom |
            | prop8     | english               |
            | evar2     | D=c8                  |
            | evar12    | D=c12                 |
            | pageName  | <pageName>            |
            | pageURL   | <pageURL>             |
            | event42   |                       |
            | channel   | Research              |
            | pev2      | CTSLink               |
            | linkType  | lnk_o                 |

        Examples:
            | path                                                                  | page title                                  | pageName                                                                              | pageURL                                                                                                 |
            | /research/participate/clinical-trials/intervention/trastuzumab        | Clinical Trials Using Trastuzumab           | {CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab        | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/intervention/trastuzumab?pn=1        |
            | /research/participate/clinical-trials/disease/breast-cancer/treatment | Treatment Clinical Trials for Breast Cancer | {CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment | {PROTOCOL}://{CANONICAL_HOST}/research/participate/clinical-trials/disease/breast-cancer/treatment?pn=1 |