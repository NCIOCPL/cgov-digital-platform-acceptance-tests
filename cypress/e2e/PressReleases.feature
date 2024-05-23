Feature: As an user, I want to see different components of the Press Releases

        Scenario Outline: Press Release landing page components
                Given screen breakpoint is set to "<breakpoint>"
                When user is navigating to "/news-events/press-releases/2019"
                Then page title is "2019 Press Releases"
                And the 2019 release doesnt have a link
                And the following press releases are displayed
                        | title | link                             |
                        | 2018  | /news-events/press-releases/2018 |
                        | 2017  | /news-events/press-releases/2017 |
                        | 2016  | /news-events/press-releases/2016 |
                        | 2015  | /news-events/press-releases/2015 |
                        | 2014  | /news-events/press-releases/2014 |
                And "Get Email Updates From NCI" box is displayed with a link "https://public.govdelivery.com/accounts/USNIHNCI/subscriber/new"
                And the list of press release pages is displayed
                And each title is a link with href that starts with "/news-events/press-releases/2019"
                And each date is for year "2019"

                Examples:
                        | breakpoint |
                        | desktop    |
                        | mobile     |
                        | tablet     |


        Scenario: Press Release without a date
                When user is navigating to "/news-events/press-releases/2018/press-release-no-date"
                Then page title is "[No Date] Press Release Title"
                And posted date is not displayed
                And the contact "NCI Press Office" is displayed with a link to email "mailto:ncipressofficers@mail.nih.gov"
                When user is clicking on definition for "epidemiology"
                Then pop-up definition box is displayed for "epidemiology"

        Scenario: Spanish Press Release without a date
                When user is navigating to "/espanol/noticias/comunicados-de-prensa/2018/esp-press-release-no-date"
                Then page title is "[No Date] Press Release Title - ES"
                And posted date is not displayed
                And the contact "NCI Press Office" is not displayed


        Scenario: Press Release with a date
                When user is navigating to "/news-events/press-releases/2018/pr-10"
                Then page title is "Press Release 10"
                And "Posted" date is displayed as "May 9, 2018"
                And "Updated" date is displayed as "May 9, 2018"
                And "Reviewed" date is displayed as "May 9, 2018"
                And the contact "NCI Press Office" is displayed with a link to email "mailto:ncipressofficers@mail.nih.gov"


        Scenario: Spanish Press Release with a date
                When user is navigating to "/espanol/noticias/comunicados-de-prensa/2018/pr-10"
                Then page title is "Press Release 10 - ES"
                And "Actualización" date is displayed as "9 de mayo de 2018"
                And "Revisión" date is displayed as "9 de mayo de 2018"
                And the contact "NCI Press Office" is not displayed

        Scenario: When user clicks a press release from result list -  analytics event is fired
                When user is navigating to "/news-events/press-releases/2018"
                And user clicks on press release number 2
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                                           |
                        | prop4     | D=pev1                                                                                          |
                        | prop13    | 2                                                                                               |
                        | prop57    | 2018 Press Releases                                                                             |
                        | prop58    | SearchResults                                                                                   |
                        | prop59    | 2018 Press Releases:2                                                                           |
                        | prop60    | D=pageName                                                                                      |
                        | prop67    | D=pageName                                                                                      |
                        | prop8     | english                                                                                         |
                        | evar2     | D=c8                                                                                            |
                        | pageName  | {CANONICAL_HOST}/news-events/press-releases/2018                                                |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/press-releases/2018                                   |
                        | channel   | News and Events                                                                                 |
                        | pev2      | Legacy:DynamicListItemClick                                                                     |
                        | linkType  | lnk_o                                                                                           |
                        | link      | Ibrutinib plus rituximab superior to standard treatment for some patients with chronic leukemia |

