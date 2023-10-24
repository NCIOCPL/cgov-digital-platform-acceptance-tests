Feature: Blog series RSS Feed

    Scenario: Verify the sitemap is loaded
        Given user requests the sitemap from "/sitemap.xml"
        Then the response content type is "application/xml; charset=utf-8"
        And the sitemap has at least 489 urls
        # make sure we didn't get an infinite sitemap
        And the sitemap has no more than 900 urls
        And all sitemap entries start with www.cancer.gov


    Scenario Outline: All expected content types appear in the sitemap
        Given user requests the sitemap from "/sitemap.xml"
        Then the sitemap includes the path "<path>"

        Examples:
            ## It is expected that all site map entries point to www.cancer.gov as this is the URL we want indexed if a search engine
            ## indexes a lower-tier server.
            ## Commented out entries are for types which are excluded from sitemaps
            | path                                                                              | type                           |
            | https://www.cancer.gov/                                                           | Home and Landing page          |
            | https://www.cancer.gov/espanol                                                    |                                |
            #| https://www.cancer.gov/search/results                                               | Application page              |
            | https://www.cancer.gov/about-cancer/coping/feelings/relaxation                    | Article                        |
            | https://www.cancer.gov/about-cancer/coping/feelings/relaxation/loukissas-jennifer | Biography                      |
            #| https://www.cancer.gov/news-events/promo-images-blog/2019                           | Blog Post                     |
            #| https://www.cancer.gov/news-events/promo-images-blog                                | Blog Series                   |
            | https://www.cancer.gov/about-cancer/coping/feelings/relaxation/duke-university    | Cancer Center                  |
            | https://www.cancer.gov/types/breast/research                                      | Cancer Research List Page      |
            | https://www.cancer.gov/espanol/tipos/seno/pro                                     | Cancer Type Home Page          |
            | https://www.cancer.gov/about-cancer/coping/nci-workshop-event                     | Event                          |
            | https://www.cancer.gov/news-events                                                | Home and Landing Page          |
            | https://www.cancer.gov/pets                                                       | Mini Landing Page              |
            | https://www.cancer.gov/test/types/liver/what-is-liver-cancer                      | PDQ Cancer Information Summary |
            | https://www.cancer.gov/about-cancer/treatment/drugs/bevacizumab                   | PDQ Drug Information Summary   |


    Scenario: The sitemap supports multiple languages
        Given user requests the sitemap from "/sitemap.xml"
        Then the sitemap has at least 450 alternate entries with language code "en"
        And the sitemap has at least 330 alternate entries with language code "es"
        And the sitemap has no more than 900 alternate entries with language code "en"
        And the sitemap has no more than 900 alternate entries with language code "es"
