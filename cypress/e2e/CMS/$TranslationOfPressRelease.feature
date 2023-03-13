Feature: Translation Of Press Release

Scenario: Add a translation
    Given user is navigating to "/user/login"
    When user enters credentials
    And user clicks "Log in" button
    Then user is logged in and the user name "admin" is displayed in the toolbar
    And the tool bar appears at the top
    When user clicks on "Content" tab
    Then user selects "Translate" option from Operations dropdown for content with title "Automated Test Press Release Edited"
    Then page title is "Translations of Automated Test Press Release Edited"
    When user clicks on "Add" button to add translation
    Then page title is "Crear traducción Español de Automated Test Press Release Edited"
    And the following fields are displayed
        | fieldLabel               | field_name                     |
        | Pretty URL               | field_pretty_url               |
        | Título de página         | title                          |
        | Subtítulo                | field_subtitle                 |
        | Browser Title            | field_browser_title            |
        | Press Release Type       | field_press_release_type       |
        | Card Title               | field_card_title               |
        | Meta Description         | field_page_description         |
        | Feature Card Description | field_feature_card_description |
    And body was translated as "Cuerpo"
    And Remove button for image was translated as "Eliminar"
    And Related Resources section was translated as "Recursos relacionados"
    And dropdown to add link under related resources was translated to start with "Añadir"
    And button to add citation was translated as "Añadir Citation"
    And current state was translated as "Estado actual" "Borrador"
    And Change to dropdown has the following options
        | option    |
        | Borrador  |
        | Review    |
        | Publicado |
   And Save button was translated as "Guardar (esta traducción)"
   And preview button was translated as "Vista previa"
   Then user saves the content page
   And user clicks on the tool bar status green button "Borrador"
   And user selects "Quick Publish" from workflow actions

Scenario: Verify translated content
    Given user is navigating to the front end site with spanish path site section plus "test-press-release-edited"
    Then page title is "Automated Test Press Release Edited"
    And dates were translated as follows
    | date          |
    | Publicación   |
    | Actualización |
    | Revisión      |


