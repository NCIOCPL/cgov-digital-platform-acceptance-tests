Feature: Expose section navigation as API

## This tests:
##   * 5 levels deep Should not show A.1.1.1.1.1.1
Scenario: Section Nav defaults to 5 levels
Given user makes json request to "/taxonomy/term/1500002/section-nav"
Then the json response matches the contents of "5LevelsDeep.json"

## This tests:
##   * Only 2 levels are show. A.2.1.1 should not be shown
##   * A.2.2 should not be shown because it was marked hide_in_section_nav
Scenario: Section nav honors depth of 2
Given user makes json request to "/taxonomy/term/1500009/section-nav"
Then the json response matches the contents of "2LevelsDeep.json"

## This tests:
##   * A section is marked as hide in section nav, but is a Section nav root.
##   P.S. It should show - the hide_in_section_nav indicates it should not show
##     in a parent nav.
Scenario: Shows a section nav when it has been marked as a root, but hide in nav
Given user makes json request to "/taxonomy/term/1500012/section-nav"
Then the json response matches the contents of "SNNoShow.json"

## This tests:
##   * A nested section under another that would not display. This mimicks
## ccg > research > structural genomics > TCGA.
Scenario: Correctly handles a nested section
Given user makes json request to "/taxonomy/term/1500046/section-nav"
Then the json response matches the contents of "nestedsection.json"

##Spanish sections

##   * 4 levels deep Spanish - Should not show C.1.1.1.1.1
Scenario: Shows a section nav when it has been marked as a root, but hide in nav
Given user makes json request to "/espanol/taxonomy/term/1500030/section-nav"
Then the json response matches the contents of "4LevelsDeepSpanish.json"

##   * Only 2 levels are shown in Spanish C.2.1.1 should not be shown
##   * C.2.2 should not be shown because it was marked hide_in_section_nav
Scenario: Section nav Spanish honors depth of 2
Given user makes json request to "/espanol/taxonomy/term/1500035/section-nav"
Then the json response matches the contents of "2LevelsDeepSpanish.json"

 #* A Spanish section is marked as hide in section nav, but is a Section nav root.
Scenario: Shows a section nav when it has been marked as a root, but hide in nav
Given user makes json request to "/espanol/taxonomy/term/1500038/section-nav"
Then the json response matches the contents of "SNNoShowSpanish.json"


#NEGATIVE TESTS 
Scenario: Requesting a section nav that is section_nav_root: false
Given user makes bad json request to "/taxonomy/term/1500013/section-nav"
Then the json response matches the contents of "EmptyResponse.json" and status code is 400

Scenario: Requesting a spanish section nav that is section_nav_root: false
Given user makes bad json request to "/espanol/taxonomy/term/1500037/section-nav"
Then the json response matches the contents of "EmptyResponse.json" and status code is 400

Scenario: Requesting a section nav that has unpublished landing page
Given user makes bad json request to "/taxonomy/term/1500026/section-nav"
Then the json response matches the contents of "EmptyResponse.json" and status code is 400

Scenario: Requesting a section nav that has no landing page
Given user makes bad json request to "/taxonomy/term/1500024/section-nav"
Then the json response matches the contents of "EmptyResponse.json" and status code is 400
