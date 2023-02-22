 Feature: Site Wide Search app is integrated within CGOV platform
 
 Scenario Outline: Search results on micro sites.
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<breakpoint>"
        And the "<tag1>" title is "<title1>"
        And the "<tag2>" title is "<title2>"
        And the "<tag3>" title is "<title3>"
        And the results are displayed with each title containing a link
        And the system defaults to '20' results per page
        Then the drop down box to show results per page is displayed

        Examples:
            | url                                                                                      | tag1 | title1                                    | breakpoint | tag2 | title2                  | tag3 | title3                                       |
            | /search/results/dceg-results?swKeyword=genetics                                          | H1   | DCEG Search Results                       | desktop    | H3   | Results for: genetics   | H4   | Results XXXXX-XXXXX of XXXXX for: genetics   |
            | /rare-brain-spine-tumor/search/results/nciconnect-results?swKeyword=cancer               | H1   | Rare Brain and Spine Tumor Search Results | tablet     | H3   | Results for: cancer     | H4   | Results XXXXX-XXXXX of XXXXX for: cancer     |
            | /rare-brain-spine-tumor/espanol/buscar/resultados/nciconnect-resultados?swKeyword=cancer | H1   | NCIConnect Resultados                     | mobile     | H3   | Resultados para: cancer | H4   | Resultados XXXXX-XXXXX de XXXXX para: cancer |