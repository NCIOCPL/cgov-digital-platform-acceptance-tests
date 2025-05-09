Feature: As an user, I want to see different components of the Events Dynamic List

        Scenario Outline: Events
                When user is navigating to "<url>"
                Then event's links are displayed
                And each links has a title
                And each link has a date and location


                Examples:
                        | url                                                                |
                        | /news-events/events/past-events-collection                         |
                        | /news-events/events/future-events-collection                       |
                        | /news-events/events/past-events-collection-test-nci-event-series   |
                        | /news-events/events/future-events-collection-test-nci-event-series |
                        | /news-events/events/past-events-collection-test-pager              |
                        | /news-events/events/future-events-collection-test-pager            |

        Scenario: Events list with a pager
                When user is navigating to "/news-events/events/past-events-collection-test-pager"
                Then page title is "Past Events Test Pager"
                And pager is displayed
                When user clicks on page "2"
                Then user is redirected to "/news-events/events/past-events-collection-test-pager?page=1"
                Then event's links are displayed
                And each links has a title
                And each link has a date and location

        Scenario: When user clicks a future event from result list -  analytics event is fired
                When user is navigating to "/news-events/events/future-events-collection"
                And user clicks on event number 2
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                     |
                        | prop4     | D=pev1                                                                    |
                        | prop57    | D=v64                                                                     |
                        | prop58    | D=v65                                                                     |
                        | prop59    | D=v66                                                                     |
                        | prop60    | D=c67                                                                     |
                        | prop67    | D=pageName                                                                |
                        | prop8     | english                                                                   |
                        | evar2     | D=c8                                                                      |
                        | evar61    | cgvMiniLanding\|ncids_default                                             |
                        | evar64    | Internal\|Future Events with No Argument Value\|Test Future Event 4       |
                        | evar66    | 5\|2\|0\|0\|1\|1                                                          |
                        | evar65    | Dynamic List\|NCIDS Collection Condensed\|Future Events                   |
                        | evar67    | Collection Item\|4\|2                                                     |
                        | pageName  | {CANONICAL_HOST}/news-events/events/future-events-collection              |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/events/future-events-collection |
                        | channel   | News and Events                                                           |
                        | pev2      | MLP:Collection:LinkClick                                                  |
                        | linkType  | lnk_o                                                                     |
                        | link      | Test Future Event 4                                                       |


        Scenario: When user clicks a past event from result list -  analytics event is fired
                When user is navigating to "/news-events/events/past-events-collection"
                And user clicks on event number 1
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                   |
                        | prop4     | D=pev1                                                                  |
                        | prop57    | D=v64                                                                   |
                        | prop58    | D=v65                                                                   |
                        | prop59    | D=v66                                                                   |
                        | prop60    | D=c67                                                                   |
                        | prop67    | D=pageName                                                              |
                        | prop8     | english                                                                 |
                        | evar2     | D=c8                                                                    |
                        | evar61    | cgvMiniLanding\|ncids_default                                           |
                        | evar64    | Internal\|Past Events with No Argument Value\|Krispy Kreme Challenge    |
                        | evar65    | Dynamic List\|NCIDS Collection Condensed\|Past Events                   |
                        | evar66    | 5\|2\|0\|0\|1\|1                                                        |
                        | evar67    | Collection Item\|8\|1                                                   |
                        | pageName  | {CANONICAL_HOST}/news-events/events/past-events-collection              |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/events/past-events-collection |
                        | channel   | News and Events                                                         |
                        | pev2      | MLP:Collection:LinkClick                                                |
                        | linkType  | lnk_o                                                                   |
                        | link      | Krispy Kreme Challenge                                                  |

        Scenario: When user clicks a pager -  analytics event is fired
                When user is navigating to "/news-events/events/past-events-collection-test-pager"
                And user clicks on page number 2
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                                                              |
                        | prop4     | D=pev1                                                                             |
                        | prop57    | D=v64                                                                              |
                        | prop58    | D=v65                                                                              |
                        | prop59    | D=v66                                                                              |
                        | prop60    | D=c67                                                                              |
                        | prop67    | D=pageName                                                                         |
                        | prop8     | english                                                                            |
                        | evar2     | D=c8                                                                               |
                        | evar61    | cgvMiniLanding\|ncids_default                                                      |
                        | evar65    | Dynamic List\|NCIDS Collection Condensed\|Past Events                              |
                        | evar66    | 2\|2\|0\|0\|1\|1                                                                   |
                        | evar67    | Nav Links\|5\|2                                                                    |
                        | pageName  | {CANONICAL_HOST}/news-events/events/past-events-collection-test-pager              |
                        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/news-events/events/past-events-collection-test-pager |
                        | channel   | News and Events                                                                    |
                        | pev2      | MLP:Collection:NavClick                                                            |
                        | linkType  | lnk_o                                                                              |
                        | link      | Page 2                                                                             |
