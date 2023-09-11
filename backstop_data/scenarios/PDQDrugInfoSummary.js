module.exports = [
	{
		label: 'PDQ drug info summary whole page',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        delay: 2000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
	},
    {
		label: 'PDQ drug info summary FDA label info focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'a[href="https://dailymed.nlm.nih.gov/dailymed/search.cfm?labeltype=all&query=BEVACIZUMAB&pagesize=20&page=1"]',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        selectors: [
            'div[class="cgdpl desktop:grid-col-9"]'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'PDQ drug info summary audio button focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'a.CDR_audiofile',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            'div[class="cgdpl desktop:grid-col-9"]'
        ],
        selectorExpansion: true,
       
	},
    {
		label: 'PDQ drug info summary FDA glossified term focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'a[href*="/Common/PopUps/popDefinition.aspx?id=444973&version=Patient&language=English"]',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            'div.accordion'
        ],
        selectorExpansion: false,
       
	}
]