Feature: As a user, I want to be able to view and interact with the Mega Menu

    Scenario Outline: As a user, I want to view the Mega Menu with correct categories and menu items when I am on desktop
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "<url>"
        Then mega menu is displayed
        And main categories titles are "<titles>"
        And correct <number> of top-level menu items is displayed
        And "Spanish" menu title "Subvenciones y capacitación" is a link

        Examples:
            | breakpoint | url                                                                      | number | titles                                                                       |
            | desktop    | /espanol/noticias/comunicados-de-prensa/2018/oropharyngeal-hpv-cisplatin | 6      | El cáncer,Tipos de cáncer,Investigación,Noticias,Nuestro instituto           |
            | desktop    | /about-cancer/coping/feelings                                            | 6      | About Cancer,Cancer Types,Research,Grants & Training,News & Events,About NCI |
            | desktop    | /annual-report-nation-2018                                               | 6      | About Cancer,Cancer Types,Research,Grants & Training,News & Events,About NCI |
            | desktop    | /news-events/press-releases/2018/oropharyngeal-hpv-cisplatin             | 6      | About Cancer,Cancer Types,Research,Grants & Training,News & Events,About NCI |
            | desktop    | /espanol/cancer/sobrellevar/sentimientos/hoja-informativa-estres         | 6      | El cáncer,Tipos de cáncer,Investigación,Noticias,Nuestro instituto           |


    Scenario: Mega Menu api
        Given user makes json request to "/taxonomy/term/1500001/mega-menu"
        Then the json response matches the contents of "A.json"

    Scenario: When user expands mega menu, the expected items are displayed
        Given user is navigating to "api-test"
        Then mega menu is displayed
        When user clicks on "A" menu section
        And browser waits
        Then the following menu links are displayed
            | label | href            |
            | A.1   | /api-test/a/1   |
            | A.1.1 | /api-test/a/1/1 |
            | A.1.2 | /api-test/a/1/2 |
            | A.2   | /api-test/a/2   |
            | A.2.1 | /api-test/a/2/1 |
            | A.2.2 | /api-test/a/2/2 |
            | A.3   | /api-test/a/3   |
            | A.3.1 | /api-test/a/3/1 |
            | A.3.2 | /api-test/a/3/2 |
            | A.4   | /api-test/b/4/1 |
        And primary link is "Explore A" with href "/api-test/a"

    ### Analytics

    Scenario: Click event on mega menu section label
        Given user is navigating to "api-test"
        Then mega menu is displayed
        When user clicks on "A" menu section
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                             |
            | prop4     | D=pev1                            |
            | prop67    | D=pageName                        |
            | prop53    | D=v76                             |
            | prop68    | D=v68                             |
            | prop8     | english                           |
            | evar2     | D=c8                              |
            | evar68    | Primary Nav                       |
            | evar76    | A                                 |
            | pageURL   | https://{CANONICAL_HOST}/api-test |
            | pageName  | {CANONICAL_HOST}/api-test         |
            | event28   |                                   |
            | channel   | NCI Homepage                      |
            | pev2      | PrimaryNav:Open                   |
            | linkType  | lnk_o                             |
            | link      | A                                 |

    Scenario: Click event on mega menu inner section link
        Given user is navigating to "api-test"
        Then mega menu is displayed
        When user clicks on "A" menu section
        And user clicks on "A.1.2" mega menu sub section link
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                             |
            | prop4     | D=pev1                            |
            | prop67    | D=pageName                        |
            | prop54    | D=v77                             |
            | prop55    | D=v78                             |
            | prop68    | D=v68                             |
            | prop8     | english                           |
            | evar2     | D=c8                              |
            | evar68    | Primary Nav                       |
            | evar77    | A\|A.1\|A.1.2                     |
            | evar78    | List Item\|1\|2                   |
            | pageURL   | https://{CANONICAL_HOST}/api-test |
            | pageName  | {CANONICAL_HOST}/api-test         |
            | event26   |                                   |
            | channel   | NCI Homepage                      |
            | pev2      | PrimaryNav:LinkClick              |
            | linkType  | lnk_o                             |
            | link      | A.1.2                             |


    Scenario: Click event on mega menu that is a direct link to a page
        Given user is navigating to "api-test"
        Then mega menu is displayed
        When user clicks on "B" menu link
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                             |
            | prop4     | D=pev1                            |
            | prop67    | D=pageName                        |
            | prop54    | D=v77                             |
            | prop55    | D=v78                             |
            | prop68    | D=v68                             |
            | prop8     | english                           |
            | evar2     | D=c8                              |
            | evar68    | Primary Nav                       |
            | evar77    | B\|B\|B                           |
            | evar78    | Primary Nav Button\|0\|0          |
            | pageURL   | https://{CANONICAL_HOST}/api-test |
            | pageName  | {CANONICAL_HOST}/api-test         |
            | event26   |                                   |
            | channel   | NCI Homepage                      |
            | pev2      | PrimaryNav:LinkClick              |
            | linkType  | lnk_o                             |
            | link      | B                                 |
