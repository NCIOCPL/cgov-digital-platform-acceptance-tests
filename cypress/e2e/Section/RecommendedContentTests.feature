Feature: Recommended Content tests

    Scenario Outline: Verify that Recommended Content Card exists on the pages and it's components are correct on desktop
        Given user is navigating to "<url>"
        And screen breakpoint is set to "desktop"
        Then recommended content section is visible
        And recommended content header text is "<header>"


        Examples:
            | url                                                                                | header              |
            | /news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly | Recommended Content |

    Scenario Outline: Verify that Recommended Content Card does not exist on tablet and mobile breakpoint
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then recommended content section is not visible

        Examples:
            | breakpoint | url                                                                                |
            | mobile     | /news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly |
            | tablet     | /news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly |


    Scenario Outline: Verify Recommended Content Card's components on desktop
        Given user is navigating to "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        Then recommended content section is visible
        And recommended content section display <totalNumber> of content cards
        And the card's title at position <cardIndex> is "<cardTitle>"
        And the card's image at position <cardIndex> has source "files/styles/ncids_featured_16x9" and file name "<fileName>" before query parameter "<queryParam>"
        And the card's image at position <cardIndex> has the alt text "<altText>" and a link "<cardLink>"

        Examples:
            | totalNumber | cardIndex | cardTitle                                                                | queryParam | fileName             | altText              | cardLink                                              |
            | 3           | 0         | FDA Approves Lenvatinib for Radioactive Iodine-Refractory Thyroid Cancer | h          | pet_mm_article.jpg   | Minnie               | /news-events/cancer-currents-blog/2015/fda-lenvatinib |
            | 3           | 1         | FDA Approves Lenvatinib for Radioactive Iodine-Refractory Thyroid Cancer | h          | pet_smoo_article.jpg | Cat-Cat              | /news-events/cancer-currents-blog/2015/fda-lenvatinib |
            | 3           | 2         | Pubs Locator                                                             | itok       | placeholder-16x9.png | No Image Placeholder | https://pubs.cancer.gov                               |