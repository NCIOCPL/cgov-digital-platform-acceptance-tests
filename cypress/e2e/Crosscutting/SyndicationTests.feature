Feature: Syndication Tests

    Scenario Outline: User is able to use syndication services
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "<url>"
        Then the syndication text "<text>" is present
        And the link "<textLink>" has a href "<hrefLink>"
        And syndication icon located at "/profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/icons/syndication.png" is present
        Examples:
            | url                                               | breakpoint | text                                                                                                                                             | textLink                            | hrefLink             |
            | /types/breast/patient/breast-treatment-pdq        | desktop    | Want to use this content on your website or other digital platform? Our syndication services page shows you how.                                 | syndication services page           | /syndication         |
            | /espanol/tipos/seno/paciente/tratamiento-seno-pdq | mobile     | ¿Desea usar este contenido en su sitio web o en otra plataforma digital? En nuestra página de sindicación de contenidos le decimos cómo hacerlo. | página de sindicación de contenidos | /espanol/sindicacion |