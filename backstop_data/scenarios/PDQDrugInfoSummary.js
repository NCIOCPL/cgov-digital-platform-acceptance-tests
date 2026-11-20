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
		label: 'PDQ drug combination whole page',
		testPath: '/about-cancer/treatment/drugs/bep',
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
            '#main-content'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'PDQ drug info summary audio button focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'button.cgdp-audiofile.cgdp-audiofile--large',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            '#main-content'
        ],
        selectorExpansion: true,
       
	},
    {
		label: 'PDQ drug info summary FDA glossified term focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'a[href*="publications/dictionaries/cancer-terms/def/444973"]',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            '.usa-prose.usa-prose--ncids-full-html'
        ],
        selectorExpansion: false,
       
	}
]