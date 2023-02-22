Feature: As an admin, I want to be able to login to CMS and use main menu bar for any configurations

    Background: Login
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button

    Scenario: user is able to login to cms
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top

    Scenario: user is able to view existing content
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        And the hamburger menu "Manage" is displayed
        Then the toolbar for administration menu appears
        When user clicks on "Content" tab
        Then page title is "Content"
        And the following tab links appear below title
            | name    | link                 |
            | Content | /admin/content       |
            | Files   | /admin/content/files |
            | Media   | /admin/content/media |
        And table with existing content is displayed
        And each content title is a link

    Scenario: user is able to access Structure configuration
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Structure" tab
        Then page title is "Structure"
        And the following config links appear below
            | name                | link                             |
            | Application Modules | /admin/structure/app_module      |
            | Block layout        | /admin/structure/block           |
            | Content types       | /admin/structure/types           |
            | Display modes       | /admin/structure/display-modes   |
            | Media types         | /admin/structure/media           |
            | Pages               | /admin/structure/page_manager    |
            | Paragraph types     | /admin/structure/paragraphs_type |
            | Taxonomy            | /admin/structure/taxonomy        |
            | Views               | /admin/structure/views           |

    Scenario: user is able to access Appearance configuration
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Appearance" tab
        Then page title is "Appearance"
        And the following tab links appear below title
            | name     | link                       |
            | List     | /admin/appearance          |
            | Settings | /admin/appearance/settings |
        And page's 1 subtitle is "Main page content"
        And page's 2 subtitle is "Installed themes"
        And page's 3 subtitle is "Uninstalled themes"

    Scenario: user is able to access Extend configuration
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Extend" tab
        Then page title is "Extend"
        And the following tab links appear below title
            | name      | link                     |
            | List      | /admin/modules           |
            | Uninstall | /admin/modules/uninstall |
        And page's 1 subtitle is "Main page content"

    Scenario: user is able to access Configuration
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Configuration" tab
        Then page title is "Configuration"
        And the following configuration groups are displayed
            | title                 |
            | People                |
            | Content authoring     |
            | Development           |
            | Search and metadata   |
            | Web services          |
            | System                |
            | User interface        |
            | Media                 |
            | Regional and language |
            | Workflow              |

    Scenario: user is able to access People tab
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "People" tab
        Then page title is "People"
        And the following tab links appear below title
            | name               | link                                  |
            | List               | /admin/people                         |
            | Custom permissions | /admin/people/custom-permissions/list |
            | Permissions        | /admin/people/permissions             |
            | Roles              | /admin/people/roles                   |
        And table with existing users is displayed
        And each username is a link

    Scenario: user is able to access Reports configuration tab
        When user is logged in and the user name "admin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Reports" tab
        Then page title is "Reports"
        And the following config links appear below
            | name                          | link                           |
            | Recent log messages           | /admin/reports/dblog           |
            | Available translation updates | /admin/reports/translations    |
            | Field list                    | /admin/reports/fields          |
            | Metatag plugins               | /admin/reports/metatag-plugins |
            | Status report                 | /admin/reports/status          |
            | Top 'access denied' errors    | /admin/reports/access-denied   |
            | Top 'page not found' errors   | /admin/reports/page-not-found  |
            | Views plugins                 | /admin/reports/views-plugins   |

    # Scenario: User is trying to upload a file with virus
    #     Then user is logged in and the user name "admin" is displayed in the toolbar
    #     And the tool bar appears at the top
    #     When user clicks on "Content" tab
    #     And user clicks on "Media" sub tab
    #     And user clicks on "Add media" action button
    #     And user clicks on "File" content type
    #     Then page title is "Add File"
    #     And user uploads test file "fileWithVirus.txt"
    #     And system waits for file upload process
    #     Then the error message "A virus has been detected in the file. The file will be deleted." appears
