Feature: As a user, I want to be able to view and interact with infographic media

Scenario Outline: Infographics general visible components
  Given user is navigating to "<url>"
    Then infographic's picture element is displayed
  And infographic has a caption "<caption>"
  And the "View and Print Infographic" button is displayed

Examples:
|url| caption|
||
Scenario Outline: Infographics attributes
 Given user is navigating to "<url>"
 Then infographic's picture element is displayed
 And infographic has an alt text "<altText>"
And infographic has a long description attribute "<longdesc>"
And infographic has a data title attribute "<title>"
Examples:
|url| altText| longdesc | title|

Scenario Outline: Infographics can be open in a view and print preview window
 Given user is navigating to "<url>"
 Then infographic's picture element is displayed
 And infographic "View and Print Infographic" button's link has an href "<href>"
And infographic "View and Print Infographic" button has a blank target attribute

Examples:
|url| altText| longdesc |

Scenario Outline: Infographics has mobile and desktop versions where enabled
 Given user is navigating to "<url>"
 Then infographic's picture element is displayed
 And infographic's picture source has srcset attribute with value "<desktopSrcSet>" and media attribute "(min-width: 769px)"
And infographic's picture source has srcset attribute with value "<mobileSrcSet>" and media attribute "(max-width: 768px)"

Examples:
|url| desktopSrcSet| mobileSrcSet |
