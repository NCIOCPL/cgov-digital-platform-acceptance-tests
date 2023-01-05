Feature: As a cms user I want to be able to create Blog Series content type to promote Blog Series.

    Scenario: User is adding new Blog Series content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Series" content type
        Then page title is "Create Blog Series"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel                 | value                                             | field_name                       |
            | Page Title                 | Automated Test Blog Series                        | title                            |
            | Pretty URL                 | blog-series                                       | field_pretty_url                 |
            | Browser Title              | Automated Test Blog Series - Browser Title        | field_browser_title              |
            | Card Title                 | Automated Test Blog Series - Card Title           | field_card_title                 |
            | Meta Description           | Automated Blog Series Meta Description            | field_page_description           |
            | Feature Card Description   | Automated Test Blog Series - Feature Card Desc    | field_feature_card_description   |
            | Blog Series Shortname      | TestBlogSeries                                    | field_blog_series_shortname      |
            | Subscription URL           | https://feedburner-test.cancer.gov/testblogseries | field_feedburner_url             |
            | Recommended Content Header | Recommended Text                                  | field_recommended_content_header |
        And browser waits
        And user uploads test file "heroimagenewsdesktop.jpg"
        And system waits for file upload process
        And user enters "Text Alt" into the "Alternative text" text field
        And user enters "Blog Series List Description" into "List Description" text field
        And user fills out "About Blog" text area with "This is all about Blog Series." in the blog series
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify newly created content blog series
        Given user is navigating to the front end site with path site section plus "blog-series"
        And the banner image is displayed
        Then page title is "Automated Test Blog Series"
        And blog series description reads "This is all about Blog Series"
        And the "Subscribe" link appears with url "https://feedburner-test.cancer.gov/testblogseries"
        And the "Archive" accordion is displayed
        And blog posts list does not appear in the archive
        And the page contains meta tags with the following names
            | name        | content                                |
            | description | Automated Blog Series Meta Description |

    Scenario: User is adding new blog post content type without any image so it can be added to blog series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Automated Test Blog Series" from Blog Series dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel | value                      | field_name       |
            | Pretty URL | blog-post-test-blog-series | field_pretty_url |
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                            | field_name                     |
            | Page Title               | Automated Test Blog Post for testing Blog Series | title                          |
            | Browser Title            | Automated Test Blog Post - Browser Title         | field_browser_title            |
            | Card Title               | Automated Test Blog Post - Card Title            | field_card_title               |
            | Meta Description         | Automated Blog Post Meta Description             | field_page_description         |
            | Feature Card Description | Automated Test Blog Post - Feature Card Desc     | field_feature_card_description |
            | Author                   | Automated Test Blog Post Author                  | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Edit and republish blog series content type
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "blog-series" from the list of content
        And user clicks on the tool bar status green button "Published"
        And user clicks "View in edit form" button from other actions
        And user clears out "Pretty URL" field
        And user clears out "Page Title" field
        And user clears out "Meta Description" field
        And user fills out the following fields
            | fieldLabel       | value                                              | field_name             |
            | Pretty URL       | blog-series-edited                                 | field_pretty_url       |
            | Page Title       | Automated Test Blog Series Edited                  | title                  |
            | Meta Description | Automated Test Blog Series Meta Description Edited | field_page_description |
        And user clicks on dropdown button toggle to view Featured Posts
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user clicks on "Select entities" button to link to the Featured Post
        Then "Select entities" section appears
        And user selects "Automated Test Blog Post for testing Blog Series" item from the list
        And user clicks on "Add Blog content" button to select item
        And browser waits
        And user selects 1 Promotional Image from the list of images for blog series
        And user remembers the source of selected promo image for blog series for further verification
        And user selects "Do Not Display" from "Public Use Text" dropdown
        When user saves the content page
        And user clicks on the tool bar status green button "Editing"
        And user selects "Quick Publish" from workflow actions

    Scenario: User is adding new blog post content type with images so it can be added to blog series
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Automated Test Blog Series Edited" from "Blog Series" dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                             | field_name                     |
            | Pretty URL               | blog-post2-test-blog-series                       | field_pretty_url               |
            | Page Title               | Automated Test Blog Post2 for testing Blog Series | title                          |
            | Browser Title            | Automated Test Blog Post2 - Browser Title         | field_browser_title            |
            | Card Title               | Automated Test Blog Post2 - Card Title            | field_card_title               |
            | Meta Description         | Automated Blog Post2 Meta Description             | field_page_description         |
            | Feature Card Description | Automated Test Blog Post2 - Feature Card Desc     | field_feature_card_description |
            | Author                   | Automated Test Blog Post2 Author                  | field_author                   |
        And user enters "Blog Post List Description" into "List Description" text field
        And user enters "Blog Post Intro Text" as intro text
        And user fills out "Body" text area with "This is a description of Blog Post content type."
        And user selects 1 Lead Image from the list of images for blog series
        And browser waits
        And user remembers the source of selected lead image for blog series for further verification
        And user selects 2 Promotional Image from the list of images for blog series
        And browser waits
        And user remembers the source of selected promo image for blog series for further verification
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify edited content in the blog series
        Given user is navigating to the front end site with path site section plus "blog-series-edited"
        Then page title is "Automated Test Blog Series Edited"
        And the "Featured Posts" managed list appears
        And public use text is not displayed
        And the Featured Posts section is displayed with the following cards
            | title                                 | linkEnding | expectedDate | author                          |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
            | Automated Test Blog Post - Card Title | /blog-post | today's date | Automated Test Blog Post Author |
        And the page contains meta tags with the following names
            | name        | content                                            |
            | description | Automated Test Blog Series Meta Description Edited |
        Then list of blog post has the following posts
            | title                                             | url                                                                                         | expectedDate | author                           |
            | Automated Test Blog Post for testing Blog Series  | {TEST_SITE_SECTION}/blog-series-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM}         | today's date | Automated Test Blog Post Author  |
            | Automated Test Blog Post2 for testing Blog Series | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post2-test-blog-series-{RANDOM} | today's date | Automated Test Blog Post2 Author |
        And the promotional image is matching the earlier selected image
        And the Continue Reading link appears with the following href
            | linkName           | linkHref                                                                                    |
            | Continue Reading > | {TEST_SITE_SECTION}/blog-series-{RANDOM}/{YEAR}/blog-post-test-blog-series-{RANDOM}         |
            | Continue Reading > | {TEST_SITE_SECTION}/blog-series-edited-{RANDOM}/{YEAR}/blog-post2-test-blog-series-{RANDOM} |

    Scenario: Clean up
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user selects a checkbox next to title "Automated Test Blog Series Edited" with url "blog-series-edited" from the list of content
        And user selects a checkbox next to title "Automated Test Blog Post for testing Blog Series" with url "blog-post-test-blog-series" from the list of content
        And user selects a checkbox next to title "Automated Test Blog Post2 for testing Blog Series" with url "blog-post2-test-blog-series" from the list of content
        And user clicks on the "Apply to selected items" action button
        Then page title is "Are you sure you want to delete these content items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 3 content items." appears on a screen
        And the content item with url "blog-series-edited" does not exist in the list of content
        And the content item with url "blog-post-test-blog-series" does not exist in the list of content
        And the content item with url "blog-post2-test-blog-series" does not exist in the list of content