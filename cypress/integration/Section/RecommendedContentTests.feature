Feature: Recommended Content tests

    Scenario Outline: Verify that Recommended Content Card exists on the pages and it's components are correct
        Given user is navigating to "<url>"
        Then recommended content section is visible
        And recommended content header text is "<header>"


        Examples:
            | url                                                                                | header              |
            | /news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly | Recommended Content |

    Scenario Outline: Verify Recommended Content Card's components
        Given user is navigating to "/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly"
        Then recommended content section is visible
        And recommended content section display <totalNumber> of content cards
        And the card's title at position <cardIndex> is "<cardTitle>"
        And the card's image at position <cardIndex> has source "/sites/default/files/styles/cgov_featured/public/cgov_image/featured/" and file name "<fileName>"
        And the card's image at position <cardIndex> has the alt text "<altText>" and a link "<cardLink>"

        Examples:
            | totalNumber | cardIndex | cardTitle                                                                | fileName                                       | altText               | cardLink                                              |
            | 3           | 0         | FDA Approves Lenvatinib for Radioactive Iodine-Refractory Thyroid Cancer | pet_mm_featured.jpg                            | Minnie                | /news-events/cancer-currents-blog/2015/fda-lenvatinib |
            | 3           | 1         | FDA Approves Lenvatinib for Radioactive Iodine-Refractory Thyroid Cancer | pet_smoo_featured.jpg                          | Cat-Cat               | /news-events/cancer-currents-blog/2015/fda-lenvatinib |
            | 3           | 2         | Pubs Locator                                                             | find-clinical-trial-blue-feature-card-feat.jpg | Find a Clinical Trial | https://pubs.cancer.gov                               |