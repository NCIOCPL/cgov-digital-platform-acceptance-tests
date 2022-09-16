Feature: As an user, I want to see different components of the Blog Series and Blog Posts

    ####################BlogSeriesBlogPosts Analytics######################
    
    Scenario: When user clicks a blog post image from result list -  analytics event is fired
        When user is navigating to "/news-events/cancer-currents-blog"
        And user clicks on blog post image number 1
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                     |
            | prop4     | D=pev1                                                    |
            | prop13    | 1                                                         |
            | prop57    | Cancer Currents Blog                                      |
            | prop58    | SearchResults                                             |
            | prop59    | Cancer Currents Blog:1                                    |
            | prop60    | D=pageName                                                |
            | prop67    | D=pageName                                                |
            | prop8     | english                                                   |
            | evar2     | english                                                   |
            | pageName  | {CANONICAL_HOST}/news-events/cancer-currents-blog         |
            | pageURL   | https://{CANONICAL_HOST}/news-events/cancer-currents-blog |
            | channel   | News and Events                                           |
            | pev2      | SearchResults                                             |
            | linkType  | lnk_o                                                     |
            | link      | Snuggles                                                  |


    Scenario Outline: Cancer Currents Blog Series main page elements are present
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/news-events/cancer-currents-blog"
        Then page title is "Cancer Currents Blog"
        And the "Subscribe" button appears
        And the "Featured Posts" managed list appears with a date "February 15, 2019"
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
        And 2 blog has no image
        And 2 blog has a date as "April 28, 2019"
        And 2 blog has an author "NCI Staff"

    Scenario: Blog series accordion
        Given user is navigating to "/news-events/cancer-currents-blog"
        Then page title is "Cancer Currents Blog"
        When user clicks on "Archive" accordion
        Then "Archive" section is expanded
        And the following sections are displayed
            | title | isExpanded |
            | 2019  | false      |
            | 2018  | false      |
            | 2017  | false      |
            | 2016  | false      |
        When user clicks on "2019" accordion
        Then "2019" section is expanded
        And months links are displayed
        When user clicks on "2018" accordion
        Then the following sections are displayed
            | title | isExpanded |
            | 2019  | true       |
            | 2018  | true       |
            | 2017  | false      |
            | 2016  | false      |


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
            | url                                                          | title                                  |
            | /news-events/cancer-currents-blog?topic=biology              | Biology - Cancer Currents              |
            | /research/key-initiatives/ras/ras-central/blog?topic=1150271 | Cancer Susceptibilities - RAS Dialogue |

    Scenario Outline: Filtering blogs by topic - invalid
        Given user is navigating to "<url>"
        Then page title is "<title>"
        And blog posts list doesnot appear
        Examples:
            | url                                                             | title                  |
            | /news-events/cancer-currents-blog?topic=chicken                 | - Cancer Currents      |
            | /research/key-initiatives/ras/ras-central/blog?topic=1234567898 | - RAS Dialogue         |
            | /espanol/noticias/temas-y-relatos-blog?topic=chicken            | - Temas y relatos blog |

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
        When user is navigating to bad url "<url>"
        Then status code is 400 on "<request>"
        Then the text "<text>" appears
        And blog posts list doesnot appear
        Examples:
            | url                                                     | request                                                                              | text                            |
            | /news-events/cancer-currents-blog?year=chicken          | https://www-dev-ac.cancer.gov/news-events/cancer-currents-blog?year=chicken          | A client error happened         |
            | /research/key-initiatives/ras/ras-central/blog?year=sdf | https://www-dev-ac.cancer.gov/research/key-initiatives/ras/ras-central/blog?year=sdf | A client error happened         |
            | /espanol/noticias/temas-y-relatos-blog?year=ghjk        | https://www-dev-ac.cancer.gov//espanol/noticias/temas-y-relatos-blog?year=ghjk       | Ha ocurrido un error de cliente |

    Scenario Outline: Filtering blogs by month - invalid range
        When user is navigating to bad url "<url>"
        Then status code is 400 on "<request>"
        Then the text "<text>" appears
        And blog posts list doesnot appear
        Examples:
            | url                                                      | request                                                                               | text                            |
            | /news-events/cancer-currents-blog?month=13               | https://www-dev-ac.cancer.gov/news-events/cancer-currents-blog?month=13               | A client error happened         |
            | /research/key-initiatives/ras/ras-central/blog?month=sdf | https://www-dev-ac.cancer.gov/research/key-initiatives/ras/ras-central/blog?month=sdf | A client error happened         |
            | /espanol/noticias/temas-y-relatos-blog?month=0           | https://www-dev-ac.cancer.gov//espanol/noticias/temas-y-relatos-blog?month=0          | Ha ocurrido un error de cliente |

    ### blog
    ##reccomended content is tested in a separate test
    Scenario Outline: Blog's main components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        Then page title is "Researchers Discover Potential Way to Hit Elusive Target in Pancreatic Cancer"
        And blog's posted date is "June 5, 2019"
        And the "Subscribe" button appears
        And the "Featured Posts" managed list appears with a date "February 15, 2019"
        And the "Categories" managed list appears without a date
        And the "Archive" accordion is displayed
        And "Archive" accordion is collapsed
        And blog posts list doesnot appear
        And "< Older Post" button appears with a link "/news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director"
        When user clicks on "< Older Post" button
        And "Newer Post >" button appears with a link "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"

        Examples:
            | breakpoint |
            | desktop    |
            | mobile     |
            | tablet     |

