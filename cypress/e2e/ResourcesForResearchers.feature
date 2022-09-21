Feature: Resources For Researchers app is integrated within CGOV platform

    Scenario: User is able to access a default (or “landing”) page that displays all of the expected R4R elements
        Given screen breakpoint is set to "desktop"
        When user is navigating to "/research/resources"
        Then page title is "Resources for Researchers"
        And introductory text "Resources for Researchers is a directory of NCI-supported tools and services for cancer researchers. Most resources are free of cost and available to anyone." appears
        And "Learn more about Resources for Researchers." text is a link with href "https://www.cancer.gov/research/resources/about"

    Scenario: Search For Resources section on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        When user is navigating to "/research/resources"
        Then page title is "Resources for Researchers"
        And general browsing section titled "Search For Resources" is displayed
        And "Search For Resources" section is displayed with correct icon
        And search field is displayed with placeholder text "Search Resources for Researchers"


    Scenario: Browse resources section on desktop breakpoint
        Given screen breakpoint is set to "desktop"
        When user is navigating to "/research/resources"
        Then page title is "Resources for Researchers"
        And general browsing section titled "Browse Resources" is displayed
        And text "Browse resources by tool type or research area or view all \(\d+\) resources\." is displayed
        And "view all \(\d+\) resources" is a link
        And "Browse Resources" section is displayed with correct icon

    Scenario: Tool type section on tablet breakpoint
        Given screen breakpoint is set to "tablet"
        And user is navigating to "/research/resources"
        Then page title is "Resources for Researchers"
        And section titled "Tool Type" is displayed
        And "Tool Type" section displays the following categories
            | tools                            |
            | Analysis Tools \(\d+\)           |
            | Datasets & Databases \(\d+\)     |
            | Lab Tools \(\d+\)                |
            | Community Research Tools \(\d+\) |
            | Terminology \(\d+\)              |
            | Networks/Consortiums \(\d+\)     |
            | Clinical Research Tools \(\d+\)  |
            | Training Resources \(\d+\)       |

    Scenario: Research Area section on mobile breakpoint
        Given screen breakpoint is set to "mobile"
        And user is navigating to "/research/resources"
        Then page title is "Resources for Researchers"
        And section titled "Research Area" is displayed
        And "Research Area" section displays the following categories
            | areas                             |
            | Cancer Biology \(\d+\)            |
            | Cancer Omics \(\d+\)              |
            | Cancer Treatment \(\d+\)          |
            | Screening & Detection \(\d+\)     |
            | Cancer Health Disparities \(\d+\) |
            | Causes of Cancer \(\d+\)          |
            | Cancer & Public Health \(\d+\)    |
            | Cancer Diagnosis \(\d+\)          |
            | Cancer Prevention \(\d+\)         |
            | Cancer Statistics \(\d+\)         |
            | Bioinformatics \(\d+\)            |
            | Cancer Survivorship \(\d+\)       |
        Then the page options should appear at the bottom of the page
        And the following page options are displayed
            | pageOption |
            | Twitter    |
            | Email      |


    Scenario: User is able to see all the resources on View all Resources page
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user clicks on "view all \(\d+\) resources." link
        Then user is redirected to "/research/resources/search" with "?from=0"
        And page title is "Resources for Researchers Search Results"
        And "Resources for Researchers Home" link has a href "/research/resources/"
        And search box is empty
        And results info text is "1 - 20 of \d+ results"
        And both pagers are displayed
        And the results are displayed with each title containing a link
        And each result has a description text under the title



    Scenario Outline: User is able to search resources using the tool type options on the homepage
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user clicks on "<toolTypeFilter>"
        Then user is redirected to "<redirectedPath>" with "<search>"
        And the filter displays the "<toolTypeFilter>"
        And search box is empty
        And results info text is "1 - \d+ of \d+ results"
        And the "Tool Type" box displays the filter "<tools>"
        And the "Tool Sub-Type" box is displayed for "<eligibleToolType>"

        Examples:

            | tools                            | toolTypeFilter           | redirectedPath             | search                                     | eligibleToolType |
            | Analysis Tools \(\d+\)           | Analysis Tools           | /research/resources/search | ?from=0&toolTypes=analysis_tools           | Y                |
            | Datasets & Databases \(\d+\)     | Datasets & Databases     | /research/resources/search | ?from=0&toolTypes=datasets_databases       | Y                |
            | Lab Tools \(\d+\)                | Lab Tools                | /research/resources/search | ?from=0&toolTypes=lab_tools                | Y                |
            | Community Research Tools \(\d+\) | Community Research Tools | /research/resources/search | ?from=0&toolTypes=community_research_tools | Y                |
            | Terminology \(\d+\)              | Terminology              | /research/resources/search | ?from=0&toolTypes=terminology              | N                |
            | Networks/Consortiums \(\d+\)     | Networks/Consortiums     | /research/resources/search | ?from=0&toolTypes=networks_consortiums     | N                |
            | Clinical Research Tools \(\d+\)  | Clinical Research Tools  | /research/resources/search | ?from=0&toolTypes=clinical_research_tools  | Y                |
            | Training Resources \(\d+\)       | Training Resources       | /research/resources/search | ?from=0&toolTypes=training_resources       | N                |

    Scenario Outline: User is able to search resources using the research area options on the homepage
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user clicks on "<researchAreaFilter>"
        Then user is redirected to "<redirectedPath>" with "<search>"
        And the filter displays the "<researchAreaFilter>"
        And search box is empty
        And Result Count text contains the same number as present in the "<areas>" link
        And the "Research Area" box displays the filter "<researchAreaFilter>" as checked


        Examples:
            | areas                             | researchAreaFilter        | redirectedPath             | search                                          |
            | Cancer Biology \(\d+\)            | Cancer Biology            | /research/resources/search | ?from=0&researchAreas=cancer_biology            |
            | Cancer Omics \(\d+\)              | Cancer Omics              | /research/resources/search | ?from=0&researchAreas=cancer_omics              |
            | Cancer Treatment \(\d+\)          | Cancer Treatment          | /research/resources/search | ?from=0&researchAreas=cancer_treatment          |
            | Screening & Detection \(\d+\)     | Screening & Detection     | /research/resources/search | ?from=0&researchAreas=screening_detection       |
            | Cancer Health Disparities \(\d+\) | Cancer Health Disparities | /research/resources/search | ?from=0&researchAreas=cancer_health_disparities |
            | Causes of Cancer \(\d+\)          | Causes of Cancer          | /research/resources/search | ?from=0&researchAreas=causes_of_cancer          |
            | Cancer Diagnosis \(\d+\)          | Cancer Diagnosis          | /research/resources/search | ?from=0&researchAreas=cancer_diagnosis          |
            | Cancer & Public Health \(\d+\)    | Cancer & Public Health    | /research/resources/search | ?from=0&researchAreas=cancer_public_health      |
            | Cancer Statistics \(\d+\)         | Cancer Statistics         | /research/resources/search | ?from=0&researchAreas=cancer_statistics         |
            | Cancer Prevention \(\d+\)         | Cancer Prevention         | /research/resources/search | ?from=0&researchAreas=cancer_prevention         |
            | Bioinformatics \(\d+\)            | Bioinformatics            | /research/resources/search | ?from=0&researchAreas=bioinformatics            |
            | Cancer Survivorship \(\d+\)       | Cancer Survivorship       | /research/resources/search | ?from=0&researchAreas=cancer_survivorship       |

    Scenario: User is able to search resources using the search box and clicking on magnifying glass icon on the homepage
        Given screen breakpoint is set to "mobile"
        Given user is navigating to "/research/resources"
        When user types "asarp" in the search bar
        When user clicks on the magnifying glass icon
        Then user is redirected to "/research/resources/search" with "?from=0&q=asarp"
        And search box displays the term "asarp"
        Then user clicks on "Filter" button
        And the "Tool Type" box displays the filter "Analysis Tools \(\d+\)"
        And the "Research Area" box is displayed
        And the "Research Type" box is displayed
        Then user clicks on "Done" button
        And the search result is displayed
        And the search result title is "Allele-Specific Alternative mRNA processing (ASARP)" with href "/research/resources/resource/102"
        And the search result description is displayed

    Scenario: User is able to search resources using the search box and hitting the Enter key on the homepage
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user types "asarp" in the search bar
        When user hits "enter" key
        And browser waits
        Then user is redirected to "/research/resources/search" with "?from=0&q=asarp"
        And search box displays the term "asarp"
        And the "Tool Type" box displays the filter "Analysis Tools \(\d+\)"
        And the "Research Area" box is displayed
        And the "Research Type" box is displayed
        And the search result is displayed
        And the search result title is "Allele-Specific Alternative mRNA processing (ASARP)" with href "/research/resources/resource/102"
        And the search result description is displayed
        And no pager is displayed

    Scenario: User is able to see the No results found page
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user types "fre" in the search bar
        When user hits "enter" key
        Then user is redirected to "/research/resources/search" with "?from=0&q=fre"
        And page title is "Resources for Researchers Search Results"
        And search box displays the term "fre"
        And the message is displayed as "No results were found for your search. Please try another search or view all resources."
        And "view all resources." is a link with href "#viewAll"
        And the following page options are displayed
            | pageOption |
            | Twitter    |
            | Email      |

    Scenario Outline: User is able to see the Resource Detail page
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "<url>"
        Then the resource title is displayed as "<title>"
        And "Resources for Researchers Home" is displayed with href "/research/resources/"
        And "Resource description" field is displayed
        And Visit Resource link is displayed
        And search box is displayed
        And "Find Related Resources" section is displayed
        And "Resource Access Information" field is displayed
        And "NCI Affiliation Information" field is displayed
        And Contact Information field is "<displayed>"

        Examples:
            | url                              | title                                                 | displayed   |
            | /research/resources/resource/82  | Health Disparities Calculator (HD*Calc)               | visible     |
            | /research/resources/resource/102 | Allele-Specific Alternative mRNA processing (ASARP)   | not visible |
            | /research/resources/resource/32  | The International Registry of Werner Syndrome         | visible     |
            | /research/resources/resource/54  | Cancer Intervention and Surveillance Modeling Network | visible     |


    Scenario: User is able to go to Resource Detail page from Search Results page
        Given screen breakpoint is set to "desktop"
        Given user is navigating to "/research/resources"
        When user clicks on "Cancer Biology"
        Then user is redirected to "/research/resources/search" with "?from=0&researchAreas=cancer_biology"
        And the filter displays the "Cancer Biology"
        And search box is empty
        And results info text is "1 - 20 of \d+ results"
        And the "Research Area" box displays the filter "Cancer Biology" as checked
        When user clicks on 1 search result item
        Then the page title is the same as the clicked result's item title
        And the "< Back to results" is displayed
        And "Resources for Researchers Home" is displayed with href "/research/resources/"
        And "Resource description" field is displayed
        And Visit Resource link is displayed with exit disclaimer icon
        And search box is displayed
        And "Find Related Resources" section is displayed
        And "Resource Access Information" field is displayed
        And "NCI Affiliation Information" field is displayed
        And Contact Information field is "visible"

    Scenario: User is able to see the Resource Not Found page when non existent page is searched
        Given screen breakpoint is set to "desktop"
        When user is navigating to "/research/resources/search?from=999"
        Then page title is "Resource Not Found"
        And the Resource not found message is displayed as "We can't find the resource you're looking for." and "Please visit the Resources for Researchers home page to search or browse resources."
        And the "Resources for Researchers home page" is displayed with href "/research/resources/"
        And the following page options are displayed
            | pageOption |
            | Twitter    |
            | Email      |