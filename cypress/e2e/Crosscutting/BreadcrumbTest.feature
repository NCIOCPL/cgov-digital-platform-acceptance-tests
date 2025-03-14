Feature: As a user I want to see breadcrumb links so I can navigate website more easily

  Scenario: Bread crumbs English desktop
    Given user is navigating to "/pets/frisco"
    Then the following breadcrumbs are displayed
      | label                    | link  |
      | Home                     | /     |
      | Hidden Pets              | /pets |
      | Frisco - The Roo Roo Kid | none  |
    And current page breadcrumb has an attribute "aria-current" with value "page"
    When user clicks "Hidden Pets" breadcrumb link
    Then page title is "Pets"
    And current page breadcrumb has an attribute "aria-current" with value "page"
    Then the following breadcrumbs are displayed
      | label | link |
      | Home  | /    |
      | Pets  | none |

  Scenario: Spanish Breadcrumb mobile
    Given screen breakpoint is set to "mobile"
    And user is navigating to "/espanol/cancer/sobrellevar/sentimientos"
    Then the following breadcrumbs are displayed
      | label                       | link                        |
      | Cómo hacer frente al cáncer | /espanol/cancer/sobrellevar |
    And current page breadcrumb has an attribute "aria-current" with value "page"

  Scenario Outline: Negative - no breadcrumbs
    And user is navigating to "<url>"
    Then breadcrumbs do not exist

    Examples:
      | url           |
      | /             |
      | /about-cancer |


  Scenario: Encoding of page titles in breadcrumbs
    Given user is navigating to "/test/breadcrumb-test"
    Then the following breadcrumbs are displayed
      | label                                  | link    |
      | Home                                   | /       |
      | Test Content                           | /test-0 |
      | Breadcrumb tests ':;<>?`~!@#$%^&*()_+/ | none    |


  Scenario: Breadcrumb click event
    Given user is navigating to "/pets/frisco"
    When user clicks on "Hidden Pets" breadcrumb link
    Then page click request is sent
    And the following parameters should be captured
      | parameter | value                                     |
      | link      | Hidden Pets                               |
      | event18   |                                           |
      | pev2      | Breadcrumbs:LinkClick                     |
      | linkType  | lnk_o                                     |
      | prop67    | D=pageName                                |
      | prop4     | D=pev1                                    |
      | prop8     | english                                   |
      | prop68    | D=v68                                     |
      | prop46    | D=v46                                     |
      | evar46    | L2\|Hidden Pets                           |
      | evar2     | D=c8                                      |
      | evar68    | Breadcrumbs                               |
      | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/pets/frisco |
      | pageName  | {CANONICAL_HOST}/pets/frisco              |