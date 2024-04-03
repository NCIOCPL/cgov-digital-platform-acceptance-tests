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
