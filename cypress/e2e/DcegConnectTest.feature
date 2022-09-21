Feature: As an user, I want to see different components of the Homepage and navigate to different pages of the DCEGConnect site from the Homepage

    Scenario Outline: Borderless cards components appear correctly at desktop and tablet breakpoints
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user is navigating to "/dceg-connect"
        Then the NIH logo appears with src "/profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/nci-logo-full.svg" and alt text "National Cancer Institute"
        Then the title of the feature card <cardNumber> is "<cardTitle>"
        And the feature card <cardNumber> will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And "319" by "319" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"

        Examples:
            | screenBreakpoint | cardNumber | cardTitle              | titleHref            | cardDescription                                                                                                                                                                                                                                                                                        | promoImageSource                                                                                                                   | promoImageAlt          |
            | desktop          | 1          | What the study is      | /test/lead-img-crops | Connect for Cancer Prevention is one of the largest and most important cancer studies in the United States. By joining Connect, you will be a part of a community of researchers and 200,000 people from around the country, who, like you, want to contribute to  cancer research.                    | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/what-the-study-is\.png.*      | What the Study is      |
            | tablet           | 2          | How you can help       | /test/lead-img-crops | While researchers have made important advances, there is more to learn to ease the burden of cancer on our families and our communities. Your participation in this study will give scientists the ability to look at how the way we live, our genes, and our medical history are connected to cancer. | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/how-you-can-help\.png.*       | How You Can Help       |
            | desktop          | 3          | Learning from everyone | /test/lead-img-crops | Connect for Cancer Prevention will be most successful if a diverse group of participants from different environments and backgrounds join. This allows all people to benefit from our discoveries.                                                                                                     | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/learning-from-everyone\.png.* | Learning from Everyone |



    Scenario Outline: Borderless cards components appear correctly at mobile breakpoint
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user is navigating to "/dceg-connect"
        Then the NIH logo appears with src "/profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/nci-logo-full.svg" and alt text "National Cancer Institute"
        # Then the title of the feature card <cardNumber> is "<cardTitle>" --> this should be uncommented when issue https://github.com/NCIOCPL/cgov-digital-platform/issues/3308 is resolved
        And the feature card <cardNumber> will have the href "<titleHref>"
        And the feature card <cardNumber> description is "<cardDescription>"
        And "319" by "319" sized promo image of the feature card <cardNumber> is displayed with the source "<promoImageSource>" and alt text "<promoImageAlt>"
        And the feature card <cardNumber> promo image "<promoImageSource>" will link to the "<titleHref>"
        And the image number 1 of a content block 1 will have a text "40–65 years old and have never been diagnosed with most kinds of invasive cancers"
        And the image number 2 of a content block 1 will have a text "Member or patient of participating health care systems"
        Examples:
            | screenBreakpoint | cardNumber | cardTitle              | titleHref            | cardDescription                                                                                                                                                                                    | promoImageSource                                                                                                                   | promoImageAlt          |
            | mobile           | 3          | Learning from everyone | /test/lead-img-crops | Connect for Cancer Prevention will be most successful if a diverse group of participants from different environments and backgrounds join. This allows all people to benefit from our discoveries. | \/sites\/default\/files\/styles\/cgov_borderless_card\/public\/cgov_image\/media_image\/\d{4}-\d{2}\/learning-from-everyone\.png.* | Learning from Everyone |


    Scenario Outline: HTML blocks are displayed with all of it's components at desktop, tablet and mobile breakpoints
        Given screen breakpoint is set to "<screenBreakpoint>"
        When user is navigating to "/dceg-connect "
        And the title of a content block <number> will be "<title>"
        And the type "<type>" image number <index> of a content block <number> is displayed with the source "<imageSource>"

        Examples:
            | screenBreakpoint | title                             | imageSource                                                                                          | index | number | type   |
            | desktop          | Who can join                      | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/icons/age-icon.png       | 1     | 1      | icon   |
            | tablet           | Who can join                      | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/icons/health-system.png  | 2     | 1      | icon   |
            | mobile           | Who can join                      | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/icons/health-system.png  | 2     | 1      | icon   |
            | mobile           | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/sh-vector.png      | 1     | 2      | vector |
            | tablet           | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/chicago-vector.png | 2     | 2      | vector |
            | desktop          | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/hp-vector.png      | 3     | 2      | vector |
            | mobile           | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/marsh-vector.png   | 4     | 2      | vector |
            | desktop          | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/hf-vector.png      | 5     | 2      | vector |
            | tablet           | Participating Health Care Systems | /profiles/custom/cgov_site/themes/custom/cgov/static/images/design-elements/logos/kp-vector.png      | 6     | 2      | vector |