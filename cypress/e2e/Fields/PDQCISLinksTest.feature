Feature: PDQ CIS Links Test

    Scenario Outline: As an user I can use anchor links and table links on the page to go to a certain page section
        Given screen breakpoint is set to "<screenBreakpoint>"
        Given user is navigating to "<url>"
        Then the link with href "<anchorLink>" exists
        ###We will uncomment it when the issue gets resolved (Issues#176)
        # And the link with href "<tableLink>" exists
        Examples:
            | screenBreakpoint | url                                                                           | anchorLink    | tableLink |
            | desktop          | /types/breast/patient/breast-treatment-pdq                                    | #_125         | #_229_toc |
            | tablet           | /types/breast/hp/breast-treatment-pdq                                         | #_1375        | #_551_toc |
            | desktop          | /espanol/tipos/seno/paciente/tratamiento-seno-pdq                             | #_AboutThis_1 | #_88_toc  |
            | tablet           | /espanol/tipos/seno/pro/tratamiento-seno-pdq                                  | #_919         | #_924_toc |
            | desktop          | /espanol/cancer/tratamiento/efectos-secundarios/cambios-piel-unas/prurito-pdq | #_802         | #_130_toc |

    Scenario Outline: As an user I can use other links on the page to go to a certain page section
        Given screen breakpoint is set to "<screenBreakpoint>"
        Given user is navigating to "<url>"
        And the link with href "<otherLink>" exists
        Examples:
            | screenBreakpoint | url                                                              | otherLink                                                             |
            # | desktop          | /types/retinoblastoma/hp/retinoblastoma-treatment-pdq            | #_TrialSearch_1796_sid_6_toc                                          |
            | tablet           | /types/breast/hp/breast-ovarian-genetics-pdq                     | /types/breast/hp/breast-ovarian-genetics-pdq#_sm_CDR0000738176_1250   |
            | desktop          | /espanol/tipos/retinoblastoma/pro/tratamiento-retinoblastoma-pdq | /espanol/tipos/retinoblastoma/pro/tratamiento-retinoblastoma-pdq#_786 |
            | tablet           | /types/retinoblastoma/hp/retinoblastoma-treatment-pdq            | /types/retinoblastoma/hp/retinoblastoma-treatment-pdq#_726            |

    Scenario Outline: As an user I can use anchor links and citation links on the page to go to a certain page section at mobile breakpoint
        Given screen breakpoint is set to "mobile"
        Given user is navigating to "<url>"
        When user expands "<accordionSection>"
        Then the link with href "<anchorLink>" exists
        And the link with href "<citationLink>" exists
        Examples:
            | url                                          | citationLink     | accordionSection | anchorLink                                         |
            | /types/breast/hp/breast-ovarian-genetics-pdq | #cit/section_3.1 | 2730             | /types/breast/hp/breast-ovarian-genetics-pdq#_2731 |
            | /types/breast/hp/breast-treatment-pdq        | #cit/section_7.2 | 1452             | /types/breast/hp/breast-treatment-pdq#_1520        |
            | /espanol/tipos/seno/pro/tratamiento-seno-pdq | #cit/section_6.1 | 1543             | /espanol/tipos/seno/pro/tratamiento-seno-pdq#_1555 |