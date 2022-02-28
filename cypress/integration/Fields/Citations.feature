Feature: Citations Tests

    Scenario Outline: Verify that citation section exists and display expected components
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then citation section is visible
        And citation header text is "<header>"
        And citation number <pubMedLinkNumber> is a PubMed link with an url "<linkUrl>"
        And citation number <plainCitationNumber> is not a PubMed link
        Examples:
            | breakpoint | url                                                                         | header               | linkUrl                                      | pubMedLinkNumber | plainCitationNumber |
            | desktop    | /about-cancer/treatment/side-effects                                        | Selected References  | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |
            | desktop    | /types/breast/reconstruction-fact-sheet                                     | Selected References  | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |
            | tablet     | /espanol/efectos-secundarios                                                | Bibliografía selecta | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |
            | tablet     | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio | Bibliografía         | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |
            | mobile     | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial               | References           | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |
            | mobile     | /news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director  | Selected References  | https://www.ncbi.nlm.nih.gov/pubmed/21460648 | 3                | 1                   |

    Scenario Outline: Verify citation's text length
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        Then citation section is visible
        And citation text for citation number <plainCitationNumber> is within reasonable length

        Examples:
            | breakpoint | url                                                                         | plainCitationNumber |
            | desktop    | /about-cancer/treatment/side-effects                                        | 1                   |
            | desktop    | /types/breast/reconstruction-fact-sheet                                     | 1                   |
            | tablet     | /espanol/efectos-secundarios                                                | 1                   |
            | tablet     | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio | 1                   |
            | mobile     | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial               | 1                   |
            | mobile     | /news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director  | 1                   |

    Scenario Outline: Negative: Verify pages without citation
        Given user is navigating to "<url>"
        And screen breakpoint is set to "tablet"
        Then citation section does not exist

        Examples:
            | url                                                              |
            | /news-events/cancer-currents-blog                                |
            | /espanol/noticias/temas-y-relatos-blog                           |
            | /about-cancer/coping/feelings/relaxation/chanock-stephen         |
            | /about-cancer/coping/feelings/relaxation/dfharvard               |
            | /types/breast/research                                           |
            | /espanol/tipos/seno/investigacion                                |
            | /types/breast                                                    |
            | /espanol/tipos/seno                                              |
            | /types/breast/hp                                                 |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site |
            | /about-cancer                                                    |
            | /espanol/cancer                                                  |
            | /news-events/press-releases/2018                                 |
            | /espanol/noticias/comunicados-de-prensa/2018                     |
            | /about-nci/organization/screen-to-save-infographic               |
            | /espanol/infografia-nci                                          |
            | /research/progress/discovery/gutcheck-intro-video                |