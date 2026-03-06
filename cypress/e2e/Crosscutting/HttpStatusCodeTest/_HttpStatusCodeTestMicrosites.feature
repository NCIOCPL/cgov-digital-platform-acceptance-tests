Feature: Test for checking HTTP Status Code

  Scenario Outline: Check received status code from get request
    And screen breakpoint is set to "<breakpoint>"
    Then correct status code <code> is received for the "<path>"

    Examples:
      | breakpoint | path                                                             | code |
      | desktop    | /pediatric-adult-rare-tumor                                      | 200  |
      | tablet     | /pediatric-adult-rare-tumor/espanol                              | 200  |
   
