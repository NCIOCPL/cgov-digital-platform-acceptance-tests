Feature: Glossary app is integrated withing CGOV platform


    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Cancer terms.
        Given user is navigating to "/publications/dictionaries/cancer-terms"
        Then page displays left navigation
        And page title is "NCI Dictionary of Cancer Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to "/syndication/widgets"
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Spanish dictionary.
        Given user is navigating to "/espanol/publicaciones/diccionario"
        And page displays left navigation
        And page title is "Diccionario de cáncer"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And NCI's Dictionary of Cancer Terms Widget links to "/espanol/sindicacion/widgets"
        Then search options for "Empieza con" and "Contiene" are displayed
        And "empieza con" is selected by default
        And search bar is displayed below introductory text
        And "Buscar" is displayed as the submit button
        Then "Ojear" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

    Scenario: User is able to access a default (or “landing”) page that displays all of the expected Dictionary elements for the Dictionary of Genetics terms.
        Given user is navigating to "/publications/dictionaries/genetics-dictionary"
        Then page displays left navigation
        And page title is "NCI Dictionary of Genetics Terms"
        And the introductory text appears
        And the number of glossary terms appears in the text
        And "PDQ® Cancer Genetics Editorial Board" links to "/publications/pdq/editorial-boards/genetics"
        And " PDQ cancer genetics information summaries" links to "/publications/pdq/information-summaries/genetics"
        And search bar is displayed below introductory text
        Then search options for "Starts with" and "Contains" are displayed
        And "starts with" is selected by default
        Then "Browse" option is displayed below search bar
        And browse option contains all alphabetic letters and "#" appears at the end of the list
        And each option appears as a link
        And the page is showing the expand results for letter "A"

    Scenario: Negative test - user enters a bogus URL (like /chicken at the end of the dictionary URL
        When user is navigating to bad url "/publications/dictionaries/cancer-terms/chickens"
        Then status code is 404
        And page title is "Page Not Found"

