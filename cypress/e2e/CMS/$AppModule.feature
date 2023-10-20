Feature: As a cms user I want to be able to create App Module content type to deploy custom apps

    Scenario: User is adding new App Module content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Application Page" content type
        Then page title is "Create Application Page"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                     | field_name             |
            | Pretty URL       | test-app                                  | field_pretty_url       |
            | Page Title       | Automated App Module Test                 | title                  |
            | Browser Title    | Automated App Module Test - Browser Title | field_browser_title    |
            | Meta Description | Automated App Module Meta Description.    | field_page_description |
        And user selects "JS-Only App Module" from the "Application Module" dropdown
        And user clears out "App Module Instance Settings" text field
        And user enters '{"drupalConfig":{"appName":"test-app-kidney-cancer","rootId":"NCI-trial-listing-app-root","initFnName":"window.ClinicalTrialsListingApp","appCssUri":"https://react-app-dev.cancer.gov/clinical-trials-listing-app/develop/static/css/main.css","appJsUri":"https://react-app-dev.cancer.gov/clinical-trials-listing-app/develop/static/js/main.js","removeHeadElements":["canonical_url","robots","title_tag","og_title","og_url","og_description","description"],"validAppPaths":[]},"frontEndConfig":{"analyticsChannel":"@@TOKEN@@[cgov_tokens:cgov-analytics-channel]","analyticsContentGroup":"@@TOKEN@@[cgov_tokens:cgov-analytics-group]","analyticsPublishedDate":"@@TOKEN@@[node:field_date_posted:date:short]","browserTitle":"Automated App Module Test - Browser Title","ctsApiEndpoint":"@@LITERAL@@window.CDEConfig.ctsConfig.apiServer","itemsPerPage":25,"metaDescription":"Automated App Module Meta Description.","noTrialsHtml":"<p><strong>There are currently no available trials.</strong></p>","pageTitle":"Clinical Trials to Treat Kidney (Renal Cell) Cancer","detailedViewPagePrettyUrlFormatter":"/clinicaltrials/{{nci_id}}","siteName":"@@TOKEN@@[cgov_tokens:cgov-trans-org-name]","title":"@@TOKEN@@[node:field_browser_title:value]","trialListingPageType":"Manual","requestFilters":{"diseases.nci_thesaurus_concept_id":["C4033","C9385"],"primary_purpose":"treatment"}}}' into app config text field
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify newly created content
        Given user is navigating to the front end site with path site section plus "test-app"
        Then page title is "Clinical Trials to Treat Kidney (Renal Cell) Cancer"
        And the page displays pager info "Trials 1-N of N"
        And each result displays the trial title with a link in the following format "/clinicaltrials/NCI-"
        And each result displays the trial summary
        And each result displays "Location: " below the summary
        And the page contains meta tags with the following names
            | name        | content                                |
            | description | Automated App Module Meta Description. |


    Scenario: Edit and republish App Module content type
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-app" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user fills out the following fields
            | fieldLabel | value           | field_name       |
            | Pretty URL | test-app-edited | field_pretty_url |
        When user saves the content page
        And user clicks on the tool bar status button "Editing"
        And user selects "Quick Publish" from workflow actions


    Scenario: Verify edited content
        Given user is navigating to the front end site with path site section plus "test-app-edited"
        Then page title is "Clinical Trials to Treat Kidney (Renal Cell) Cancer"
        And the page displays pager info "Trials 1-N of N"
        And each result displays the trial title with a link in the following format "/clinicaltrials/NCI-"
        And each result displays the trial summary
        And each result displays "Location: " below the summary
        And the page contains meta tags with the following names
            | name        | content                                |
            | description | Automated App Module Meta Description. |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title with url "test-app-edited" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete this content item?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 1 content item." appears on a screen
        And the content item with url "test-app-edited" does not exist in the list of content