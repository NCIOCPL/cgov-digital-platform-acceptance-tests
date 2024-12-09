Feature: As an admin, I want to be able to login to CMS and use main menu bar for any configurations

    Background: Login
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button

    Scenario: user is able to login to cms
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top

    Scenario: user is able to view existing content
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        And the hamburger menu "Manage" is displayed
        Then the toolbar for administration menu appears
        When user clicks on "Content" tab
        Then page title is "Content"
        And the following tab links appear below title
            | name    | link                 |
            | Content | /admin/content       |
            | Blocks  | /admin/content/block |
            | Files   | /admin/content/files |
            | Media   | /admin/content/media |
        And table with existing content is displayed
        And each content title is a link

    Scenario: user is able to access Structure configuration
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Structure" tab
        Then page title is "Structure"
        And the following config links appear below
            | name                | link                             |
            | Block layout        | /admin/structure/block           |
            | Taxonomy            | /admin/structure/taxonomy        |
          
    Scenario: user is able to access Appearance configuration
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Appearance" tab
        Then page title is "Appearance"
        And the following tab links appear below title
            | name     | link                       |
            | List     | /admin/appearance          |
            | Settings | /admin/appearance/settings |
        And page's 1 subtitle is "Main page content"
        And page's 2 subtitle is "Installed themes"
        And page's 3 subtitle is "Uninstalled theme"


    Scenario: user is able to access Configuration
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Configuration" tab
        Then page title is "Configuration"
        And the following configuration groups are displayed
            | title               |
            | Development         |
            | Search and metadata |
            | Web services        |
            | System              |
            | User interface      |
            | Media               |


    Scenario: user is able to access People tab
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "People" tab
        Then page title is "People"
        And table with existing users is displayed
        And each username is a link

    Scenario: user is able to access Reports configuration tab
        When user is logged in and the user name "siteadmin" is displayed in the toolbar
        Then the tool bar appears at the top
        When user clicks on "Reports" tab
        Then page title is "Reports"
        And the following config links appear below
            | name                          | link                           |
            | Recent log messages           | /admin/reports/dblog           |
            | Field list                    | /admin/reports/fields          |
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
