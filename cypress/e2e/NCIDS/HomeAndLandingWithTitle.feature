Feature: As a user I want to select NCIDS with Title from Home and Landing Page Style options

    Scenario Outline: Home and Landing with title page components
        Given screen breakpoint is set to "<breakpoint>"
        Given user is navigating to "/ncids-landing-with-title"
        Then NCIDS page title is "NCIDS Landing With Title"
        And NCIDS subheading is "Subheading Test"
        And NCIDS feature card row heading at position 1 is "Feature Card Row"
        And NCIDS feature cards have the following attributes
            | index | title               | description               | link                   | altText              | source                                                                                                                        |
            | 0     | External Card Title | External Card Description | https://www.google.com | Lead Placeholder     | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/lead-placeholder-16x9.png)$     |
            | 1     | External Card Title | External Card Description | https://www.google.com | Promo Placeholder    | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/promo-placeholder-16x9.png)$    |
            | 2     | External Card Title | External Card Description | https://www.google.com | Override Placeholder | (\/files\/styles\/ncids_featured_16x9\/public\/cgov_image\/ncids_promo_art_16x9\/\d{4}-\d{2}\/override-placeholder-16x9.png)$ |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |