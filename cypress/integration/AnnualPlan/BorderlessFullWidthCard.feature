Feature: As a content editor, I would like to be able to embed a borderless full-width card, so that we can promote the most important information effectively.

    Scenario Outline: Content editor added an article content item with lead image
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                   | cardNumber | cardTitle                   | titleHref            | cardDescription                   | buttonText        | promoImageSource                                                                                                           | promoImageAlt       |
            | desktop          | /test/borderless-card | 1          | [Lead IMG Crops] Card Title | /test/lead-img-crops | [Lead IMG Crops] Card Description | ARTICLE WITH LEAD | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus |



    Scenario Outline: Content editor added a content item with promo image (WIP to add promoImage oncec it is in YAMl) overriding the article image
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                   | cardNumber | cardTitle                   | titleHref            | cardDescription | buttonText         | promoImageSource | promoImageAlt |
            | tablet           | /test/borderless-card | 2          | [Lead Promo IMG] Card Title | /test/lead-promo-img | none            | ARTICLE WITH PROMO | none             | none          |


    Scenario Outline: Content editor added a content item with no image
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                   | cardNumber | cardTitle           | titleHref    | cardDescription | buttonText     | promoImageSource | promoImageAlt |
            | mobile           | /test/borderless-card | 3          | [No IMG] Card Title | /test/no-img | none            | ARTICLE NO IMG | none             | none          |


    Scenario Outline: Editor added content item with override long description
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                              | cardNumber | cardTitle                        | titleHref                       | cardDescription                                                                                | buttonText             | promoImageSource                                                                                                           | promoImageAlt       |
            | desktop          | /espanol/test-es/borderless-card | 4          | [Lead IMG Crops] Card Title - ES | /espanol/test-es/lead-img-crops | This is a much longer description that drones on and on until it starts frothing at the mouth. | ARTICLE WITH LONG DESC | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus |


    Scenario Outline: Content editor added an article with override title
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                   | cardNumber | cardTitle       | titleHref            | cardDescription                   | buttonText         | promoImageSource                                                                                                           | promoImageAlt       |
            | desktop          | /test/borderless-card | 5          | Alternate Title | /test/lead-img-crops | [Lead IMG Crops] Card Description | ARTICLE WITH TITLE | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus |

    Scenario Outline: Content editor added a content item with override title and override promo image (WIP add promo img when it is in YAML)
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | url                   | cardNumber | cardTitle                   | titleHref            | cardDescription                   | buttonText             | promoImageSource | promoImageAlt |
            | desktop          | /test/borderless-card | 6          | [Lead IMG Crops] Card Title | /test/lead-img-crops | [Lead IMG Crops] Card Description | ARTICLE WITH LONG DESC | none             | none          |
