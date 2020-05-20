Feature: Content creator wants to associate alt text and caption with an infographic, so a user can see it when the infographic is in any context

    ################MEDIUM TEMPLATE#######################

    Scenario: User is able to see alt text of inline infographic - when alt tag has text (Medium Template)
        Given user is navigating to "/test/embed-info-med"
        And there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
        And "View and Print Infographic" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png"


    Scenario: User is able to see inline infographic on mobile with alt tag (Medium Template)
        Given user is navigating to "/test/embed-info-med"
        When screen breakpoint is set to "mobile"
        Then there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
        And "View and Print Infographic" link should not appear

    Scenario: User is able to see alt text of inline infographic - when alt tag has text (Medium Template)
        Given user is navigating to "/espanol/test-es/embed-info-med-es"
        And there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
        And "Ver e Imprimir Infografía" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png"


    Scenario: User is able to see inline infographic on mobile with alt tag
        Given user is navigating to "/espanol/test-es/embed-info-med-es"
        When screen breakpoint is set to "mobile"
        Then there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
        And "Ver e Imprimir Infografía" link should not appear


    #######################LARGE TEMPLATE###########################

    Scenario: User is able to see alt text of inline infographic - when alt tag has text (Large Template)
        Given user is navigating to "/test/embed-info-lrg"
        And there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
        And "View and Print Infographic" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png"


    Scenario: User is able to see inline infographic on mobile with alt tag (Large Template)
        Given user is navigating to "/test/embed-info-med"
        When screen breakpoint is set to "mobile"
        Then there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
        And "View and Print Infographic" link should not appear

    Scenario: User is able to see alt text of inline infographic - when alt tag has text (Large Template)
        Given user is navigating to "/espanol/test-es/embed-info-lrg-es"
        And there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
        And "Ver e Imprimir Infografía" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png"


    Scenario: User is able to see inline infographic on mobile with alt tag -Large template
        Given user is navigating to "/espanol/test-es/embed-info-lrg-es"
        When screen breakpoint is set to "mobile"
        Then there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
    And "Ver e Imprimir Infografía" link should not appear

