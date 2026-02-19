Feature: As an user, I want to see different components of the Press Releases

        Scenario Outline: Press Release landing page components
                Given screen breakpoint is set to "<breakpoint>"
                When user is navigating to "/news-events/press-releases/2018"
                Then page title is "2018 Press Releases"
                And the following press releases are displayed
                        | title | link                             |
                        | 2020  | /news-events/press-releases/2020 |
                        | 2021  | /news-events/press-releases/2021 |
                        | 2022  | /news-events/press-releases/2022 |
                        | 2023  | /news-events/press-releases/2023 |
                        | 2024  | /news-events/press-releases/2024 |
                        | 2025  | /news-events/press-releases/2025 |
                And "Get Email Updates From NCI" box is displayed with a link "https://public.govdelivery.com/accounts/USNIHNCI/subscriber/new"
                And the list of press release pages is displayed
                And each title is a link with href that starts with "/news-events/press-releases/2018"
                And each date is for year "2018"

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
                        | prop57    | D=v64                                                                                           |
                        | prop58    | D=v65                                                                                           |
                        | prop59    | D=v66                                                                                           |
                        | prop60    | D=c67                                                                                           |
                        | prop67    | D=pageName                                                                                      |
                        | prop8     | english                                                                                         |
                        | evar2     | D=c8                                                                                            |
                        | evar61    | cgvMiniLanding\|ncids_default                                                                   |
                        | evar64    | Internal\|No Title\|Ibrutinib plus rituximab superior to standard trea                          |
                        | evar65    | Dynamic List\|NCIDS Collection Condensed\|Press Releases                                        |
                        | evar67    | Collection Item\|16\|2                                                                          |
                        | pageName  | {CANONICAL_HOST}/news-events/press-releases/2018                                                |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/press-releases/2018                                   |
                        | channel   | News and Events                                                                                 |
                        | pev2      | MLP:Collection:LinkClick                                                                        |
                        | linkType  | lnk_o                                                                                           |
                        | link      | Ibrutinib plus rituximab superior to standard treatment for some patients with chronic leukemia |

        Scenario: External Feature card click event
                Given user is navigating to "/test/press-release-feature-card-embed-test-page"
                When user clicks on NCIDS feature card at position 9
                Then page click request is sent
                And browser waits
                And the following parameters should be captured
                        | parameter | value                                                                             |
                        | prop4     | D=pev1                                                                            |
                        | prop8     | english                                                                           |
                        | prop67    | D=pageName                                                                        |
                        | evar2     | D=c8                                                                              |
                        | evar60    | EmbeddedCardClick                                                                 |
                        | evar81    | Embedded Card\|External                                                           |
                        | evar82    | Embedded Card\|Testing for Derek Override Title\|Testing for Derek Override Title |
                        | evar86    | Feature\|None\|Title                                                              |
                        | evar68    | Body                                                                              |
                        | pageName  | {CANONICAL_HOST}/test/press-release-feature-card-embed-test-page                  |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/press-release-feature-card-embed-test-page     |
                        | event135  |                                                                                   |
                        | channel   | NCI Homepage                                                                      |
                        | pev2      | Body:EmbeddedCard:LinkClick                                                       |
                        | linkType  | lnk_o                                                                             |

        Scenario: Internal Feature card click event
                Given user is navigating to "/test/press-release-feature-card-embed-test-page"
                When user clicks on NCIDS feature card at position 2
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                         |
                        | prop4     | D=pev1                                                                        |
                        | prop8     | english                                                                       |
                        | prop67    | D=pageName                                                                    |
                        | evar2     | D=c8                                                                          |
                        | evar60    | EmbeddedCardClick                                                             |
                        | evar81    | Embedded Card\|Internal                                                       |
                        | evar82    | Embedded Card\|Learning to Relax\|Learning to Relax                           |
                        | evar86    | Feature\|Left\|Image                                                          |
                        | evar68    | Body                                                                          |
                        | pageName  | {CANONICAL_HOST}/test/press-release-feature-card-embed-test-page              |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/press-release-feature-card-embed-test-page |
                        | event135  |                                                                               |
                        | channel   | NCI Homepage                                                                  |
                        | pev2      | Body:EmbeddedCard:LinkClick                                                   |
                        | linkType  | lnk_o                                                                         |

        Scenario: Embedded video click event
                Given user is navigating to "/test/press-release-video-embed-test-page"
                When user clicks on 1 video
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                  |
                        | prop4     | D=pev1                                                                 |
                        | prop8     | english                                                                |
                        | prop67    | D=pageName                                                             |
                        | evar2     | D=c8                                                                   |
                        | evar81    | Embedded Video\|play                                                   |
                        | evar82    | Video\|Nonspecific Immune Stimulation\|Nonspecific Immune Stimulation  |
                        | evar68    | Body                                                                   |
                        | pageName  | {CANONICAL_HOST}/test/press-release-video-embed-test-page              |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/press-release-video-embed-test-page |
                        | event51   |                                                                        |
                        | channel   | NCI Homepage                                                           |
                        | pev2      | Body:EmbeddedMedia:LinkClick                                           |
                        | linkType  | lnk_o                                                                  |


