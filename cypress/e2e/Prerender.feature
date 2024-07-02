Feature: Prerender's handling of servers errors

    Scenario Outline: trial listing support api server is sending 500
        Given the server sends a 500 response to "<serverUrl>"
        When user is navigating to the front end site with path "<path>"
        Then the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 500     |

        Examples:
            | serverUrl                                                   | path                                                                       |
            | /triallistingsupport/v1/listing-information/breast-cancer   | /research/participate/clinical-trials/disease/breast-cancer                |
            | /triallistingsupport/v1/listing-information/get?ccode=c4872 | /research/participate/clinical-trials/disease/c4872                        |
            | /triallistingsupport/v1/trial-type/treatment                | /research/participate/clinical-trials/disease/breast-cancer/treatment/C274 |
            | /triallistingsupport/v1/listing-information/get?ccode=c1647 | /research/participate/clinical-trials/intervention/c1647                   |
            | /triallistingsupport/v1/trial-type/treatment                | /research/participate/clinical-trials/intervention/c1647/treatment         |
            | /triallistingsupport/v1/listing-information/trastuzumab     | /research/participate/clinical-trials/intervention/trastuzumab             |



    Scenario Outline: clinical trial api server is sending 500
        Given the server sends a 500 response to "https://clinicaltrialsapi.cancer.gov/api/v2/trials"
        When user is navigating to the front end site with path "<path>"
        Then the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 500     |

        Examples:
            | path                                                                       |
            | /research/participate/clinical-trials/disease/breast-cancer                |
            | /research/participate/clinical-trials/disease/breast-cancer/treatment/C274 |
            | /research/participate/clinical-trials/disease/c4872                        |
            | /research/participate/clinical-trials/intervention/c1647                   |
            | /research/participate/clinical-trials/intervention/c1647/treatment         |
            | /research/participate/clinical-trials/intervention/trastuzumab             |
            | /research/participate/clinical-trials/covid-19                             |
            | /research/participate/clinical-trials/adult-metastatic-brain-tumors        |


    Scenario Outline: glossaries and drug dictionary server is sending 500
        Given the server sends a 500 response to "<api>"
        When user is navigating to the front end site with path "<path>"
        Then the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 500     |

        Examples:
            | path                                                                    | api                                                                                                                                |
            | /publications/dictionaries/cancer-terms/def/a33                         | https://webapis.cancer.gov/glossary/v1/Terms/Cancer.gov/Patient/en/a33                                                             |
            | /publications/dictionaries/cancer-terms/expand/A                        | https://webapis.cancer.gov/glossary/v1/Terms/expand/Cancer.gov/Patient/en/A?size=10000                                             |
            | /publications/dictionaries/cancer-terms                                 | https://webapis.cancer.gov/glossary/v1/Terms/count/Cancer.gov/Patient/en                                                           |
            | /espanol/publicaciones/diccionarios/diccionario-cancer/def/a33          | https://webapis.cancer.gov/glossary/v1/Terms/Cancer.gov/Patient/es/a33                                                             |
            | /espanol/publicaciones/diccionarios/diccionario-cancer/ampliar/A        | https://webapis.cancer.gov/glossary/v1/Terms/expand/Cancer.gov/Patient/es/A?size=10000                                             |
            | /espanol/publicaciones/diccionarios/diccionario-cancer                  | https://webapis.cancer.gov/glossary/v1/Terms/count/Cancer.gov/Patient/es                                                           |
            | /espanol/publicaciones/diccionarios/diccionario-genetica/def/acrocordon | https://webapis.cancer.gov/glossary/v1/Terms/Genetics/HealthProfessional/es/acrocordon                                             |
            | /espanol/publicaciones/diccionarios/diccionario-genetica/ampliar/B      | https://webapis.cancer.gov/glossary/v1/Terms/expand/Genetics/HealthProfessional/es/B?size=10000                                    |
            | /espanol/publicaciones/diccionarios/diccionario-genetica                | https://webapis.cancer.gov/glossary/v1/Terms/count/Genetics/HealthProfessional/es                                                  |
            | /publications/dictionaries/genetics-dictionary/def/acrochordon          | https://webapis.cancer.gov/glossary/v1/Terms/Genetics/HealthProfessional/en/acrochordon                                            |
            | /publications/dictionaries/genetics-dictionary/expand/C                 | https://webapis.cancer.gov/glossary/v1/Terms/expand/Genetics/HealthProfessional/en/C?size=10000                                    |
            | /publications/dictionaries/genetics-dictionary                          | https://webapis.cancer.gov/glossary/v1/Terms/count/Genetics/HealthProfessional/en                                                  |
            | /publications/dictionaries/cancer-drug                                  | https://webapis.cancer.gov/drugdictionary/v1/Drugs/expand/A?includeNameTypes=USBrandName&includeNameTypes=PreferredName&size=10000 |
            | /publications/dictionaries/cancer-drug/def/a-101-topical-solution       | https://webapis.cancer.gov/drugdictionary/v1/Drugs/a-101-topical-solution                                                          |

    Scenario Outline: clinical trial server is sending 500
        Given the server sends a 500 response to "<api>"
        When user is navigating to the front end site with path "<path>"
        Then the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 500     |

        Examples:
            | path                                                                        | api                                                               |
            | /research/participate/clinical-trials-search/v?id=NCI-2023-04529&loc=0&rl=1 | https://clinicaltrialsapi.cancer.gov/api/v2/trials/NCI-2023-04529 |
            | /research/participate/clinical-trials-search/v?id=NCT05879926               | https://clinicaltrialsapi.cancer.gov/api/v2/trials/NCT05879926    |