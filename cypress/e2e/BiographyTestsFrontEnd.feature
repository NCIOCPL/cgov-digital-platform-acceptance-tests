Feature: As a user, I want to able to see individual's biography page with all information

    Scenario: user can see biography page with all information about individual featured
        Given user is navigating to "/about-cancer/coping/feelings/relaxation/loukissas-jen-biography"
        Then page title is "Jennifer Bio"
        And the individuals title is "Chief, Communications Team"
        And the following organizations are listed for this individual
            | organization                                                       |
            | National Cancer Institute                                          |
            | Division of Cancer Epidemiology & Genetics, Office of the Director |
        And individuals office is at "NCI Shady Grove Campus | Room 7E434"
        And contact phone number is "240-276-7367"
        And contact email is "loukissj@mail.nih.gov"
        And the following social media links are present
            | socialMedia | href                                                  |
            | twitter     | http://www.twitter.com/jloukissas                     |
            | linkedin    | http://www.linkedin.com/in/jennifer-loukissas-b09b254 |
        And biography description contains text "Follow Ms. Loukissas on Twitter "
        And "Related Resources" section contains the following links
            | title                               | href                                     |
            | Feelings and Cancer                 | /about-cancer/coping/feelings            |
            | Overridden Title                    | /about-cancer/coping/feelings/relaxation |
            | National Institute of Mental Health | http://www.nimh.nih.gov/                 |
            | Google.com                          | http://www.google.com/                   |
            | Yahoo.com                           | http://www.yahoo.com/                    |
        And "Updated:" date stamp displays "February 7, 2019"

    Scenario: user can see biography page without a date stamp
        Given user is navigating to "/about-cancer/coping/feelings/relaxation/biography-no-date"
        Then page title is "[No Date] Biography Title"
        And date stamp does not exist


    Scenario: user can see biography page with scientific publications and institute links
        Given user is navigating to "/about-cancer/coping/feelings/relaxation/chanock-stephen"
        Then page title is "Stephen J. Chanock, M.D."
        And the individuals title is "Director"
        And the following organizations with links are listed for this individual
            | organization                               | url                     |
            | National Cancer Institute                  | https://www.cancer.gov  |
            | Division of Cancer Epidemiology & Genetics | https://dceg.cancer.gov |
        And individuals office is at "NCI Shady Grove Campus | Room 7E412"
        And contact phone number is "240-276-7150"
        And contact email is "chanocks@mail.nih.gov"
        And the following social media links are present
            | socialMedia | href                              |
            | twitter     | http://www.twitter.com/NCIChanock |
        And "Scientific Publications" icon link has a href "https://dceg2.cancer.gov/cgi-bin-pubsearch/pubsearch/index.pl?EntryLimit=0&branch=ALL&searchTxtAuth=chanock%20s&authorOption=exact&pi=0010114442"
        And biography description contains text "Follow Dr. Chanock on Twitter"
        And "Updated:" date stamp displays "February 7, 2019"