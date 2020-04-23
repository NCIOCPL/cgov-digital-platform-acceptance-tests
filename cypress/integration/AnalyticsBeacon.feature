Feature: function test for a single metrics.com Beacon

    Scenario: Positive test click beacon of metrics.cancer.gov
        Given the beacon url is "https://metrics.cancer.gov/b/ss/ncidceg-cancerepidemiologyandgenetics,ncienterprise/1/JS-2.9.0-LAR3/s63894807692708?AQB=1&ndh=1&pf=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&ch=About%20Cancer&events=event33&v2=english&c4=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c71=2&c72=D%3DpageName&pe=lnk_o&pev1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1"
        Then the following analytics variables should be captured
            | evar43   | Section Menu                                                  |
            | events   | event33                                                       |
            | pev2     | SectionLinkClick                                              |
            | evar2    | english                                                       |
            | prop8    | english                                                       |
            | prop67   | D=pageName                                                    |
            | prop4    | D=pev1                                                        |
            | prop66   | feelings and cancer                                           |
            | prop4    | D=pev1                                                        |
            | prop70   | Feelings and Cancer                                           |
            | channel  | About Cancer                                                  |
            | AQB      | 1                                                             |
            | charSet  | UTF-8                                                         |
            | pageName | www-dev-ac.cancer.gov/about-cancer/coping/feelings/relaxation |

    Scenario: Positive test load beacon of metrics.cancer.gov
        Given the beacon url is "https://metrics.cancer.gov/b/ss/ncidevelopment,ncienterprise-dev,ncidevtest/1/JS-2.13.1-D7QN/s64838651954277?AQB=1&ndh=1&pf=1&t=7%2F3%2F2020%209%3A14%3A3%202%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2F&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2F&cc=USD&ch=NCI%20Homepage&pageType=cgvHomeLanding&events=event1%2Cevent47%3D3%2Cevent92%3D10&c1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2F&v1=www-dev-ac.cancer.gov%2F&h1=www-dev-ac.cancer.gov&v2=english&c3=%2F&v5=Tablet&c6=Comprehensive%20Cancer%20Information&c8=english&c10=Comprehensive%20Cancer%20Information%20-%20National%20Cancer%20Institute&c25=03%2F30%2F2020%20-%2008%3A00&c26=2020%7C4%7C7%7C9&c29=9%3A14%20AM%7CTuesday&c42=Normal&c44=NCI%20Homepage&v44=NCI%20Homepage&c48=28pct%7C28pct%7C3482px%7Cd%3Dpagename&c61=www-dev-ac.cancer.gov%2F&c64=29%7C29&c65=3&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1011&bh=971&AQE=1"
        Then the following analytics variables should be captured
            | prop44   | NCI Homepage                                                 |
            | evar44   | NCI Homepage                                                 |
            | prop61   | www-dev-ac.cancer.gov/                                       |
            | pageType | cgvHomeLanding                                               |
            | channel  | NCI Homepage                                                 |
            | pageName | www-dev-ac.cancer.gov/                                       |
            | prop6    | Comprehensive Cancer Information                             |
            | prop3    | /                                                            |
            | prop6    | Comprehensive Cancer Information                             |
            | prop8    | english                                                      |
            | prop10   | Comprehensive Cancer Information - National Cancer Institute |
            | prop44   | NCI Homepage                                                 |
            | evar5    | Tablet                                                       |
            | evar1    | www-dev-ac.cancer.gov/                                       |
            | AQB      | 1                                                            |
            | charSet  | UTF-8                                                        |



    Scenario Outline: Negative beacon test with invalid prop, evar, hier and list variables
        Given the app should throw and error with incorrect url "<url>"
        Examples:
            | url                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
            | https://metrics.cancer.gov/b/ss/ncidevelopment,ncienterprise-dev,ncidevtest/1/JS-2.13.1-D7QN/s67255001023233?AQB=1&ndh=1&c900=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&ch=About%20Cancer&events=event33&v2=english&c4=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c79=2&c72=D%3DpageName&pe=lnk_o&pev1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1        |
            | https://metrics.cancer.gov/b/ss/ncidceg-cancerepidemiologyandgenetics,ncienterprise/1/JS-2.9.0-LAR3/s63894807692708?AQB=1&ndh=1&pf=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&ch=About%20Cancer&events=event33&v2=english&c4=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c71=2&c72=D%3DpageName&pe=lnk_o&l9=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1     |
            | https://metrics.cancer.gov/b/ss/ncidceg-cancerepidemiologyandgenetics,ncienterprise/1/JS-2.9.0-LAR3/s63894807692708?AQB=1&ndh=1&pf=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&ch=About%20Cancer&events=event33&v2=english&v251=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c71=2&c72=D%3DpageName&pe=lnk_o&pev1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1 |
            | https://metrics.cancer.gov/b/ss/ncidceg-cancerepidemiologyandgenetics,ncienterprise/1/JS-2.9.0-LAR3/s63894807692708?AQB=1&ndh=1&pf=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&h7=About%20Cancer&events=event33&v2=english&c4=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c71=2&c72=D%3DpageName&pe=lnk_o&pev1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1   |


    Scenario: testing events processing
        Given the beacon url is "https://metrics.cancer.gov/b/ss/ncidceg-cancerepidemiologyandgenetics,ncienterprise/1/JS-2.9.0-LAR3/s63894807692708?AQB=1&ndh=1&pf=1&t=3%2F3%2F2020%2015%3A59%3A40%205%20240&D=D%3D&fid=574675B43351DA11-1FF4FEAB90521619&ce=UTF-8&ns=nci&pageName=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&g=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&cc=USD&ch=About%20Cancer&events=event33,event1=10,event:123&v2=english&c4=D%3Dpev1&c8=english&v43=Section%20Menu&v45=Coping%20with%20Cancer&c66=feelings%20and%20cancer&c67=D%3DpageName&c69=Coping%20with%20Cancer&c70=Feelings%20and%20Cancer&c71=2&c72=D%3DpageName&pe=lnk_o&pev1=https%3A%2F%2Fwww-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings&pev2=SectionLinkClick&c.&a.&activitymap.&page=www-dev-ac.cancer.gov%2Fabout-cancer%2Fcoping%2Ffeelings%2Frelaxation&link=SectionLinkClick&region=nvcgSlSectionNav&pageIDType=1&.activitymap&.a&.c&s=1680x1050&c=24&j=1.6&v=N&k=Y&bw=1310&bh=796&lrt=83&AQE=1"
        Then there are captured events
            | event     | value     |
            | event33   |           |
            | event1    | /\d{1,2}/ |
            | event:123 |           |

