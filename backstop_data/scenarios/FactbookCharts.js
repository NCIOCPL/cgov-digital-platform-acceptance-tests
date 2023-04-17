module.exports = [
	{
		label: 'AIDS Funding History factbook',
		testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
	},
    {
		label: 'Professional Judgment and Appropriation factbook',
		testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
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
    // {
	// 	label: 'Grant and Contract Awards factbook',
	// 	testPath: '/about-nci/budget/fact-book/extramural-programs/grant-contract-awards',
    //     viewports: [
    //         {
    //             label: 'desktop',
    //             width: 1025,
    //             height: 600,
    //         },
    //         {
    //             label: 'tablet',
    //             width: 650,
    //             height: 900,
    //         },
    //     ],
	// },
    {
		label: 'Comparison of Dollars, Positions & Space factbook',
		testPath: '/about-nci/budget/fact-book/historical-trends/comparison',
	},
    {
		label: 'Research Career "K" Awards factbook',
		testPath: '/about-nci/budget/fact-book/extramural-programs/k-awards',
	},
    {
		label: 'Extramural Funding factbook',
		testPath: '/about-nci/budget/fact-book/data/extramural',
	},
    {
		label: 'Dr. Ruth L. Kirschstein National Research Service Awards factbook',
		testPath: '/about-nci/budget/fact-book/extramural-programs/nrsa',
	},
    {
		label: 'NIH Management Fund factbook',
		testPath: '/about-nci/budget/fact-book/data/management-fund',
	},
    {
		label: 'Obligations factbook',
		testPath: '/about-nci/budget/fact-book/cancer-moonshot/moonshot-obligations',
	},
    {
		label: 'Research Project Grants factbook',
		testPath: '/about-nci/budget/fact-book/extramural-programs/rpg',
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
		label: 'NCI and Division Obligations factbook',
		testPath: '/about-nci/budget/fact-book/data/obligations',
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
		label: 'Program Structure factbook',
		testPath: '/about-nci/budget/fact-book/data/program-structure',
	},
    {
		label: 'Extramural vs Intramural & RMS Funding factbook',
		testPath: '/about-nci/budget/fact-book/historical-trends/extramural-intramural-rms',
	},
     {
		label: 'Professional Judgment and Appropriation factbook mobile breakpoint',
		testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        clickSelector:'section#comparison h2',
        postInteractionWait:2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
	},
    // {
	// 	label: 'Grant and Contract Awards factbook mobile breakpoint',
	// 	testPath: '/about-nci/budget/fact-book/extramural-programs/grant-contract-awards',
    //     clickSelector:'section#grant-contract-by-state-institution h2',
    //     scrollToSelector: '.highcharts-button-symbol',
    //     postInteractionWait:2000,
    //     viewports: [
    //         {
    //             label: 'mobile',
    //             width: 320,
    //             height: 800,
    //         },
    //     ],
	// },
    {
		label: 'Research Project Grants factbook mobile breakpoint',
		testPath: '/about-nci/budget/fact-book/extramural-programs/rpg',
        clickSelector:'section#awards h2',
        postInteractionWait:2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
	},
    {
		label: 'NCI and Division Obligations factbook mobile breakpoint',
		testPath: '/about-nci/budget/fact-book/data/obligations',
        clickSelector: 'section[id*="nci-oligations-by-mechanism"] h2',
        postInteractionWait:2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
	},


    {
		label: 'AIDS Funding disabling NIH data will show NCI only',
		testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
        clickSelector: 'button[aria-label="Show NIH"]',
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            'div[aria-label*="Highcharts interactive chart"]'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'Professional Judgment and Appropriation factbook hover over year',
		testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        // clickSelector: 'path[aria-label*="x, 2015"][aria-label*="President"]',
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        selectors: [
            'div[aria-label*="Highcharts interactive chart"]'
        ],
        selectorExpansion: false,
       
	},

]