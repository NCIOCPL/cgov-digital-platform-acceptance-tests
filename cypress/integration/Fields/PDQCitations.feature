Feature: PDQ Citation Tests

    Scenario Outline: Verify that pdq citation section exists and display expected components
        Given user is navigating to "<url>"
        Then pdq citation section is visible
        And pdq citation section number 1 header text is "<header>"
        And pdq citation number "<pubMedLinkNumber>" is a PubMed link with an url "<linkUrl>"
        And citation section number 1 has a total number of pub med citations of <totalPubMed>
        And pdq citation section number 1 has a total number of citations of <totalPdqCitation>

        Examples:
            | url                                                                    | header       | linkUrl                                                                                                                                                                                                                                                                                                           | pubMedLinkNumber | totalPubMed | totalPdqCitation |
            | /about-cancer/treatment/side-effects/skin-nail-changes/pruritus-hp-pdq | References   | http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11135635&dopt=Abstract                                                                                                                                                                                                             | 0                | 1           | 2                |
            | /types/lung/hp/lung-screening-pdq                                      | References   | http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=21714641&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=24037918&dopt=Abstract                                                                                                       | 0,1              | 2           | 2                |
            | /espanol/tipos/seno/pro/prevencion-seno-pdq                            | Bibliografía | http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=21143857&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=20084540&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=18836828&dopt=Abstract | 0,2,3            | 4           | 4                |
            | /types/breast/hp/breast-prevention-pdq                                 | References   | http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=21143857&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=20084540&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=18836828&dopt=Abstract | 0,2,3            | 4           | 4                |
            | /espanol/tipos/estomago/pro/tratamiento-estomago-pdq                   | Bibliografía | http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=20442388&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=8658213&dopt=Abstract,http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=PubMed&list_uids=11013353&dopt=Abstract  | 1,6,9            | 9           | 10               |

    Scenario Outline: Verify pdq citation's text length
        Given user is navigating to "<url>"
        Then pdq citation section is visible
        And all of the citations in the pdq citation section number 1 are within reasonable text length

        Examples:
            | url                                                                    |
            | /about-cancer/treatment/side-effects/skin-nail-changes/pruritus-hp-pdq |
            | /types/lung/hp/lung-screening-pdq                                      |
            | /espanol/tipos/seno/pro/prevencion-seno-pdq                            |
            | /types/breast/hp/breast-prevention-pdq                                 |
            | /espanol/tipos/estomago/pro/tratamiento-estomago-pdq                   |

    Scenario Outline: Negative: Verify pages without pdq citation
        Given user is navigating to "<url>"
        Then pdq citation section does not exist

        Examples:
            | url                                                                         |
            | /news-events/cancer-currents-blog                                           |
            | /espanol/noticias/temas-y-relatos-blog                                      |
            | /about-cancer/coping/feelings/relaxation/chanock-stephen                    |
            | /about-cancer/coping/feelings/relaxation/dfharvard                          |
            | /types/breast/research                                                      |
            | /espanol/tipos/seno/investigacion                                           |
            | /types/breast                                                               |
            | /espanol/tipos/seno                                                         |
            | /types/breast/hp                                                            |
            | /about-cancer/coping/feelings/relaxation/2019-investigators-site            |
            | /about-cancer                                                               |
            | /espanol/cancer                                                             |
            | /news-events/press-releases/2018                                            |
            | /espanol/noticias/comunicados-de-prensa/2018                                |
            | /about-nci/organization/screen-to-save-infographic                          |
            | /espanol/infografia-nci                                                     |
            | /research/progress/discovery/gutcheck-intro-video                           |
            | /about-cancer/treatment/side-effects                                        |
            | /types/breast/reconstruction-fact-sheet                                     |
            | /espanol/efectos-secundarios                                                |
            | /espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio |
            | /news-events/press-releases/2018/leukemia-cll-ibrutinib-trial               |
            | /news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director  |