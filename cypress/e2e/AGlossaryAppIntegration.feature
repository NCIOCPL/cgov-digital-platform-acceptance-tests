Feature: Glossary app is integrated withing CGOV platform



    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Cancer terms.
       Given screen breakpoint is set to "desktop"
        Given user is navigating to "/publications/dictionaries/cancer-terms"
        Then page displays left navigation
        And page title is "NCI Dictionary of Cancer Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to '\\"/syndication/widgets\\"'
             
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

        Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Cancer terms on mobile or tablet breakpoint.
       Given screen breakpoint is set to "tablet"
        Given user is navigating to "/publications/dictionaries/cancer-terms"
        Then page does not display left navigation
        And page title is "NCI Dictionary of Cancer Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to '\\"/syndication/widgets\\"'
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"


    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Spanish dictionary.
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/espanol/publicaciones/diccionarios/diccionario-cancer"
        And page displays left navigation
        And page title is "Diccionario de cáncer"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to '\\"/espanol/sindicacion/widgets\\"'
                                                              
        Then search options for "Empieza con" and "Contiene" are displayed
        And "empieza con" is selected by default
        And search bar is displayed below introductory text
        And "Buscar" is displayed as the submit button
        Then "Navegar por letra inicial:" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

        Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Spanish dictionary on tablet breakpoint.
        Given screen breakpoint is set to "tablet"
        Given user is navigating to "/espanol/publicaciones/diccionarios/diccionario-cancer"
        And page does not display left navigation
        And page title is "Diccionario de cáncer"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to '\\"/espanol/sindicacion/widgets\\"'
                                                              
        Then search options for "Empieza con" and "Contiene" are displayed
        And "empieza con" is selected by default
        And search bar is displayed below introductory text
        And "Buscar" is displayed as the submit button
        Then "Navegar por letra inicial:" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"


    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Genetics terms.
        Given screen breakpoint is set to "mobile"
        Given user is navigating to "/publications/dictionaries/genetics-dictionary"
        And page title is "NCI Dictionary of Genetics Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

        Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Genetics terms on tablet breakpoint.
        Given screen breakpoint is set to "tablet"
        Given user is navigating to "/publications/dictionaries/genetics-dictionary"
        Then page does not display left navigation
        And page title is "NCI Dictionary of Genetics Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"


     Scenario: Negative test - user enters a bogus URL (like /chicken at the end of the dictionary URL
           Given screen breakpoint is set to "mobile"
            When user is navigating to bad url "/publications/dictionaries/cancer-terms/def/chicken"
            Then status code is 404 on "https://webapis.cancer.gov/glossary/v1/Terms/Cancer.gov/Patient/en/chicken"
            And error page title is "Page Not Found"

    Scenario Outline: 404 handling with pre-render
        When user is navigating to bad url "<url>"
        Then status code is 404 on "<api>"
        And the page contains meta tags with the following names
            | name                  | content |
            | prerender-status-code | 404     |
        Examples:
            | url                                                                  | api                                                                                 |
            | /publications/dictionaries/cancer-terms/def/chicken                  | https://webapis.cancer.gov/glossary/v1/Terms/Cancer.gov/Patient/en/chicken          |
            | /espanol/publicaciones/diccionarios/diccionario-cancer/def/chicken   | https://webapis.cancer.gov/glossary/v1/Terms/Cancer.gov/Patient/es/chicken          |
            | /espanol/publicaciones/diccionarios/diccionario-genetica/def/chicken | https://webapis.cancer.gov/glossary/v1/Terms/Genetics/HealthProfessional/es/chicken |
            | /publications/dictionaries/genetics-dictionary/def/chicken           | https://webapis.cancer.gov/glossary/v1/Terms/Genetics/HealthProfessional/en/chicken |

    Scenario Outline: redirect handling with pre-render
        When user is navigating to "<url>"
        And the page contains meta tags with the following names
            | name                  | content           |
            | prerender-status-code | 301               |
            | prerender-header      | <prerenderHeader> |
        Examples:
            | url                                                                | prerenderHeader                                                                                                               |
            | /publications/dictionaries/cancer-terms/def/44058                  | Location: {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-terms/def/metastatic                                 |
            | /espanol/publicaciones/diccionarios/diccionario-cancer/def/46722   | Location: {PROTOCOL}://{CANONICAL_HOST}/espanol/publicaciones/diccionarios/diccionario-cancer/def/a33                         |
            | /espanol/publicaciones/diccionarios/diccionario-genetica/def/44393 | Location: {PROTOCOL}://{CANONICAL_HOST}/espanol/publicaciones/diccionarios/diccionario-genetica/def/acido-desoxirribonucleico |
            | /publications/dictionaries/genetics-dictionary/def/44393           | Location: {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/genetics-dictionary/def/deoxyribonucleic-acid               |

    Scenario: When user uses Autosuggest, selects a term from autosuggest and search -  analytics events are fired
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/publications/dictionaries/cancer-terms/expand/a"
        Given analytics storage is cleared
        When user types "cancer" in the search box
        And browser waits for 500
        And user selects "cancer" from the autosuggest dropdown
        And browser waits for 500
        And user clicks Search button
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                        |
            | prop4     | D=pev1                                                                       |
            | prop8     | english                                                                      |
            | prop11    | D=v11                                                                        |
            | prop23    | D=v23                                                                        |
            | prop67    | D=pageName                                                                   |
            | prop68    | D=v68                                                                        |
            | evar1     | {CANONICAL_HOST}/publications/dictionaries/cancer-terms/expand/a             |   
            | evar2     | D=c8                                                                         |
            | evar11    | Glossary Search Box                                                          |
            | evar23    | Selected\|10\|1\|6\|cancer\|cancer                                           |
            | evar91    | starts with\|cancer\|undefined                                               |   
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-terms/expand/a|                                              
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-terms/expand/a             |
            | pev2      | GlossaryApp:SearchBox:Submit                                                 |
 
    Scenario: When user uses Autosuggest, modifies the suggestion and search -  analytics events are fired
        Given screen breakpoint is set to "desktop"
        And user is navigating to "/publications/dictionaries/cancer-terms/search/breast%20cancer/?searchMode=Begins"
        Given analytics storage is cleared
        When user types "lung cancer" in the search box
        And browser waits for 500
        And user selects "lung cancer" from the autosuggest dropdown
        And browser waits for 1000
        And user hits enter key
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                                                                                                |
            | prop4     | D=pev1                                                                                                                               |
            | prop8     | english                                                                                                                              |
            | prop11    | D=v11                                                                                                                                |
            | prop23    | D=v23                                                                                                                                |
            | prop67    | D=pageName                                                                                                                           |
            | prop68    | D=v68                                                                                                                                |
            | evar1     | {CANONICAL_HOST}/publications/dictionaries/cancer-terms/search/breast%20cancer                                                       |
            | evar2     | D=c8                                                                                                                                 |
            | evar11    | Glossary Search Box                                                                                                                  |
            | evar23    | Selected\|1\|1\|11\|lung cancer\|lung cancer                                                                                         |
            | evar91    | starts with\|lung cancer\|breast cancer                                                                                              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/publications/dictionaries/cancer-terms/search/breast%20cancer/?searchMode=Begins                       |                                              
            | pageName  | {CANONICAL_HOST}/publications/dictionaries/cancer-terms/search/breast cancer                                                         |
            | pev2      | GlossaryApp:SearchBox:Submit                                                                                                         |