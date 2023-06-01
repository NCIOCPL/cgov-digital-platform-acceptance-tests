Feature: As a content owner I want to be able to upload different file types to link to from any pages

    Scenario: Creating new media File items
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value         | field_name          |
            | Pretty URL    | test-file-pdf | field_pretty_url    |
            | Name          | Test File PDF | name[0][value]      |
            | Browser Title | Test File PDF | field_browser_title |
        And user uploads test file "pdf-file.pdf"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value         | field_name          |
            | Pretty URL    | test-file-csv | field_pretty_url    |
            | Name          | Test File CSV | name[0][value]      |
            | Browser Title | Test File CSV | field_browser_title |
        And user uploads test file "csv-file.csv"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value          | field_name          |
            | Pretty URL    | test-file-pptx | field_pretty_url    |
            | Name          | Test File PPTX | name[0][value]      |
            | Browser Title | Test File PPTX | field_browser_title |
        And user uploads test file "pptx-file.pptx"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value         | field_name          |
            | Pretty URL    | test-file-ppt | field_pretty_url    |
            | Name          | Test File PPT | name[0][value]      |
            | Browser Title | Test File PPT | field_browser_title |
        And user uploads test file "ppt-file.ppt"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value          | field_name          |
            | Pretty URL    | test-file-xlsx | field_pretty_url    |
            | Name          | Test File XLSX | name[0][value]      |
            | Browser Title | Test File XLSX | field_browser_title |
        And user uploads test file "xlsx-file.xlsx"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value         | field_name          |
            | Pretty URL    | test-file-xls | field_pretty_url    |
            | Name          | Test File XLS | name[0][value]      |
            | Browser Title | Test File XLS | field_browser_title |
        And user uploads test file "xls-file.xls"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value          | field_name          |
            | Pretty URL    | test-file-docx | field_pretty_url    |
            | Name          | Test File DOCX | name[0][value]      |
            | Browser Title | Test File DOCX | field_browser_title |
        And user uploads test file "docx-file.docx"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page
        And user clicks on "Media" sub tab
        And user clicks on "Add media" action button
        And user clicks on "File" content type
        Then page title is "Add File"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel    | value         | field_name          |
            | Pretty URL    | test-file-doc | field_pretty_url    |
            | Name          | Test File DOC | name[0][value]      |
            | Browser Title | Test File DOC | field_browser_title |
        And user uploads test file "doc-file.doc"
        And system waits for file upload process
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Translate newly created files
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        Then user selects "Translate" option from Operations dropdown for media with title "Test File PDF"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File PDF"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File PDF"
        When user clicks on "Edit" button to edit translation of "Test File PDF_Spanish"
        Then page title is "Test File PDF_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File CSV"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File CSV"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File CSV"
        When user clicks on "Edit" button to edit translation of "Test File CSV_Spanish"
        Then page title is "Test File CSV_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File PPTX"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File PPTX"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File PPTX"
        When user clicks on "Edit" button to edit translation of "Test File PPTX_Spanish"
        Then page title is "Test File PPTX_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File PPT"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File PPT"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File PPT"
        When user clicks on "Edit" button to edit translation of "Test File PPT_Spanish"
        Then page title is "Test File PPT_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File XLSX"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File XLSX"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File XLSX"
        When user clicks on "Edit" button to edit translation of "Test File XLSX_Spanish"
        Then page title is "Test File XLSX_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File XLS"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File XLS"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File XLS"
        When user clicks on "Edit" button to edit translation of "Test File XLS_Spanish"
        Then page title is "Test File XLS_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File DOCX"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File DOCX"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File DOCX"
        When user clicks on "Edit" button to edit translation of "Test File DOCX_Spanish"
        Then page title is "Test File DOCX_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

        Then user selects "Traducir" option from Operations dropdown for media with title "Test File DOC"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Test File DOC"
        And user fills out the following fields
            | fieldLabel | value    | field_name     |
            | Nombre     | _Spanish | name[0][value] |
        And user selects "Review" from Change to dropdown
        Then user saves the content page
        Then user selects "Traducir" option from Operations dropdown for media with title "Test File DOC"
        When user clicks on "Edit" button to edit translation of "Test File DOC_Spanish"
        Then page title is "Test File DOC_Spanish [Español traducción]"
        And user selects "Publicado" from Change to dropdown
        Then user saves the content page

    Scenario: Creating Article and List to test files
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Article" content type
        Then page title is "Create Article"
        When user selects test site section
        And user fills out the following fields
            | fieldLabel       | value                                    | field_name             |
            | Pretty URL       | article-to-test-files                    | field_pretty_url       |
            | Page Title       | Article to test Files                    | title[0][value]        |
            | Browser Title    | Article to test Files                    | field_browser_title    |
            | Meta Description | Article to test Files - Meta Description | field_page_description |
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PDF" into media title search box and clicks "Apply"
        And user selects "Test File PDF" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File CSV" into media title search box and clicks "Apply"
        And user selects "Test File CSV" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PPTX" into media title search box and clicks "Apply"
        And user selects "Test File PPTX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PPT" into media title search box and clicks "Apply"
        And user selects "Test File PPT" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File XLSX" into media title search box and clicks "Apply"
        And user selects "Test File XLSX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File XLS" into media title search box and clicks "Apply"
        And user selects "Test File XLS" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File DOCX" into media title search box and clicks "Apply"
        And user selects "Test File DOCX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File DOC" into media title search box and clicks "Apply"
        And user selects "Test File DOC" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Create a managed list to hold files
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Add content" action button
        And user clicks on "Cancer Research List Page" content type
        Then page title is "Create Cancer Research List Page"
        And user fills out the following fields
            | fieldLabel       | value                                                       | field_name             |
            | Page Title       | Cancer Research List Page to Test Files                     | title                  |
            | Browser Title    | Cancer Research List Page to Test Files                     | field_browser_title    |
            | Meta Description | Automated Test Cancer Research List Page - Meta Description | field_page_description |
        When user selects test site section
        And user fills out the following fields
            | fieldLabel | value          | field_name       |
            | Pretty URL | crlp-for-files | field_pretty_url |
        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And browser waits
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PDF" into media title search box and clicks "Apply"
        And user selects "Test File PDF" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File CSV" into media title search box and clicks "Apply"
        And user selects "Test File CSV" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PPTX" into media title search box and clicks "Apply"
        And user selects "Test File PPTX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File PPT" into media title search box and clicks "Apply"
        And user selects "Test File PPT" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File XLSX" into media title search box and clicks "Apply"
        And user selects "Test File XLSX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File XLS" into media title search box and clicks "Apply"
        And user selects "Test File XLS" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File DOCX" into media title search box and clicks "Apply"
        And user selects "Test File DOCX" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits

        And user clicks on dropdown button toggle to view all Related Resources types
        And user selects "Add Media Link" related resource item
        And user clicks on "Link" button to link to a media
        And user clicks on "Select media" to choose a resource to link
        And user enters "Test File DOC" into media title search box and clicks "Apply"
        And user selects "Test File DOC" item from the media list
        And browser waits
        And user clicks on "Select media" button to select media
        And browser waits
        And user selects "Published" from "Save as" dropdown
        Then user saves the content page

    Scenario: Verify files are displayed on the front end
        Given user is navigating to the front end site with path site section plus "article-to-test-files"
        Then page title is "Article to test Files"
        Then Related Resources section contains the following links
            | title          | link                               |
            | Test File PDF  | {TEST_SITE_SECTION}/test-file-pdf  |
            | Test File CSV  | {TEST_SITE_SECTION}/test-file-csv  |
            | Test File PPTX | {TEST_SITE_SECTION}/test-file-pptx |
            | Test File PPT  | {TEST_SITE_SECTION}/test-file-ppt  |
            | Test File XLSX | {TEST_SITE_SECTION}/test-file-xlsx |
            | Test File XLS  | {TEST_SITE_SECTION}/test-file-xls  |
            | Test File DOCX | {TEST_SITE_SECTION}/test-file-docx |
            | Test File DOC  | {TEST_SITE_SECTION}/test-file-doc  |
        And each file has a file type in the Related Resources section displayed as follows
            | link                               | fileType |
            | {TEST_SITE_SECTION}/test-file-pdf  | pdf      |
            | {TEST_SITE_SECTION}/test-file-csv  | csv      |
            | {TEST_SITE_SECTION}/test-file-pptx | ppt      |
            | {TEST_SITE_SECTION}/test-file-ppt  | ppt      |
            | {TEST_SITE_SECTION}/test-file-xlsx | excel    |
            | {TEST_SITE_SECTION}/test-file-xls  | excel    |
            | {TEST_SITE_SECTION}/test-file-docx | word     |
            | {TEST_SITE_SECTION}/test-file-doc  | word     |
        Given user is navigating to the front end site with path site section plus "crlp-for-files"
        Then page title is "Cancer Research List Page to Test Files"
        Then Selected Research pages list contains the following links
            | title          | link                               |
            | Test File PDF  | {TEST_SITE_SECTION}/test-file-pdf  |
            | Test File CSV  | {TEST_SITE_SECTION}/test-file-csv  |
            | Test File PPTX | {TEST_SITE_SECTION}/test-file-pptx |
            | Test File PPT  | {TEST_SITE_SECTION}/test-file-ppt  |
            | Test File XLSX | {TEST_SITE_SECTION}/test-file-xlsx |
            | Test File XLS  | {TEST_SITE_SECTION}/test-file-xls  |
            | Test File DOCX | {TEST_SITE_SECTION}/test-file-docx |
            | Test File DOC  | {TEST_SITE_SECTION}/test-file-doc  |
        And each file has a file type in the section displayed as follows
            | title          | fileType |
            | Test File PDF  | pdf      |
            | Test File CSV  | csv      |
            | Test File PPTX | ppt      |
            | Test File PPT  | ppt      |
            | Test File XLSX | excel    |
            | Test File XLS  | excel    |
            | Test File DOCX | word     |
            | Test File DOC  | word     |
        And each file has a size class

    Scenario: Translate test pages
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        Then user selects "Translate" option from Operations dropdown for content with title "Article to test Files"
        Then page title is "Translations of Article to test Files"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Article to test Files"
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Quick Publish" from workflow actions

        When user clicks on "Contenido" tab
        Then user selects "Traducir" option from Operations dropdown for content with title "Cancer Research List Page to Test Files"
        Then page title is "Translations of Cancer Research List Page to Test Files"
        When user clicks on "Add" button to add translation
        Then page title is "Crear traducción Español de Cancer Research List Page to Test Files"
        Then user saves the content page
        And user clicks on the tool bar status button "Borrador"
        And user selects "Quick Publish" from workflow actions

    Scenario: Verify translated pages
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "article-to-test-files"
        Then page title is "Article to test Files"
        Then Related Resources section contains the following links
            | title                  | link                                       |
            | Test File PDF_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-pdf  |
            | Test File CSV_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-csv  |
            | Test File PPTX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-pptx |
            | Test File PPT_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-ppt  |
            | Test File XLSX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-xlsx |
            | Test File XLS_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-xls  |
            | Test File DOCX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-docx |
            | Test File DOC_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-doc  |
        And each file has a file type in the Related Resources section displayed as follows
            | link                                       | fileType |
            | /espanol{TEST_SITE_SECTION}/test-file-pdf  | pdf      |
            | /espanol{TEST_SITE_SECTION}/test-file-csv  | csv      |
            | /espanol{TEST_SITE_SECTION}/test-file-pptx | ppt      |
            | /espanol{TEST_SITE_SECTION}/test-file-ppt  | ppt      |
            | /espanol{TEST_SITE_SECTION}/test-file-xlsx | excel    |
            | /espanol{TEST_SITE_SECTION}/test-file-xls  | excel    |
            | /espanol{TEST_SITE_SECTION}/test-file-docx | word     |
            | /espanol{TEST_SITE_SECTION}/test-file-doc  | word     |
        Given user is navigating to the front end site with spanish path "/espanol" site section plus "crlp-for-files"
        Then page title is "Cancer Research List Page to Test Files"
        Then Selected Research pages list contains the following links
            | title                  | link                                       |
            | Test File PDF_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-pdf  |
            | Test File CSV_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-csv  |
            | Test File PPTX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-pptx |
            | Test File PPT_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-ppt  |
            | Test File XLSX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-xlsx |
            | Test File XLS_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-xls  |
            | Test File DOCX_Spanish | /espanol{TEST_SITE_SECTION}/test-file-docx |
            | Test File DOC_Spanish  | /espanol{TEST_SITE_SECTION}/test-file-doc  |
        And each file has a file type in the section displayed as follows
            | title                  | fileType |
            | Test File PDF_Spanish  | pdf      |
            | Test File CSV_Spanish  | csv      |
            | Test File PPTX_Spanish | ppt      |
            | Test File PPT_Spanish  | ppt      |
            | Test File XLSX_Spanish | excel    |
            | Test File XLS_Spanish  | excel    |
            | Test File DOCX_Spanish | word     |
            | Test File DOC_Spanish  | word     |
        And each file has a size class

    Scenario: Clean up related resources and mini landing page test content
        Given user is navigating to "/user/login"
        When user enters credentials
        And user clicks "Log in" button
        Then user is logged in and the user name "admin" is displayed in the toolbar
        And the tool bar appears at the top
        When user clicks on "Content" tab
        And user clicks on "Media" sub tab
        And user selects a checkbox next to title with url "test-file-pdf" from the list of content
        And user selects a checkbox next to title with url "test-file-csv" from the list of content
        And user selects a checkbox next to title with url "test-file-pptx" from the list of content
        And user selects a checkbox next to title with url "test-file-ppt" from the list of content
        And user selects a checkbox next to title with url "test-file-xlsx" from the list of content
        And user selects a checkbox next to title with url "test-file-xls" from the list of content
        And user selects a checkbox next to title with url "test-file-docx" from the list of content
        And user selects a checkbox next to title with url "test-file-doc" from the list of content
        And user clicks on "Apply to selected items" content action button
        Then page title is "Are you sure you want to delete these media items?"
        When user clicks on "Delete" button
        Then the confirmation text "Deleted 16 items" appears on a screen