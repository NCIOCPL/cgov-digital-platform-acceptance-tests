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

    Scenario Outline: Content editor added an article content item with accent, left or right aligned image and with and withou button
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the title of the accent feature card <accentCardNumber> is "<accentCardTitle>"
        And the accent of feature card <accentCardNumber> is "<accent>"
        And the title of the feature card <cardNumber> is "<cardTitle>"
        And the accent feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have no button
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And promo image of the feature card <cardNumber> is alligned to the "<cardAlignment>"

        Examples:
            | screenBreakpoint | url                   | accentCardNumber | accent      | accentCardTitle                       | cardNumber | cardTitle              | titleHref            | cardDescription                                                                                                                                                                                                                                                                                        | promoImageSource                                                                                                           | promoImageAlt       | cardAlignment |
            | desktop          | /test/borderless-card | 1                | default     | Accent Default, Left Image, No button | 7          | What the study is      | /test/lead-img-crops | Connect for Cancer Prevention is one of the largest and most important cancer studies in the United States. By joining Connect, you will be a part of a community of researchers and 200,000 people from around the country, who, like you, want to contribute to  cancer research.                    | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus | left          |
            | mobile           | /test/borderless-card | 2                | accent-cool | Accent Cool, Right Image, No button   | 8          | How you can help       | /test/lead-img-crops | While researchers have made important advances, there is more to learn to ease the burden of cancer on our families and our communities. Your participation in this study will give scientists the ability to look at how the way we live, our genes, and our medical history are connected to cancer. | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus | right         |
            | tablet           | /test/borderless-card | 3                | accent-warm | Accent Warm, Left Image, No button    | 9          | Learning from everyone | /test/lead-img-crops | Connect for Cancer Prevention will be most successful if a diverse group of participants from different environments and backgrounds join. This allows all people to benefit from our discoveries.                                                                                                     | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus | left          |


    Scenario Outline: Content editor added an article content item with default accent, right align image and button
        Given user is navigating to "<url>"
        And screen breakpoint is set to "<screenBreakpoint>"
        Then the title of the accent feature card <accentCardNumber> is "<accentCardTitle>"
        And the accent of feature card <accentCardNumber> is "<accent>"
        And the feature card <cardNumber> title will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And the feature card <cardNumber> will have a button displayed under the card description with the text "<buttonText>" and href "<titleHref>"
        And "610" by "610" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"
        And promo image of the feature card <cardNumber> is alligned to the "<cardAlignment>"
        Examples:
            | screenBreakpoint | url                   | accentCardNumber | accent      | accentCardTitle                       | cardNumber | cardTitle        | titleHref            | cardDescription                                                                                                                                                                                                                                                                                        | buttonText | promoImageSource                                                                                                           | promoImageAlt       | cardAlignment |
            | desktop          | /test/borderless-card | 4                | accent-cool | Accent Cool, Right Image, Show button | 10         | How you can help | /test/lead-img-crops | While researchers have made important advances, there is more to learn to ease the burden of cancer on our families and our communities. Your participation in this study will give scientists the ability to look at how the way we live, our genes, and our medical history are connected to cancer. | READ MORE  | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/pet_zedd_happy\.jpg.* | Zedd vs the Octopus | right         |