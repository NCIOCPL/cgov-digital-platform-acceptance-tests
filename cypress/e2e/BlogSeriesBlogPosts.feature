Feature: As an user, I want to see different components of the Blog Series and Blog Posts

    Scenario Outline: Cancer Currents Blog Series main page elements are present
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/news-events/cancer-currents-blog"
        Then page title is "Cancer Currents Blog"
        And the "Subscribe" button appears
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And "Archive" accordion is collapsed
        And blog posts list appears
        And "< Older Posts" button appears with a link "/news-events/cancer-currents-blog?page=1"
        When user clicks on "< Older Posts" button
        And "Newer Posts >" button appears with a link "/news-events/cancer-currents-blog?page=0"

        Examples:
            | breakpoint |
            | desktop    |
            | mobile     |
            | tablet     |

    Scenario: Cancer Currents Spanish Blog Series main page elements are present
        When user is navigating to "/espanol/noticias/temas-y-relatos-blog"
        Then page title is "Temas y relatos blog"
        And the "Suscríbase" button appears
        And the "Archivo" accordion is displayed
        And blog posts list appears
        And each blog post has a title, time, description and "Siga leyendo >" button

    Scenario: Individual blog's elements
        Given user is navigating to "/news-events/cancer-currents-blog"
        Then page title is "Cancer Currents Blog"
        And blog posts list appears
        And each blog post has a title, time, description and "Continue Reading >" button
        And 1 blog has a date as "June 5, 2019"
        And 1 blog has an image with an url "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        And 1 blog's title and continue reading button both link to "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        And 3 blog has no image
        And 3 blog has a date as "May 30, 2019"
        And 3 blog has an author "NCI Staff"

    Scenario: Blog series accordion
        Given user is navigating to "/news-events/cancer-currents-blog"
        Then page title is "Cancer Currents Blog"
        When user clicks on "Archive" accordion
        Then "Archive" section is expanded
        And the following sections are displayed
            | title | isExpanded |





    Scenario Outline: RAS blog main page elements are present
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/research/key-initiatives/ras/ras-central/blog"
        Then page title is "RAS Dialogue Blog"
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And blog posts list appears

        Examples:
            | breakpoint |
            | desktop    |
            | mobile     |
            | tablet     |


    Scenario Outline: Filtering blogs by topic
        Given user is navigating to "<url>"
        Then page title is "<title>"
        And blog posts list appears

        Examples:
            | url                                                                   | title                                              |
            | /news-events/cancer-currents-blog?topic=biology                       | Biology - Cancer Currents                          |
            | /research/key-initiatives/ras/ras-central/blog?topic=elizabeth-jaffee | RAS Conversations: Elizabeth Jaffee - RAS Dialogue |

    Scenario Outline: Filtering blogs by topic - invalid
        Given user is navigating to "<url>"
        Then page title is "<title>"
        And blog posts list doesnot appear
        Examples:
            | url                                                             | title                                                 |
            | /news-events/cancer-currents-blog?topic=chicken                 | Cancer Currents - Error: Category Does Not Exist      |
            | /research/key-initiatives/ras/ras-central/blog?topic=1234567898 | RAS Dialogue - Error: Category Does Not Exist         |
            | /espanol/noticias/temas-y-relatos-blog?topic=chicken            | Temas y relatos blog - Error: Category Does Not Exist |

    Scenario Outline: Filtering blogs by year and month
        Given user is navigating to "<url>"
        Then page title is "<title>"
        And only 1 blog appear
        Examples:
            | url                                                               | title                           |
            | /news-events/cancer-currents-blog?year=2019&month=06              | June 2019 - Cancer Currents     |
            | /research/key-initiatives/ras/ras-central/blog?year=2018&month=12 | December 2018 - RAS Dialogue    |
            | /espanol/noticias/temas-y-relatos-blog?year=2018&month=05         | May 2018 - Temas y relatos blog |

    Scenario Outline: Filtering blogs by year - invalid
        When user is requesting bad url "<url>" and receives "<text>"
        Then status code is 400 on "<request>"
        And blog posts list doesnot appear
        Examples:
            | url                                                     | request                                                           | text            |
            | /news-events/cancer-currents-blog?year=chicken          | {BASE_URL}/news-events/cancer-currents-blog?year=chicken          | year is invalid |
            | /research/key-initiatives/ras/ras-central/blog?year=sdf | {BASE_URL}/research/key-initiatives/ras/ras-central/blog?year=sdf | year is invalid |
            | /espanol/noticias/temas-y-relatos-blog?year=ghjk        | {BASE_URL}/espanol/noticias/temas-y-relatos-blog?year=ghjk        | year is invalid |

    Scenario Outline: Filtering blogs by month - invalid range
        When user is requesting bad url "<url>" and receives "<text>"
        Then status code is 400 on "<request>"
        And blog posts list doesnot appear
        Examples:
            | url                                                      | request                                                            | text             |
            | /news-events/cancer-currents-blog?month=13               | {BASE_URL}/news-events/cancer-currents-blog?month=13               | month is invalid |
            | /research/key-initiatives/ras/ras-central/blog?month=sdf | {BASE_URL}/research/key-initiatives/ras/ras-central/blog?month=sdf | month is invalid |
            | /espanol/noticias/temas-y-relatos-blog?month=0           | {BASE_URL}/espanol/noticias/temas-y-relatos-blog?month=0           | month is invalid |

    ### blog
    ##reccomended content is tested in a separate test
    Scenario Outline: Blog's main components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        Then page title is "Researchers Discover Potential Way to Hit Elusive Target in Pancreatic Cancer"
        And blog's posted date is "June 5, 2019"
        And the "Subscribe" button appears
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And "Archive" accordion is collapsed
        And blog posts list doesnot appear
        And "< Older Post" button appears with a link "/news-events/cancer-currents-blog/2019/"
        When user clicks on "< Older Post" button
        And "Newer Post >" button appears with a link "/news-events/cancer-currents-blog/2019/"

        Examples:
            | breakpoint |
            | desktop    |
            | mobile     |
            | tablet     |

    ###Blog Analytics####

    Scenario: When user clicks a blog post image from result list -  analytics event is fired
        When user is navigating to "/news-events/cancer-currents-blog"
        And user clicks on blog post image number 1
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop13    | 1                                                              |
            | prop57    | Cancer Currents Blog                                           |
            | prop58    | SearchResults                                                  |
            | prop59    | Cancer Currents Blog:1                                         |
            | prop60    | D=pageName                                                     |
            | prop67    | D=pageName                                                     |
            | prop8     | english                                                        |
            | evar2     | D=c8                                                           |
            | pageName  | {CANONICAL_HOST}/news-events/cancer-currents-blog              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/cancer-currents-blog |
            | channel   | News and Events                                                |
            | pev2      | Legacy:DynamicListItemClick                                    |
            | linkType  | lnk_o                                                          |
            | link      | Snuggles                                                       |

    Scenario: External Feature card click event
        Given user is navigating to "/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page"
        When user clicks on NCIDS feature card at position 9
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                                                                      |
            | prop4     | D=pev1                                                                                                     |
            | prop8     | english                                                                                                    |
            | prop67    | D=pageName                                                                                                 |
            | evar2     | D=c8                                                                                                       |
            | evar60    | EmbeddedCardClick                                                                                          |
            | evar81    | Embedded Card\|External                                                                                    |
            | evar82    | Embedded Card\|Testing for Derek Override Title\|Testing for Derek Override Title                          |
            | evar86    | Feature\|None\|Title                                                                                       |
            | evar68    | Body                                                                                                       |
            | pageName  | {CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page |
            | event135  |                                                                                                            |
            | channel   | News and Events                                                                                            |
            | pev2      | Body:EmbeddedCard:LinkClick                                                                                |
            | linkType  | lnk_o                                                                                                      |

    Scenario: Internal Feature card click event
        Given user is navigating to "/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page"
        When user clicks on NCIDS feature card at position 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                      |
            | prop4     | D=pev1                                                                                                     |
            | prop8     | english                                                                                                    |
            | prop67    | D=pageName                                                                                                 |
            | evar2     | D=c8                                                                                                       |
            | evar60    | EmbeddedCardClick                                                                                          |
            | evar81    | Embedded Card\|Internal                                                                                    |
            | evar82    | Embedded Card\|Learning to Relax\|Learning to Relax                                                        |
            | evar86    | Feature\|Left\|Image                                                                                       |
            | evar68    | Body                                                                                                       |
            | pageName  | {CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-feature-card-embed-test-page |
            | event135  |                                                                                                            |
            | channel   | News and Events                                                                                            |
            | pev2      | Body:EmbeddedCard:LinkClick                                                                                |
            | linkType  | lnk_o                                                                                                      |

    Scenario: Embedded video click event
        Given user is navigating to "/news-events/cancer-currents-blog/2019/blog-post-video-embed-test-page"
        When user clicks on 1 video
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                               |
            | prop4     | D=pev1                                                                                              |
            | prop8     | english                                                                                             |
            | prop67    | D=pageName                                                                                          |
            | evar2     | D=c8                                                                                                |
            | evar81    | Embedded Video\|play                                                                                |
            | evar82    | Video\|Nonspecific Immune Stimulation\|Nonspecific Immune Stimulation                               |
            | evar68    | Body                                                                                                |
            | pageName  | {CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-video-embed-test-page              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/cancer-currents-blog/2019/blog-post-video-embed-test-page |
            | event51   |                                                                                                     |
            | channel   | News and Events                                                                                     |
            | pev2      | Body:EmbeddedMedia:LinkClick                                                                        |
            | linkType  | lnk_o                                                                                               |





