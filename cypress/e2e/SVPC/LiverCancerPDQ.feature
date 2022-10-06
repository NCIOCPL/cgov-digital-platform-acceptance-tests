Feature: As a content owner I want to be able to split one summary into six different summaries so that each of the pages is more SEO-focused on its single topic

    ###Optional on this page

    Scenario Outline: User views the Liver Cancer Treatment content item showing On This Page on CGov on desktop and tablet
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/treatment"
        Then "On This Page" section displays below the intro text "This is an intro text. For more information, see Side Effects of Cancer Treatment."
        And "On This Page" section displays before the first body section titled "Surveillance"
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |

    Scenario: User views the Liver Cancer Treatment content item showing On This Page on CGov on mobile
        Given screen breakpoint is set to "mobile"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/treatment"
        Then the body section accordion displays below the intro text "This is an intro text. For more information, see Side Effects of Cancer Treatment."
        And "On This Page" section does not display

    Scenario Outline: User views the Liver Cancer Screening PDQ CIS content item hiding On This Page on CGov on desktop and tablet
        Given screen breakpoint is set to "<breakpoint>"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/causes-risk-factors"
        Then "On This Page" section does not exist
        Examples:
            | breakpoint |
            | desktop    |
            | tablet     |

    Scenario: User views the Liver Cancer Screening PDQ CIS content item hiding On This Page on CGov on mobile
        Given screen breakpoint is set to "mobile"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/causes-risk-factors"
        Then "On This Page" section does not exist
        And the body sections do not collapse into accordion

    # #### Intro text

    Scenario: User views the Liver Cancer Treatment content item with intro text on CGov on desktop
        Given screen breakpoint is set to "desktop"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/treatment"
        And the intro text displays "This is an intro text. For more information, see Side Effects of Cancer Treatment."
        Then the intro text "This is an intro text. For more information, see Side Effects of Cancer Treatment." appears following the "h1" title "Liver Cancer Treatment"
        And there is no anchor link to the intro text "#_47" from the On This Page

    

    Scenario: User views the Liver Cancer Treatment content item with intro text on CGov on tablet
        Given screen breakpoint is set to "tablet"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/treatment"
        And the intro text displays "This is an intro text. For more information, see Side Effects of Cancer Treatment."
        And the intro text "This is an intro text. For more information, see Side Effects of Cancer Treatment." is displayed below page title
        And there is no anchor link to the intro text "#_47" from the On This Page
  

    Scenario: User views the Liver Cancer Treatment content item with intro text on CGov on mobile
        Given screen breakpoint is set to "mobile"
        When user is navigating to "/test/types/liver/what-is-liver-cancer/treatment"
        Then the intro text displays "This is an intro text. For more information, see Side Effects of Cancer Treatment."
        And the intro text "This is an intro text. For more information, see Side Effects of Cancer Treatment." is displayed above accordion

      
# ### Do Not Generate and Display "In This Section" on Cancer Information Summary content


Scenario Outline: User views the Liver Cancer pdq cis item with and without In This Section content
    Given user is navigating to "<url>"
    Then In This Section section does not exist

    Examples:
        | url                                                   |
        | /test/types/liver/what-is-liver-cancer/causes-risk-factors |
        | /test/types/liver/what-is-liver-cancer/diagnosis           |
        | /test/types/liver/what-is-liver-cancer/treatment           |
        | /test/types/liver/what-is-liver-cancer                     |
