Feature: Tests for AP button on a content block

  Scenario Outline: Web site visitor views a page with a button on desktop, tablet
    Given user is navigating to "<url>"
    And screen breakpoint is set to "<screenBreakpoint>"
    Then the button to download At a Glance should appear at the bottom of the page
    And a PDF icon located at "/profiles/custom/cgov_site/themes/custom/ncids_trans/dist/.svg#file-pdf-blue-o-thick" should be displayed with a text "Annual Plan & Budget Proposal At A Glance"
    And clicking on the link will open the PDF in a new window

    Examples:
      | screenBreakpoint | url                     |
      | desktop          | /special-report         |
      | tablet           | /espanol/special-report |

  Scenario: Web site visitor views a page with a button on mobile
    Given user is navigating to "/special-report"
    And screen breakpoint is set to "mobile"
    Then the button to download At a Glance should appear at the bottom of the page
    And a PDF icon located at the top is not displayed

  ####################Analytics##################################

  Scenario: Click events for “Annual Plan & Budget Proposal At-A-Glance” file download button from the page
    Given user is navigating to "/special-report"
    And screen breakpoint is set to "desktop"
    When user clicks on bottom "Annual Plan & Budget Proposal At-A-Glance" button
    Then page click request is sent
    And the following parameters should be captured
      | parameter | value                                        |
      | event52   |                                              |
      | prop8     | english                                      |
      | prop66    | filedownload_button                          |
      | prop67    | D=pageName                                   |
      | evar2     | D=c8                                         |
      | channel   | NCI Homepage                                 |
      | pageName  | {CANONICAL_HOST}/special-report              |
      | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/special-report |