Feature: As a user, I want to be able to navigate to different site sections on my mobile device

        Background: Resize to mobile
                And screen breakpoint is set to "mobile"

        Scenario: User is viewing the home page
                Given user is navigating to "/"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label             |
                        | About Cancer      |
                        | Cancer Types      |
                        | Research          |
                        | Grants & Training |
                        | News & Events     |
                        | About NCI         |


        Scenario: User is viewing a landing page of a section nav root that only shows 1 level
                Given user is navigating to "/research/key-initiatives"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label                     |
                        | Main Menu                 |
                        | Explore Research          |
                        | Key Initiatives           |
                        | Resources for Researchers |



        Scenario: User is viewing a URL that does not show in the navigation (and is technically 2 levels below something that shows)
                Given user is navigating to "/api-test/a/3/1/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label       |
                        | Back        |
                        | Explore A.3 |
                        | A.3.2       |


        Scenario: User is viewing a landing page of a section that lives in a section nav (i.e. "normal")
                Given user is navigating to "/about-cancer/coping/feelings/relaxation"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label                       |
                        | Back                        |
                        | Explore Feelings and Cancer |
                        | Learning to Relax           |

        Scenario: User is viewing a landing page of a section nav root that has children and who's parent is the site root.
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label         |
                        | Back          |
                        | Explore A.1.1 |
                        | A.1.1.1       |


        Scenario: User is viewing a landing page of a section nav root that has children and who's parent is something in the mobile nav.
                Given user is navigating to "/api-test/a/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label       |
                        | Back        |
                        | Explore A.1 |
                        | A.1.1       |
                        | A.1.2       |

        Scenario: User is viewing a landing page of a subsection for a section nav
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label         |
                        | Back          |
                        | Explore A.1.1 |
                        | A.1.1.1       |


        # #**TODO: ** Is there a live use case for a url that is like /foo which does not have a section nav and is marked as hide in mobile?

        Scenario: User is viewing a landing page that does not have a section nav
                Given user is navigating to "/about-cancer"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label                |
                        | Main Menu            |
                        | Explore About Cancer |
                        | Coping with Cancer   |

        Scenario: Verify that the right parents and children are displayed when navigating back in the tree
                Given user is navigating to "/api-test/a/5/1/1/1/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label               |
                        | Back                |
                        | Explore A.5.1.1.1.1 |
                        | A.5.1.1.1.1.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label             |
                        | Back              |
                        | Explore A.5.1.1.1 |
                        | A.5.1.1.1.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label           |
                        | Back            |
                        | Explore A.5.1.1 |
                        | A.5.1.1.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label         |
                        | Back          |
                        | Explore A.5.1 |
                        | A.5.1.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label       |
                        | Back        |
                        | Explore A.5 |
                        | A.5.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label     |
                        | Main Menu |
                        | Explore A |
                        | A.1       |
                        | A.2       |
                        | A.3       |
                        | A.4       |
                        | A.5       |

        ### CTHP mimicking use case
        Scenario: Verify that the right parents and children are displayed when navigating back in the tree
                Given user is navigating to "/api-test/a/6/2/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label         |
                        | Back          |
                        | Explore A.6.2 |
                        | A.6.2.1       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label       |
                        | Back        |
                        | Explore A.6 |
                        | A.6.1       |
                        | A.6.2       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label     |
                        | Main Menu |
                        | Explore A |
                        | A.1       |
                        | A.2       |
                        | A.3       |
                        | A.4       |
                        | A.5       |
                        | A.6       |
                When user clicks on Back button
                Then user should see the following in the mobile menu
                        | Label |
                        | A     |
                        | B     |
             

        ###Spanish

        Scenario: Spanish -  User is viewing a landing page of a section nav root that has children and who's parent is something in the mobile nav.
                Given user is navigating to "/espanol/api-test-es/c/1"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label    |
                        | Anterior |
                        | C.1      |
                        | C.1.1    |
                        | C.1.2    |

        Scenario: User is viewing the Spanish home page
                Given user is navigating to "/espanol"
                When user clicks on the mobile menu button
                Then user should see the following in the mobile menu
                        | Label                       |
                        | El cáncer                   |
                        | Tipos de cáncer             |
                        | Investigación               |
                        | Subvenciones y capacitación |
                        | Noticias                    |
                        | Nuestro instituto           |


        ## Analytics

        Scenario: Click even fires when user open a mobile menu
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | Open                                    |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event28   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:Open                   |
                        | linkType  | lnk_o                                   |
                        | link      | Menu                                    |

        Scenario: Click even fires when user clicks on mobile menu child link
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                And user clicks on "A.1.1.1" mobile menu link
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | ChildPageMenu\|2                        |
                        | evar71    | A.1.1.1                                 |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | prop71    | D=v71                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event26   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:LinkClick              |
                        | linkType  | lnk_o                                   |
                        | link      | A.1.1.1                                 |

        Scenario: Click even fires when user clicks on mobile menu explore button
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                And user clicks on Explore "A.1.1" mobile menu link
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | ExplorePage\|1                          |
                        | evar71    | Explore A.1.1                           |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | prop71    | D=v71                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event26   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:LinkClick              |
                        | linkType  | lnk_o                                   |
                        | link      | Explore A.1.1                           |

        Scenario: Click even fires when user clicks on mobile menu back button
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                When user clicks on Back button
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | Back\|null                              |
                        | evar71    | Back                                    |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | prop71    | D=v71                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event26   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:LinkClick              |
                        | linkType  | lnk_o                                   |
                        | link      | Back                                    |


        Scenario: Click even fires when user closes mobile menu by clicking X
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                And user closes mobile menu by clicking "X" button
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | CloseX                                  |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event30   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:Close                  |
                        | linkType  | lnk_o                                   |

        Scenario: Click even fires when user closes mobile menu by hitting Esc
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                And user hits "Esc" key
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | CloseEsc                                |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event30   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:Close                  |
                        | linkType  | lnk_o                                   |

        Scenario: Click even fires when user closes mobile menu by clicking away
                Given user is navigating to "/api-test/a/1/1"
                When user clicks on the mobile menu button
                And analytics storage is cleared
                And user clicks on the right side of a screen
                And browser waits
                Then page click request is sent
                And the following parameters should be captured
                        | parameter | value                                   |
                        | prop4     | D=pev1                                  |
                        | prop67    | D=pageName                              |
                        | evar68    | MobilePrimaryNav                        |
                        | evar70    | CloseClickAway                          |
                        | prop8     | english                                 |
                        | evar2     | D=c8                                    |
                        | prop68    | D=v68                                   |
                        | prop70    | D=v70                                   |
                        | pageURL   | https://{CANONICAL_HOST}/api-test/a/1/1 |
                        | pageName  | {CANONICAL_HOST}/api-test/a/1/1         |
                        | event30   |                                         |
                        | channel   | NCI Homepage                            |
                        | pev2      | MobilePrimaryNav:Close                  |
                        | linkType  | lnk_o                                   |

