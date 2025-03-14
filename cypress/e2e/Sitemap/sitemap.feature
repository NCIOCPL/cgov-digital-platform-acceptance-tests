Feature: Blog series RSS Feed

    Scenario: Verify the sitemap is loaded
        Given the user requests the sitemap from "/sitemap.xml"
        Then the response content type is "application/xml; charset=utf-8"


    Scenario: Standard content sites point to www.cancer.gov
        Given the user requests the sitemap from "/sitemap.xml"
        Then all sitemap entries start with www.cancer.gov


    Scenario: The sitemap has entries, but is not infinite.
        Given the user requests the sitemap from "/sitemap.xml"
        And the sitemap has between 489 and 900 urls


    Scenario: The sitemap supports multiple languages
        Given the user requests the sitemap from "/sitemap.xml"
        Then the sitemap has between 450 and 900 alternate entries with language code "en"
        And the sitemap has between 330 and 900 alternate entries with language code "es"


    Scenario Outline: All expected content types appear in the sitemap
        Given the user requests the sitemap from "/sitemap.xml"
        Then the sitemap includes the path "<path>"

        Examples:
            ## It is expected that all site map entries point to www.cancer.gov as this is the URL we want indexed if a search engine
            ## indexes a lower-tier server.
            | path                                                                  | type                           |
            | {BASE_URL}/                                                           | Home and Landing page          |
            | {BASE_URL}/espanol                                                    |                                |
            | {BASE_URL}/about-cancer/coping/feelings/relaxation                    | Article                        |
            | {BASE_URL}/about-cancer/coping/feelings/relaxation/loukissas-jennifer | Biography                      |
            | {BASE_URL}/about-cancer/coping/feelings/relaxation/duke-university    | Cancer Center                  |
            | {BASE_URL}/types/breast/research                                      | Cancer Research List Page      |
            | {BASE_URL}/espanol/tipos/seno/pro                                     | Cancer Type Home Page          |
            | {BASE_URL}/about-cancer/coping/nci-workshop-event                     | Event                          |
            | {BASE_URL}/news-events                                                | Home and Landing Page          |
            | {BASE_URL}/pets                                                       | Mini Landing Page              |
            | {BASE_URL}/test/types/liver/what-is-liver-cancer                      | PDQ Cancer Information Summary |
            | {BASE_URL}/about-cancer/treatment/drugs/bevacizumab                   | PDQ Drug Information Summary   |


    Scenario Outline: Some content types should not appear in the sitemap.

        Given the user requests the sitemap from "/sitemap.xml"
        And correct status code 200 is received for the "<path>"
        Then the sitemap has no entry for "<path>"

        Examples:
            | path                                | type             |
            | /search/results                     | Application page |
            | /news-events/promo-images-blog/2019 | Blog Post        |
            | /news-events/promo-images-blog      | Blog Series      |
