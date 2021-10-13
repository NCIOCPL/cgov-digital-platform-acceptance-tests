
Feature: Intro text tests

    Scenario Outline: Intro text section is present and contains translated text
        Given user is navigating to "<url>"
        Then intro text section is visible
        And intro text section contains translated "<text>"
        Examples:
            | url                                                                      | text                  |
            | /about-cancer/coping/self-image                                          | Each of us has        |
            | /espanol/cancer/sobrellevar/self-image                                   | Cada uno de nosotros  |
            | /research/key-initiatives/ras/ras-central/blog/2018/jaffee-immunotherapy | Professor of Oncology |

    Scenario Outline: Negative: Verify intro text does not exist
        Given user is navigating to "<url>"
        Then intro text section does not exist

        Examples:
            | url                                                |
            | /about-cancer/coping/feelings/relaxation           |
            | /espanol/cancer/sobrellevar/sentimientos/relajarse |