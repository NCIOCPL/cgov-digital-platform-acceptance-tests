Feature: As a content owner I want to be able to create Mini Landing Page content type with NCIDS components

    Scenario Outline: English Mini landing page with NCIDS title and content blocks
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/test/ncids-mini-landing-template"
        Then NCIDS Page Title Block is displayed with text "The Adventures and Chronicles of the Quick Brown Fox Who Jumped Over the Lazy Dog and Their Friends the Tortoise and the Hare With Interludes from Alice in Wonderland"
        And there are 4 content blocks on a page
        And the following types of links are present
            | index | dataEntityType | title              | link                                       |
            | 0     | node           | About Cancer       | /about-cancer                              |
            | 1     | n/a            | About Cancer       | /about-cancer                              |
            | 0     | media          | Test File Download | /research/progress/discovery/test-file-url |
            | 0     | n/a            | Google             | https://www.google.com/                    |
            | 0     | n/a            | Email Jenny        | mailto:jenny@example.org                   |
            | 0     | n/a            | Call Jenny         | tel:1-555-867-5309                         |
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Spanish Mini landing page with NCIDS title and content block
        When user is navigating to "/espanol/test-es/ncids-mini-landing-template"
        Then NCIDS Page Title Block is displayed with text "Las Aventuras y Crónicas del Veloz Zorro Marrón que Saltó Sobre el Perro Perezoso y Sus Amigas la Tortuga y la Liebre con Interludios de Alicia en el País de las Maravillas"
        And there are 1 content blocks on a page


    Scenario Outline: English Mini landing page with 3 feature card row
        Given screen breakpoint is set to "<breakpoint"
        And user is navigating to "/test/ncids-mini-landing-template"
        Then NCIDS feature cards are visible
        And NCIDS feature cards have the following attributes
            | index | title               | description                                                                                                                                | link                                    | altText              | source                                                                   | file                          |
            | 0     | About Cancer        | N/A                                                                                                                                        | /about-cancer                           | No Image Placeholder | /files/styles/ncids_featured_16x9/module/cgov_image/img                  | placeholder-16x9.png          |
            | 1     | External Card Title | External description                                                                                                                       | https://www.google.com                  | Override Placeholder | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | override-placeholder-16x9.png |
            | 2     | NCI at a Glance     | Discover more about what NCI does, what we fund, and some highlights from our long history in leading cancer research in this infographic. | /about-nci/organization/nci-at-a-glance | Promo Placeholder    | /files/styles/ncids_featured_16x9/public/cgov_image/ncids_promo_art_16x9 | promo-placeholder-16x9.png    |
        And NCIDS component has "aria-labelledby" and "id" attributes

        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |
            | mobile     |

    Scenario: Mini landing page with NCIDS title, descr and image list
        When user is navigating to "/test/ncids-li-title-desc-img"
        And NCIDS list is displayed with title "NCIDS List Item: Title Desc Image"
        And each list item out of 28 has a heading and an image except item 27
        And all list items out of 28 have description except items 11 and 22

    Scenario: Mini landing page with NCIDS title, descr
        When user is navigating to "/test/ncids-li-title-desc"
        And NCIDS list is displayed with title "NCIDS List Item: Title Desc"
        And each list item out of 16 has a heading and description except items 10 and 5



    ###ANALYTICS####


    Scenario: NCIDS Mini landing page internal link click
        Given user is navigating to "/test/ncids-mini-landing-template"
        When user clicks on content block link at position 2
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | Internal\|Internal Link Testing\|About Cancer                  |
            | evar65    | Content Block\|Not Defined\|Not Defined                        |
            | evar66    | 7\|3\|0\|0\|1\|1                                               |
            | evar67    | Text\|6\|2                                                     |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:ContentBlock:LinkClick                                     |
            | linkType  | lnk_o                                                          |

    Scenario: NCIDS Mini landing page external link click
        Given user is navigating to "/test/ncids-mini-landing-template"
        When user clicks on content block link at position 4
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | External\|External Link Testing\|Google                        |
            | evar65    | Content Block\|Not Defined\|Not Defined                        |
            | evar66    | 7\|3\|0\|0\|1\|1                                               |
            | evar67    | Text\|6\|4                                                     |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:ContentBlock:LinkClick                                     |
            | linkType  | lnk_o                                                          |


    Scenario: NCIDS Mini landing page media link click
        Given user is navigating to "/test/ncids-mini-landing-template"
        When user clicks on content block link at position 3
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | Media\|Media Link Testing\|Test File Download                  |
            | evar65    | Content Block\|Not Defined\|Not Defined                        |
            | evar66    | 7\|3\|0\|0\|1\|1                                               |
            | evar67    | Text\|6\|3                                                     |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:ContentBlock:LinkClick                                     |
            | linkType  | lnk_o                                                          |

    Scenario: Raw Html link click event
        Given user is navigating to "/test/raw-html-sample-page"
        When user clicks on link "https://visualsonline.cancer.gov/" in raw html block
        Then page click request is sent
        And the following parameters should be captured
            | parameter | value                                                      |
            | prop4     | D=pev1                                                     |
            | prop8     | english                                                    |
            | prop57    | D=v64                                                      |
            | prop58    | D=v65                                                      |
            | prop59    | D=v66                                                      |
            | prop60    | D=c67                                                      |
            | prop67    | D=pageName                                                 |
            | prop68    | D=v68                                                      |
            | evar2     | D=c8                                                       |
            | evar61    | cgvMiniLanding\|ncids_default                              |
            | evar64    | External\|Test for Raw HTML & Analytics\|Images and B-roll |
            | evar65    | Raw HTML\|Not Defined\|RawHTMLTest                         |
            | evar66    | 2\|1\|0\|0\|1\|1                                           |
            | evar67    | Text\|6\|2                                                 |
            | evar68    | Body                                                       |
            | pageName  | {CANONICAL_HOST}/test/raw-html-sample-page                 |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/raw-html-sample-page    |
            | event112  |                                                            |
            | channel   | NCI Homepage                                               |
            | pev2      | MLP:RawHTML:LinkClick                                      |
            | linkType  | lnk_o                                                      |

    Scenario: Internal Feature card click event
        Given user is navigating to "/test/ncids-mini-landing-template"
        And browser waits
        When user clicks on NCIDS feature card at position 1
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | Internal\|About Cancer\|Image                                  |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 7\|5\|0\|0\|3\|1                                               |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:FeatureCard:LinkClick                                      |
            | linkType  | lnk_o                                                          |

    Scenario: External Feature card click event
        Given user is navigating to "/test/ncids-mini-landing-template"
        And browser waits
        When user clicks on NCIDS feature card at position 2
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | External\|External Card Title\|Image                           |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 7\|5\|0\|0\|3\|2                                               |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:FeatureCard:LinkClick                                      |
            | linkType  | lnk_o                                                          |

    Scenario: Media Feature card click event
        Given user is navigating to "/test/ncids-mini-landing-template"
        And browser waits
        When user clicks on NCIDS feature card at position 3
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                          |
            | prop4     | D=pev1                                                         |
            | prop8     | english                                                        |
            | prop57    | D=v64                                                          |
            | prop58    | D=v65                                                          |
            | prop59    | D=v66                                                          |
            | prop60    | D=c67                                                          |
            | prop67    | D=pageName                                                     |
            | prop68    | D=v68                                                          |
            | evar2     | D=c8                                                           |
            | evar61    | cgvMiniLanding\|ncids_default                                  |
            | evar64    | Media\|NCI at a Glance\|Image                                  |
            | evar65    | Feature Card\|Light\|Standard Single Link                      |
            | evar66    | 7\|5\|0\|0\|3\|3                                               |
            | evar67    | Image\|1\|1                                                    |
            | evar68    | Body                                                           |
            | pageName  | {CANONICAL_HOST}/test/ncids-mini-landing-template              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-mini-landing-template |
            | event112  |                                                                |
            | channel   | NCI Homepage                                                   |
            | pev2      | MLP:FeatureCard:LinkClick                                      |
            | linkType  | lnk_o                                                          |

    Scenario: List title and description item click
        Given user is navigating to "/test/ncids-li-title-desc"
        And browser waits
        When user clicks on NCIDS list item at position 1
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                  |
            | prop4     | D=pev1                                                 |
            | prop8     | english                                                |
            | prop57    | D=v64                                                  |
            | prop58    | D=v65                                                  |
            | prop59    | D=v66                                                  |
            | prop60    | D=c67                                                  |
            | prop67    | D=pageName                                             |
            | prop68    | D=v68                                                  |
            | evar2     | D=c8                                                   |
            | evar61    | cgvMiniLanding\|ncids_default                          |
            | evar64    | Internal\|NCIDS List Item: Title Desc\|[No IMG] Title  |
            | evar65    | List\|Not Defined\|Title and Description               |
            | evar66    | 4\|2\|0\|0\|1\|1                                       |
            | evar67    | Title\|5\|1                                            |
            | evar68    | Body                                                   |
            | pageName  | {CANONICAL_HOST}/test/ncids-li-title-desc              |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-li-title-desc |
            | event27   |                                                        |
            | channel   | NCI Homepage                                           |
            | pev2      | MLP:List:LinkClick                                     |
            | linkType  | lnk_o                                                  |

    Scenario: List title,image and description item click
        Given user is navigating to "/test/ncids-li-title-desc-img"
        And browser waits
        When user clicks on NCIDS list item at position 1
        Then page click request is sent
        And browser waits
        And the following parameters should be captured
            | parameter | value                                                       |
            | prop4     | D=pev1                                                      |
            | prop8     | english                                                     |
            | prop57    | D=v64                                                       |
            | prop58    | D=v65                                                       |
            | prop59    | D=v66                                                       |
            | prop60    | D=c67                                                       |
            | prop67    | D=pageName                                                  |
            | prop68    | D=v68                                                       |
            | evar2     | D=c8                                                        |
            | evar61    | cgvMiniLanding\|ncids_default                               |
            | evar64    | Internal\|NCIDS List Item: Title Desc Image\|[No IMG] Title |
            | evar65    | List\|Not Defined\|Title, Description, and Image            |
            | evar66    | 4\|2\|0\|0\|1\|1                                            |
            | evar67    | Title\|11\|1                                                |
            | evar68    | Body                                                        |
            | pageName  | {CANONICAL_HOST}/test/ncids-li-title-desc-img               |
            | pageURL   | {PROTOCOL}://{CANONICAL_HOST}/test/ncids-li-title-desc-img  |
            | event27   |                                                             |
            | channel   | NCI Homepage                                                |
            | pev2      | MLP:List:LinkClick                                          |
            | linkType  | lnk_o                                                       |
