Feature: As I user I want to be able to see full infographic page

    Scenario: Full infographic page with translation without mobile image english
        Given user is navigating to "/about-nci/organization/nci-at-a-glance"
        Then language toggle is displayed with the href "/espanol/infografia-nci"
        And there should be an infographic with the following
            | attribute    | value                                                                                                |
            | alt          | empty                                                                                                |
            | caption      | none                                                                                                 |
            | mobileImage  | none                                                                                                 |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/nci-at-a-glance-enlarge.gif |
        And "View and Print Infographic" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/nci-at-a-glance-enlarge.gif"

    Scenario: Full infographic page with translation without mobile image english - mobile breakpoint
        Given user is navigating to "/about-nci/organization/nci-at-a-glance"
        When screen breakpoint is set to "mobile"
        Then language toggle is displayed with the href "/espanol/infografia-nci"
        And there should be an infographic with the following
            | attribute    | value                                                                                                |
            | caption      | none                                                                                                 |
            | alt          | empty                                                                                                |
            | mobileImage  | none                                                                                                 |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/nci-at-a-glance-enlarge.gif |
    #    And "Ver e Imprimir Infografía" link should not appear

    Scenario: Full infographic page with translation without mobile image spanish
        Given user is navigating to "/espanol/infografia-nci"
        Then language toggle is displayed with the href "/about-nci/organization/nci-at-a-glance"
        And there should be an infographic with the following
            | attribute    | value                                                                                                            |
            | caption      | none                                                                                                             |
            | alt          | empty                                                                                                            |
            | mobileImage  | none                                                                                                             |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/espanol-nci-at-a-glance-infographic.gif |
        And "Ver e Imprimir Infografía" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/espanol-nci-at-a-glance-infographic.gif"

    Scenario: Full infographic page with translation without mobile image spanish - Mobile breakpoint
        Given user is navigating to "/espanol/infografia-nci"
        When screen breakpoint is set to "mobile"
        Then language toggle is displayed with the href "/about-nci/organization/nci-at-a-glance"
        And there should be an infographic with the following
            | attribute    | value                                                                                                            |
            | caption      | none                                                                                                             |
            | alt          | empty                                                                                                            |
            | mobileImage  | none                                                                                                             |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/espanol-nci-at-a-glance-infographic.gif |
    #    And "Ver e Imprimir Infografía" link should not appear

    Scenario: Full infographic page without translation without mobile image
        Given user is navigating to "/about-nci/organization/screen-to-save-infographic"
        Then language toggle is not displayed
        And there should be an infographic with the following
            | attribute    | value                                                                                                                             |
            | caption      | none                                                                                                                              |
            | alt          | empty                                                                                                                             |
            | mobileImage  | none                                                                                                                              |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/cancer-and-the-human-tumor-atlas-network-infographic.png |
        And "View and Print Infographic" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/cancer-and-the-human-tumor-atlas-network-infographic.png"

    Scenario: Full infographic page without translation without mobile image - mobile breakpoint
        Given user is navigating to "/about-nci/organization/screen-to-save-infographic"
        When screen breakpoint is set to "mobile"
        Then language toggle is not displayed
        And there should be an infographic with the following
            | attribute    | value                                                                                                                             |
            | caption      | none                                                                                                                              |
            | alt          | empty                                                                                                                             |
            | mobileImage  | none                                                                                                                              |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/cancer-and-the-human-tumor-atlas-network-infographic.png |
    #    And "View and Print Infographic" link should not appear

    Scenario: Full translated infographic page with mobile image english
        Given user is navigating to "/pediatric-match-infographic"
        Then language toggle is displayed with the href "/espanol/match-infantil-infografia"
        And there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
        And "View and Print Infographic" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png"

    Scenario: Full translated infographic page with mobile image english - mobile breakpoint
        Given user is navigating to "/pediatric-match-infographic"
        When screen breakpoint is set to "mobile"
        Then language toggle is displayed with the href "/espanol/match-infantil-infografia"
        And there should be an infographic with the following
            | attribute    | value                                                                                                       |
            | alt          | English alt text.                                                                                           |
            | caption      | This is my caption.                                                                                         |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/Pediatric-MATCH-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-640x2.png |
    #    And "View and Print Infographic" link should not appear

    Scenario: Full translated infographic page with mobile image spanish
        Given user is navigating to "/espanol/match-infantil-infografia"
        Then language toggle is displayed with the href "/pediatric-match-infographic"
        And there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
        And "Ver e Imprimir Infografía" link appears below caption text with the href "/sites/default/files/styles/cgov_enlarged/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png"

    Scenario: Full translated infographic page with mobile image spanish - mobile breakpoint
        Given user is navigating to "/espanol/match-infantil-infografia"
        When screen breakpoint is set to "mobile"
        Then language toggle is displayed with the href "/pediatric-match-infographic"
        And there should be an infographic with the following
            | attribute    | value                                                                                                               |
            | alt          | Spanish alt text.                                                                                                   |
            | caption      | This is a spanish caption.                                                                                          |
            | mobileImage  | /sites/default/files/styles/cgov_article/public/2020-05/pediatric-match-espanol-enlarge.png                         |
            | desktopImage | /sites/default/files/styles/cgov_article/public/cgov_infographic/2020-05/Human-Tumor-Atlas-AP-web-spanish-640x2.png |
#    And "Ver e Imprimir Infografía" link should not appear
