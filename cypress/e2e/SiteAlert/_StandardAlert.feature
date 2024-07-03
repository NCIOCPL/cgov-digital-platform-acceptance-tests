Feature: As a site admin I want to configure site alert

    Scenario: siteadmin is creating and placing site alert
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        And user is navigating to "/admin/structure/block/block-content"
        And user clicks on "Add content block" button
        Then the list of block contents appears
        When user clicks on "Raw HTML Block" content
        And user enters "NCIDS Alert" into the block description field
        And user enters raw html in the body
            | rows                                                              |
            | <section                                                          |
            | aria-label="Default info site alert example"                      |
            | class="usa-site-alert usa-site-alert--info"                       |
            | data-site-alert-closable="true"                                   |
            | >                                                                 |
            | <div class="usa-alert">                                           |
            | <div class="usa-alert__body">                                     |
            | <div class="usa-alert__nci-header">                               |
            | <span class="usa-alert__heading">COVID-19 resources.</span>       |
            | </div>                                                            |
            | <div class="usa-alert__nci-content">                              |
            | <ul class="usa-list usa-list--two-column">                        |
            | <li>                                                              |
            | <a                                                                |
            | href="#!"                                                         |
            | class="usa-link text-bold text-no-underline hover:text-underline" |
            | >What people with cancer should know</a                           |
            | >                                                                 |
            | </li>                                                             |
            | <li>                                                              |
            | <a                                                                |
            | href="#!"                                                         |
            | class="usa-link text-bold text-no-underline hover:text-underline" |
            | >Get the latest public health information from CDC</a             |
            | >                                                                 |
            | </li>                                                             |
            | <li>                                                              |
            | <a                                                                |
            | href="#!"                                                         |
            | class="usa-link text-bold text-no-underline hover:text-underline" |
            | >Guidance for cancer researchers</a                               |
            | >                                                                 |
            | </li>                                                             |
            | <li>                                                              |
            | <a                                                                |
            | href="#!"                                                         |
            | class="usa-link text-bold text-no-underline hover:text-underline" |
            | >Get the latest research information from NIH</a                  |
            | >                                                                 |
            | </li>                                                             |
            | </ul>                                                             |
            | </div>                                                            |
            | </div>                                                            |
            | </div>                                                            |
            | </section>                                                        |
        And user hits "Save" button
        And browser waits
        When user is navigating to "/admin/structure/block"
        And browser waits
        And user places the "Site Alert Area" block
        And browser waits
        And user filters by "NCIDS Alert"
        And browser waits
        And user unchecks show title and clicks save


    Scenario: Standard site alert
        Given user is navigating to "/"
        Then standard site alert is displayed
        And alert has "Dismiss alert" button
        When user clicks on "expand" arrow button
        Then alert is "expanded"
        And the following links are exposed
            | linkText                                          | href |
            | What people with cancer should know               | #!   |
            | Get the latest public health information from CDC | #!   |
            | Guidance for cancer researchers                   | #!   |
            | Get the latest research information from NIH      | #!   |
        When user is navigating to "/about-cancer/coping/feelings"
        # Then alert is "expanded"
        # When user clicks on "collapse" arrow button
        # Then alert is "collapsed"
        And alert links are hidden
        When user is navigating to "/"
        Then alert is "collapsed"
        And alert links are hidden

    Scenario: Analytics for site alert expand click
        Given user is navigating to "/"
        Then standard site alert is displayed
        When user clicks on "expand" arrow button
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                          |
            | prop4     | D=pev1                         |
            | prop67    | D=pageName                     |
            # | evar52    | Standard Alert\|Expand\|Expand |
            | evar68    | PreHeader                      |
            | prop8     | english                        |
            | evar2     | D=c8                           |
            | prop52    | D=v52                          |
            | prop68    | D=v68                          |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/ |
            | pageName  | {CANONICAL_HOST}/              |
            | event83   |                                |
            | channel   | NCI Homepage                   |
            | pev2      | PreHeader:LinkClick            |
            | linkType  | lnk_o                          |

    Scenario: Analytics for site alert collapse click
        Given user is navigating to "/"
        Then standard site alert is displayed
        When user clicks on "expand" arrow button
        When user clicks on "collapse" arrow button
        And browser waits
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                              |
            | prop4     | D=pev1                             |
            | prop67    | D=pageName                         |
            | evar52    | Standard Alert\|Minimize\|Minimize |
            | evar68    | PreHeader                          |
            | prop8     | english                            |
            | evar2     | D=c8                               |
            | prop52    | D=v52                              |
            | prop68    | D=v68                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/     |
            | pageName  | {CANONICAL_HOST}/                  |
            | event83   |                                    |
            | channel   | NCI Homepage                       |
            | pev2      | PreHeader:LinkClick                |
            | linkType  | lnk_o                              |

    Scenario: Analytics for site alert link click
        Given user is navigating to "/"
        Then standard site alert is displayed
        When user clicks on "expand" arrow button
        And user clicks on "What people with cancer should know" alert link
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                           |
            | prop4     | D=pev1                                                          |
            | prop67    | D=pageName                                                      |
            | evar52    | Standard Alert\|Link Click\|What people with cancer should know |
            | evar68    | PreHeader                                                       |
            | prop8     | english                                                         |
            | evar2     | D=c8                                                            |
            | prop52    | D=v52                                                           |
            | prop68    | D=v68                                                           |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/                                  |
            | pageName  | {CANONICAL_HOST}/                                               |
            | event83   |                                                                 |
            | channel   | NCI Homepage                                                    |
            | pev2      | PreHeader:LinkClick                                             |
            | linkType  | lnk_o                                                           |
            | link      | What people with cancer should know                             |

    Scenario: Analytics for site alert dismiss click
        Given user is navigating to "/"
        Then standard site alert is displayed
        When user dismisses alert
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                            |
            | prop4     | D=pev1                           |
            | prop67    | D=pageName                       |
            | evar52    | Standard Alert\|Dismiss\|Dismiss |
            | evar68    | PreHeader                        |
            | prop8     | english                          |
            | evar2     | D=c8                             |
            | prop52    | D=v52                            |
            | prop68    | D=v68                            |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/   |
            | pageName  | {CANONICAL_HOST}/                |
            | event83   |                                  |
            | channel   | NCI Homepage                     |
            | pev2      | PreHeader:LinkClick              |
            | linkType  | lnk_o                            |
        When user is navigating to "/about-cancer/coping/feelings"
        Then standard site alert is not displayed

    Scenario: login to remove alert (so after hook doesn't have to)
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        When user is logged in and the user name "admin" is displayed in the toolbar