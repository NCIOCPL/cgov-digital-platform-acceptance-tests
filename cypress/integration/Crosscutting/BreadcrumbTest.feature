Feature: Breadcrumb tests

  Scenario Outline: as a user, I want to see the correct number of breadcrumbs and use them to navigate
    Given screen breakpoint is set to "<breakpoint>"
    When user is navigating to "<url>"
    Then the breadcrumbs are displayed
    And the breadcrumbs have the count of <count>
    And the breadcrumbs have the titles as "<title>"
    And the <count> breadcrumbs links to "<linkPath>"
    Examples:
      | breakpoint | url                                                                           | count | title                                                                      | linkPath                                                                                                    |
      | desktop    | /about-cancer/coping/feelings                                                 | 3     | Home,About Cancer,Coping with Cancer                                       | /,/about-cancer,/about-cancer/coping                                                                        |
      | tablet     | /about-cancer/coping/feelings/relaxation                                      | 4     | Home,About Cancer,Coping with Cancer,Feelings and Cancer                   | /,/about-cancer,/about-cancer/coping,/about-cancer/coping/feelings                                          |
      | desktop    | /news-events/cancer-currents-blog/2019/vitamin-d-supplement-cancer-prevention | 3     | Home,News & Events,Cancer Currents Blog                                    | /,/news-events,/news-events/cancer-currents-blog                                                            |
      | tablet     | /about-cancer/coping/feelings/relaxation/2019-investigators-site              | 5     | Home,About Cancer,Coping with Cancer,Feelings and Cancer,Learning to Relax | /,/about-cancer,/about-cancer/coping,/about-cancer/coping/feelings,/about-cancer/coping/feelings/relaxation |
      | desktop    | /about-cancer/coping/feelings/relaxation/dfharvard                            | 5     | Home,About Cancer,Coping with Cancer,Feelings and Cancer,Learning to Relax | /,/about-cancer,/about-cancer/coping,/about-cancer/coping/feelings,/about-cancer/coping/feelings/relaxation |
      | tablet     | /types/breast/research                                                        | 3     | Home,Cancer Types,Breast Cancer                                            | /,/types,/types/breast                                                                                      |
      | desktop    | /espanol/tipos/seno/investigacion                                             | 3     | Página principal,Tipos de cáncer,Cáncer de seno (mama)                     | /espanol,/espanol/tipos,/espanol/tipos/seno                                                                 |
      | tablet     | /about-cancer/coping/feelings/relaxation/chanock-stephen                      | 5     | Home,About Cancer,Coping with Cancer,Feelings and Cancer,Learning to Relax | /,/about-cancer,/about-cancer/coping,/about-cancer/coping/feelings,/about-cancer/coping/feelings/relaxation |
      | desktop    | /news-events/cancer-currents-blog                                             | 2     | Home,News & Events                                                         | /,/news-events                                                                                              |
      | tablet     | /espanol/noticias/temas-y-relatos-blog                                        | 2     | Página principal,Noticias                                                  | /espanol,/espanol/noticias                                                                                  |
      | desktop    | /espanol/tipos/seno                                                           | 2     | Página principal,Tipos de cáncer                                           | /espanol,/espanol/tipos                                                                                     |
      | tablet     | /types/breast                                                                 | 2     | Home,Cancer Types                                                          | /,/types                                                                                                    |
      | desktop    | /about-cancer/treatment/drugs/bevacizumab                                     | 2     | Home,About Cancer                                                          | /,/about-cancer                                                                                             |
      

  Scenario Outline: Negative: as a user, I won't see breadcrumbs where it is not provided
    Given screen breakpoint is set to "<breakpoint>"
    When user is navigating to "<url>"
    Then the breadcrumbs are not displayed
    Examples:
      | url           |
      | /about-cancer |
      | /             |


