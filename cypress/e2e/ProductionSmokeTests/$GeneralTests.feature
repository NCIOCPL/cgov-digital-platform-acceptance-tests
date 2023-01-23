@smoke
Feature: Basic checks to ensure production site is up and running

    Scenario Outline: Home page is loading on all sites
        Given user is navigating to "<url>"
        Then mega menu is displayed
        And main categories titles are "<titles>"
        And all mega menu sections have the correct "<url>"
        And footer is displayed
        Examples:
            | url                         | titles                                                                                         |
            | /                           | About Cancer,Cancer Types,Research,Grants & Training,News & Events,About NCI                   |
            | /espanol                    | El cáncer,Tipos de cáncer,Investigación,Subvenciones y capacitación,Noticias,Nuestro instituto |
            | /pediatric-adult-rare-tumor | Rare Tumors,Research,Participate,Support,News,About                                            |
            | /rare-brain-spine-tumor     | Tumor Types,Living with a Tumor,Refer and Participate,NCI-CONNECTions Blog,About               |
            | /nano                       | Cancer & Nanotech,Research,Grants & Training,News & Events,About NSDB                          |


    Scenario Outline: Different contents are loaded on all sites
        Given user is navigating to "<url>"
        And page title is "<title>"
        And page options are displayed
        And content is displayed
        And language toggle has a text "<languageToggle>"
        Examples:
            | url                                                                                              | title                                                                   | languageToggle |
            | /about-cancer/coping/feelings/relaxation                                                         | Learning to Relax                                                       | Español        |
            | /news-events/cancer-currents-blog/2020/fda-foundation-one-cancer-liquid-biopsy-expanded-approval | Cancer “Liquid Biopsy” Blood Test Gets Expanded FDA Approval            | Español        |
            | /research/infrastructure/cancer-centers/find/mayoclinic                                          | Mayo Clinic Cancer Center                                               | none           |
            | /espanol/tipos/higado/cancer-vias-biliares                                                       | ¿Qué es el cáncer de vías biliares (colangiocarcinoma)?                 | English        |
            | /types/liver/hp/adult-liver-treatment-pdq                                                        | Adult Primary Liver Cancer Treatment (PDQ®)–Health Professional Version | Español        |
            | /nano/about/contact/grodzinski-piotr                                                             | Piotr Grodzinski, Ph.D.                                                 | none           |

    Scenario Outline: Blogs and Press release
        Given user is navigating to "<url>"
        And page title is "<title>"
        And the list of posts is displayed
        Examples:
            | url                                        | title                     |
            | /about-nci/organization/cgh/blog?year=2020 | 2020 - CGH Spotlight Blog |
            | /news-events/press-releases/2022           | 2022 News Releases        |

    Scenario Outline: App modules API's is working
        Given app sends the request "<request>"
        Then response status code is 200
        And the "<data>" is not empty


        Examples:
            | request                                                                                                                            | data       |
            | https://webapis.cancer.gov/glossary/v1/Autosuggest/Cancer.gov/Patient/en/can?matchType=Begins&size=10                              | body       |
            | https://webapis.cancer.gov/drugdictionary/v1/Drugs/expand/B?includeNameTypes=USBrandName&includeNameTypes=PreferredName&size=10000 | results    |
            | https://webapis.cancer.gov/glossary/v1/Terms/Genetics/HealthProfessional/en/acrochordon                                            | definition |
            | https://webapis.cancer.gov/sitewidesearch/v1/Search/cgov/en/breast%20cancer?size=20&from=0&site=all                                | results    |
            | https://webapis.cancer.gov/r4r/v1/resources?from=0&toolTypes=analysis_tools                                                        | results    |
            | https://webapis.cancer.gov/triallistingsupport/v1/listing-information/breast-cancer                                                | conceptId  |

    Scenario: Verify cts and cts print api
        Given user is navigating to "/about-cancer/treatment/clinical-trials/search/r?loc=0&q=breast%20cancer&rl=2"
        Then search results page title is "Clinical Trials Search Results"
        And trial info displays "Results 1-10  of \d+ for your search.*"
        When user selects 1 result's checkbox
        And user clicks on "Print Selected" button at "top" position
        Then user is redirected to "/CTS.Print/Display" with generated "printid"
        And page title is "Your Clinical Trials Search Results"
        Then page load request is sent
        And the following parameters should be captured
            | parameter | value                                |
            | prop6     | Comprehensive Cancer Information     |
            | prop10    | Clinical Trial Search Results        |
            | prop44    | Clinical Trials                      |
            | prop8     | english                              |
            | prop3     | /                                    |
            | prop65    | /^\d{1,2}$/                          |
            | prop26    | /^\d{4}\|\d{1,2}\|\d{1,2}\|\d{1,2}$/ |
            | prop62    | Clinical Trials: Print Results Page  |
            | evar1     | {CANONICAL_HOST}/cts.print/display   |
            | evar44    | Clinical Trials                      |
            | evar2     | english                              |
            | evar5     | Desktop                              |
            | evar62    | Clinical Trials: Print Results Page  |
            | channel   | Clinical Trials Print Results Page   |
            | pageName  | {CANONICAL_HOST}/cts.print/display   |
            | hier1     | {CANONICAL_HOST}\|CTS.Print\|Display |
            | event47   | /d{0,2}/                             |
            | event1    |                                      |

    Scenario Outline: Thumbnail images check
        Given user is navigating to "<url>"
        Then thumbnail images are displayed
        And the image src contains "/files/styles/cgov_thumbnail/public/cgov_image/"

        Examples:
            | url               |
            | /news-events      |
            | /espanol/noticias |

    Scenario Outline: English 404 page
        Given user is navigating to "<url>" with a 404 status
        Then page title is "Page Not Found"
        And the text "We can't find the page you're looking for." is displayed

        Examples:
            | url                                 |
            | /chicken                            |
            | /pediatric-adult-rare-tumor/chicken |
            | /rare-brain-spine-tumor/chicken     |
            | /nano/chicken                       |
            | /connect-prevention-study/chicken   |

    Scenario Outline: Spanish 404 page
        Given user is navigating to "<url>" with a 404 status
        Then page title is "No se encontró la página"
        And the text "No podemos encontrar la página que busca." is displayed

        Examples:
            | url                                     |
            | /espanol/chicken                        |
            | /rare-brain-spine-tumor/espanol/chicken |


