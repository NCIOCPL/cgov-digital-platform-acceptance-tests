Feature: As a cms user I want to be able to embed Featured contents in Article content type

    Scenario: User is adding new test Article content type for embedding it as a Featured Content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                                               | field_name             |
            | Pretty URL       | test-article-for-testing                                            | field_pretty_url       |
            | Page Title       | Automated Test Article for Featured Content Test                    | title                  |
            | Browser Title    | Automated Test Article for Featured Content Test - Browser Title    | field_browser_title    |
            | Card Title       | Automated Test Article for Featured Content Test - Card Title       | field_card_title       |
            | Meta Description | Automated Test Article for Featured Content Test - Meta Description | field_page_description |
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "This article will be used for testing Featured Content"
        And browser waits
        And user selects "Automated Test Image" Promotional Image from the list of images for featured content article
        And browser waits
        And user remembers the source of selected promo image for further verification in the featured content article
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar


    Scenario: User is adding new test Blog post content type for embedding it as a Featured Content
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "editor"
        And user clicks "Log in" button
        Then user is logged in and the user name "editor" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Blog Post" content type
        Then page title is "Create Blog Post"
        And user selects "Cancer Currents" from Blog Series dropdown
        And browser waits
        And user fills out the following fields
            | fieldLabel               | value                                                                  | field_name                     |
            | Pretty URL               | blog-post-for-testing                                                  | field_pretty_url               |
            | Page Title               | Automated Test Blog Post for Featured Content Test                     | title                          |
            | Browser Title            | Automated Test Blog Post for Featured Content Test - Browser Title     | field_browser_title            |
            | Meta Description         | Automated Test Blog Post for Featured Content Test - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Blog Post for Featured Content Test - Feature Card Desc | field_feature_card_description |
            | Author                   | Automated Test Blog Post for Featured Content Test Author              | field_author                   |
        And user fills out "Body" text area with "This blog post will be used for testing featured content"
        And user selects "Automated Test Image" Lead Image from the list of images
        And browser waits
        And user remembers the source of selected lead image for further verification in the featured content blog post
        And browser waits
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar


    Scenario: User is adding new Article content type and embedding featured contents created above
        Given user is navigating to "/user/login?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel               | value                                                               | field_name                     |
            | Pretty URL               | test-article-featured-content                                       | field_pretty_url               |
            | Page Title               | Automated Test Article to test Featured Content                     | title                          |
            | Browser Title            | Automated Test Article to test Featured Content - Browser Title     | field_browser_title            |
            | Card Title               | Automated Test Article to test Featured Content - Card Title        | field_card_title               |
            | Meta Description         | Automated Test Article to test Featured Content - Meta Description  | field_page_description         |
            | Feature Card Description | Automated Test Article to test Featured Content - Feature Card Desc | field_feature_card_description |
        And user enters "Article List Description" into "List Description" text field
        And user enters "Article Intro Text" as intro text
        And user enters "Article Heading1" as 1 body section heading
        And user fills out 1 "Body" text area with "Embedding Featured Content: Article Feature Card: Image None"
        And user clicks "Featured Content" button 1 in the WYSIWYG editor
        And user enters "Automated Test Article for Featured Content Test" into content title search box and clicks "Apply"
        And user selects "Automated Test Article for Featured Content Test" item from the content list
        And browser waits
        And user clicks on "Select content" button to select content
        And browser waits
        And "Display as" dropdown has the following options
            | options                |
            | Feature Card: Image    |
            | Feature Card: No Image |
        And "Display as" dropdown displays "Feature Card: Image"
        And "Align" label has the following options
            | options |
            | None    |
            | Left    |
            | Center  |
            | Right   |
        And the radio button "None" is selected by default under "Align"
        And user clicks on "Embed" button to select featured content
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading2" as 2 body section heading
        And user fills out 2 "Body" text area with "Embedding Featured Content: Article Feature Card: No Image Left"
        And user clicks "Featured Content" button 2 in the WYSIWYG editor
        And user enters "Automated Test Article for Featured Content Test" into content title search box and clicks "Apply"
        And user selects "Automated Test Article for Featured Content Test" item from the content list
        And browser waits
        And user clicks on "Select content" button to select content
        And user select "Feature Card: No Image" from the "Display as" dropdown
        And browser waits
        And user selects "left" radio button under "Align"
        And user clicks on "Embed" button to select featured content
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading3" as 3 body section heading
        And user fills out 3 "Body" text area with "Embedding Featured Content: Blog Post Feature Card: Image Center"
        And user clicks "Featured Content" button 3 in the WYSIWYG editor
        And user enters "Automated Test Blog Post for Featured Content Test" into content title search box and clicks "Apply"
        And user selects "Automated Test Blog Post for Featured Content Test" item from the content list
        And browser waits
        And user clicks on "Select content" button to select content
        And user select "Feature Card: Image" from the "Display as" dropdown
        And browser waits
        And user selects "center" radio button under "Align"
        And user clicks on "Embed" button to select featured content
        And browser waits
        And user clicks on "Add Body Section" to add a body section
        And browser waits
        And user enters "Article Heading4" as 4 body section heading
        And user fills out 4 "Body" text area with "Embedding Featured Content: Blog Post Feature Card: No Image Right"
        And user clicks "Featured Content" button 4 in the WYSIWYG editor
        And user enters "Automated Test Blog Post for Featured Content Test" into content title search box and clicks "Apply"
        And user selects "Automated Test Blog Post for Featured Content Test" item from the content list
        And browser waits
        And user clicks on "Select content" button to select content
        And user select "Feature Card: No Image" from the "Display as" dropdown
        And browser waits
        And user selects "right" radio button under "Align"
        And user clicks on "Embed" button to select featured content
        And browser waits
        And user selects "Review" from "Save as" dropdown
        Then user saves the content page
        And user clicks on the tool bar status button "Review"
        And user clicks "Publish" button from Moderation sidebar


    Scenario: Verify embedded Featured Contents at the front end in the English Article
        Given user is navigating to the front end site with path site section plus "test-article-featured-content"
        And browser waits
        And page title is "Automated Test Article to test Featured Content"
        And the intro text reads "Article Intro Text"
        And 1 section heading reads "Article Heading1"
        And 1 description reads "Embedding Featured Content: Article Feature Card: Image None"
        And 1 feature card displays the following features
            | alignment       | title                                                         | link                                         |
            | embedded-entity | Automated Test Article for Featured Content Test - Card Title | {TEST_SITE_SECTION}/test-article-for-testing |
        And the promo image is matching the earlier selected promo image in the article to be used for embeddding
        And 2 section heading reads "Article Heading2"
        And 2 description reads "Embedding Featured Content: Article Feature Card: No Image Left"
        And 2 feature card displays the following features
            | alignment  | title                                                         | link                                         |
            | align-left | Automated Test Article for Featured Content Test - Card Title | {TEST_SITE_SECTION}/test-article-for-testing |
        And 2 feature card does not display any image
        And 3 section heading reads "Article Heading3"
        And 3 description reads "Embedding Featured Content: Blog Post Feature Card: Image Center"
        And 3 feature card displays the following
            | alignment    | title                                                              | link                                                          | description                                                            |
            | align-center | Automated Test Blog Post for Featured Content Test - Browser Title | news-events/cancer-currents-blog/{YEAR}/blog-post-for-testing | Automated Test Blog Post for Featured Content Test - Feature Card Desc |
        And the lead image is matching the earlier selected lead image in the blog post to be used for embeddding
        And 4 section heading reads "Article Heading4"
        And 4 description reads "Embedding Featured Content: Blog Post Feature Card: No Image Right"
        And 4 feature card displays the following
            | alignment   | title                                                              | link                                                          | description                                                            |
            | align-right | Automated Test Blog Post for Featured Content Test - Browser Title | news-events/cancer-currents-blog/{YEAR}/blog-post-for-testing | Automated Test Blog Post for Featured Content Test - Feature Card Desc |
        And 4 feature card does not display any image

    Scenario: Clean up
        Given user is navigating to "/user/siteadmin?show_login_fields=true"
        When user enters credentials of "siteadmin"
        And user clicks "Log in" button
        Then user is logged in and the user name "siteadmin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on title with url "test-article-for-testing" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action

        When user clicks on "Content" tab
        And user clicks on blog with url "blog-post-for-testing" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action

        When user clicks on "Content" tab
        And user clicks on title with url "test-article-featured-content" from the list of content
        And user clicks on the tool bar status button "Published"
        And user clicks "Request Archive" button from Moderation sidebar
        And user clicks on the tool bar status button "Archive Requested"
        And user clicks "Approve Archive Request" button from Moderation sidebar
        And user clicks on the tool bar status button "Archived"
        And user clicks "View in edit form" button from other actions
        When user clicks on "Delete" option button
        When user confirms "Delete" action
        And the content item with url "test-article-for-testing" does not exist in the list of content
        And the content item with url "blog-post-for-testing" does not exist in the list of content
        And the content item with url "test-article-featured-content" does not exist in the list of content