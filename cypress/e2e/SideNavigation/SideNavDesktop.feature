Feature: As a user, I want to be able to navigate to a different site sections using side navigation menu

    Scenario: User is on section nav root page and is able to see all first level children
        Given user is navigating to "/api-test/a/1"
        Then the current page is "A.1"
        And the following nav children are displayed
            | A.1.1 |
            | A.1.2 |

    Scenario: User is on second level nav section and is able to see it's children pages and siblings, as well as parent section
        Given user is navigating to "/api-test/a/1/1"
        Then the current page is "A.1.1"
        And the following nav children are displayed
            | A.1.1.1 |
        And the following nav siblings are displayed
            | A.1.2 |
        And 1 level up section is "A.1"

    Scenario: User is on the third level nav section and is able to see it's children pages and siblings, as well as parent section
        Given user is navigating to "/api-test/a/1/1/1"
        Then the current page is "A.1.1.1"
        And 1 level up section is "A.1.1"
        And 2 level up section is "A.1"
        And the following nav children are displayed
            | A.1.1.1.1 |

    Scenario: User is on the fourth level nav section and is able to see it's children pages and siblings, as well as parent section
        Given user is navigating to "/api-test/a/1/1/1/1"
        Then the current page is "A.1.1.1.1"
        And 1 level up section is "A.1.1.1"
        And 2 level up section is "A.1.1"
        And 3 level up section is "A.1"
        And the following nav children are displayed
            | A.1.1.1.1.1 |

    Scenario: User is on the fifth and last visible level nav section and is able to see its siblings, as well as parent section, but not the children
        Given user is navigating to "/api-test/a/1/1/1/1/1"
        Then the current page is "A.1.1.1.1.1"
        And 1 level up section is "A.1.1.1.1"
        And 2 level up section is "A.1.1.1"
        And 3 level up section is "A.1.1"
        And 4 level up section is "A.1"
        And the children are not displayed

    Scenario: User is on the sixth level nav section and is not able to see a current page in the side nav
        Given user is navigating to "/api-test/a/1/1/1/1/1/1"
        Then the current page is not displayed in the side nav
        And 1 level up section is "A.1.1.1.1.1"
        And 2 level up section is "A.1.1.1.1"
        And 3 level up section is "A.1.1.1"
        And 4 level up section is "A.1.1"
        And 5 level up section is "A.1"

    Scenario: Previously current page will hide all it's children when user switches to a sibling section
        Given user is navigating to "/api-test/a/1/1/1"
        Then the current page is "A.1.1.1"
        When user clicks on "A.1.2" section
        Then the current page is "A.1.2"
        And the following nav siblings are displayed
            | A.1.1 |
        And the "A.1.1.1" section is not displayed

    Scenario: When a child is a section root, switching to it replaces the nav root
        Given user is navigating to "/api-test/a/2"
        Then the current page is "A.2"
        And the following nav children are displayed
            | A.2.1 |
        When user clicks on "A.2.1" section
        Then the current page is "A.2.1"
        And the following nav children are displayed
            | A.2.1.1 |
        And the "A.2" section is not displayed

    Scenario: User doesn't see a section that's marked as hide in nav, but when it is a nav root it's displayed
        Given user is navigating to "/api-test/a/2"
        Then the current page is "A.2"
        And the following nav children are displayed
            | A.2.1 |
        And the "A.2.2" section is not displayed
        When user is navigating to "/api-test/a/2/2"
        Then the current page is "A.2.2"
        And the "A.2" section is not displayed
        And the following nav children are displayed
            | A.2.2.1 |

    Scenario: User doesn't see a section that's marked as hide in nav and is NOT a nav root
        Given user is navigating to "/api-test/a/3"
        Then the current page is "A.3"
        And the following nav children are displayed
            | A.3.2 |
        And the "A.3.1" section is not displayed
        When user is navigating to "/api-test/a/3/1"
        Then the current page is not displayed in the side nav
        When user clicks on "A.3.2" section
        Then the current page is "A.3.2"
        And the following nav children are displayed
            | A.3.2.1 |
        And the "A.3.1.1" section is not displayed
        When user clicks on "A.3.2.1" section
        Then the current page is "A.3.2.1"
        And 1 level up section is "A.3.2"
        And 2 level up section is "A.3"
        When user is navigating to "/api-test/a/3/1/1"
        Then the current page is not displayed in the side nav
        And the "A.3.2.1" section is not displayed

    Scenario: nav page with no landing will not show up (404)
        Given user is navigating to "/api-test/b/1/1"
        Then page title is "B.1.1 - Landing"
        And side nav is not displayed
        And status code is 404 on "/api-test/b/1"
        When user is navigating to "/api-test/b/3/1"
        Then page title is "B.3.1 - Landing"
        And side nav is not displayed
        And status code is 404 on "/api-test/b/3"

    Scenario: nav page with unpublished landing will not show up (403)
        Given user is navigating to "/api-test/b/4/1"
        Then page title is "B.4.1 - Landing"
        And side nav is not displayed
        And status code is 403 on "/api-test/b/4" or 404 if it is acsf
    

    ### the following scenarios are mimicking CTHP's nav structure
    Scenario: site section that has the same landing page as it's first child's section
        Given user is navigating to "/api-test/a/6"
        Then the current page is "A.6.1"
        And 1 level up section is "A.6"
        And the following nav children are displayed
            | A.6.1.1 |
        And the following nav siblings are displayed
            | A.6.2 |
        And section "A.6.2" is not expanded

    Scenario: site section one level deeper of the second child (parent's sibling is not showing it's children(e.g. not expanded))
        Given user is navigating to "/api-test/a/6/2/1"
        Then the current page is "A.6.2.1"
        And 1 level up section is "A.6.2"
        And 2 level up section is "A.6"
        And the children are not displayed
        And section "A.6.1" is not expanded

    Scenario: site section one level deeper of the first child (parent's sibling is not showing it's children(e.g. not expanded))
        Given user is navigating to "/api-test/a/6/1/1"
        Then the current page is "A.6.1.1"
        And 1 level up section is "A.6.1"
        And 2 level up section is "A.6"
        And the children are not displayed
        And section "A.6.2" is not expanded



### Analytics

Scenario: Click even fires when user clicks on nav root
    Given user is navigating to "/api-test/a/1/1"
    Then the current page is "A.1.1"
    When user clicks on "A.1" link
    And browser waits
    Then page click request is sent
    And the following parameters should be captured
        | parameter | value                                   |
        | prop4     | D=pev1                                  |
        | prop67    | D=pageName                              |
        | evar68    | SideNav                                 |
        | evar69    | A.1\|A.1\|L2\|L1\|1                     |
        | prop8     | english                                 |
        | evar2     | D=c8                                    |
        | prop68    | D=v68                                   |
        | prop69    | D=v69                                   |
        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/api-test/a/1/1 |
        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
        | event33   |                                         |
        | channel   | NCI Homepage                            |
        | pev2      | SideNav:LinkClick                       |
        | linkType  | lnk_o                                   |
        | link      | A.1                                     |

Scenario: Click even fires when user clicks on first level child section
    Given user is navigating to "/api-test/a/1"
    When user clicks on "A.1.1" link
    And browser waits
    Then page click request is sent
    And the following parameters should be captured
        | parameter | value                                 |
        | prop4     | D=pev1                                |
        | prop67    | D=pageName                            |
        | evar68    | SideNav                               |
        | evar69    | A.1\|A.1.1\|L1\|L2\|2                 |
        | prop8     | english                               |
        | evar2     | D=c8                                  |
        | prop68    | D=v68                                 |
        | prop69    | D=v69                                 |
        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/api-test/a/1 |
        | pageName  | {CANONICAL_HOST}/api-test/a/1         |
        | event33   |                                       |
        | channel   | NCI Homepage                          |
        | pev2      | SideNav:LinkClick                     |
        | linkType  | lnk_o                                 |
        | link      | A.1.1                                 |

Scenario: Click even fires when user clicks on 5th level child section
    Given user is navigating to "/api-test/a/1/1/1/1"
    When user clicks on "A.1.1.1.1.1" link
    And browser waits
    Then page click request is sent
    And the following parameters should be captured
        | parameter | value                                       |
        | prop4     | D=pev1                                      |
        | prop67    | D=pageName                                  |
        | evar68    | SideNav                                     |
        | evar69    | A.1\|A.1.1.1.1.1\|L4\|L5\|5                 |
        | prop8     | english                                     |
        | evar2     | D=c8                                        |
        | prop68    | D=v68                                       |
        | prop69    | D=v69                                       |
        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/api-test/a/1/1/1/1 |
        | pageName  | {CANONICAL_HOST}/api-test/a/1/1/1/1         |
        | event33   |                                             |
        | channel   | NCI Homepage                                |
        | pev2      | SideNav:LinkClick                           |
        | linkType  | lnk_o                                       |
        | link      | A.1.1.1.1.1                                 |


Scenario: Click even fires when user clicks on the sibling section of a root while on the 4th level deep child
    Given user is navigating to "/api-test/a/1/1/1/1"
    When user clicks on "A.1.2" link
    And browser waits
    Then page click request is sent
    And the following parameters should be captured
        | parameter | value                                       |
        | prop4     | D=pev1                                      |
        | prop67    | D=pageName                                  |
        | evar68    | SideNav                                     |
        | evar69    | A.1\|A.1.2\|L4\|L2\|6                       |
        | prop8     | english                                     |
        | evar2     | D=c8                                        |
        | prop68    | D=v68                                       |
        | prop69    | D=v69                                       |
        | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/api-test/a/1/1/1/1 |
        | pageName  | {CANONICAL_HOST}/api-test/a/1/1/1/1         |
        | event33   |                                             |
        | channel   | NCI Homepage                                |
        | pev2      | SideNav:LinkClick                           |
        | linkType  | lnk_o                                       |
        | link      | A.1.2                                       |