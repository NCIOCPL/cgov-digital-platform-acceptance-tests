Feature: As a user I want to be able to create tables in my content

    Scenario: Create article to test table embed
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And browser waits
        And user fills out the following fields
            | fieldLabel       | value                                    | field_name             |
            | Pretty URL       | article-to-test-table                    | field_pretty_url       |
            | Page Title       | Article to test Table                    | title[0][value]        |
            | Browser Title    | Article to test Table                    | field_browser_title    |
            | Meta Description | Article to test Table - Meta Description | field_page_description |
        And user enters "Table without headers - left aligned" as 1 body section heading
        And user clicks "table" button 1 in the WYSIWYG editor
        And user selects "4" rows and "4" columns
        And user selects "Align table to the left" from "Alignment" dropdown for 1 table
        And user writes "Table Caption" into "Caption" labeled field
        And browser waits
        And user types "cell" in all cells of table 0

        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Table with first row headers - center aligned" as 2 body section heading
        And user clicks "table" button 2 in the WYSIWYG editor
        And user selects "4" rows and "4" columns
        And user selects "Center table" from "Alignment" dropdown for 2 table
        And user toggles Header Row for 2 table
        And browser waits
        And user types "header" in all headers of table 1
        And user types "cell" in all cells of table 1

        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Table with first column headers - right aligned" as 3 body section heading
        And user clicks "table" button 3 in the WYSIWYG editor
        And user selects "4" rows and "4" columns
        And user selects "Align table to the right" from "Alignment" dropdown for 3 table
        And user toggles Header Column for 3 table
        And browser waits
        And user types "header" in all headers of table 2
        And user types "cell" in all cells of table 2

        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Table with both headers - not aligned" as 4 body section heading
        And user clicks "table" button 4 in the WYSIWYG editor
        And user selects "4" rows and "4" columns
        And user toggles Header Row for 4 table
        And user toggles Header Column for 4 table
        And browser waits
        And user types "header" in all headers of table 3
        And user types "cell" in all cells of table 3
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar

    Scenario: Verify tables on FF
        Given user is navigating to the front end site with path site section plus "article-to-test-table"
        And page title is "Article to test Table"
        And the following tables are displayed
            | index | rowCount | columnCount | headerCount | caption       | alignment |
            | 0     | 4        | 4           | 0           | Table Caption | left      |
            | 1     | 4        | 4           | 4           | null          | null      |
            | 2     | 4        | 4           | 4           | null          | right     |
            | 3     | 4        | 4           | 7           | null          | null      |
        And table at position 0 has 0 headers
        And the rest of the tables have the following table contents
            | index | row                                      |
            | 1     | header\|header,cell\|cell,cell\|cell     |
            | 2     | header\|cell,header\|cell,header\|cell   |
            | 3     | header\|header,header\|cell,header\|cell |

    Scenario: Clean up
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "article-to-test-table" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action