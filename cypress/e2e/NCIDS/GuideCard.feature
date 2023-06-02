Feature: As a user I want to be able to add a NCIDS guide card component onto a page

    Scenario Outline: Guide card components
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/ncids-guide-card-test"
        Then NCIDS guide cards have the following attributes
            | index | title                                                                      | description                                                                                                                                                                      | btnLinkAndText                                                                                                                                                                                                                                                                                                                        |
            | 0     | Patients and Caregivers, with a Title Long Enough to Wrap to a Second Line | NCI is the nation's trusted source for cancer information. We're here with information about causes and risk factors, early detection and diagnosis, and treatment options.      | Learn More,https://www.google.com                                                                                                                                                                                                                                                                                                     |
            | 1     | Researchers                                                                | Support for the best science underpins everything NCI does. NCI supports the best scientists and research projects through a rigorous grant application and peer review process. | Learn More,https://www.google.com;Learn More 1,https://www.google.com;[Internal Promo Block] Card Title,/test/internal-promo-block-test-article;[Guide Card] Browser Title,/test/internal-promo-block-test-article-0;Internal Button Text,/test/internal-promo-block-test-article-0;Feelings and Cancer,/about-cancer/coping/feelings |

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |