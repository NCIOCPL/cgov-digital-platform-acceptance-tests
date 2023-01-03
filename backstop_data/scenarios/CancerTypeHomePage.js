module.exports = [
	{
		label: 'cancer type home page all components',
		testPath: '/types/breast',
	},
    {
		label: 'cancer type home page hover over link without cranberry ',
		testPath: '/types/breast',
        hoverSelector: 'a[href="/types/breast/patient/breast-treatment-pdq"]',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            'div[class$="cthp-treatment"]'
        ],
        selectorExpansion: true,
       
	},
    {
		label: 'cancer type home page hover over link with cranberry ',
		testPath: '/types/breast',
        hoverSelector: 'a.title',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        selectors: [
            'div[class$="cthp-treatment"]'
        ],
        selectorExpansion: true,
       
	},
    {
		label: 'cancer type home page expand accordion and then hover over link',
		testPath: '/types/breast',
        chainedActionSelectors: [
            {
                action: 'click',
                selector: 'div[class$="cthp-treatment"] h2',
            },
            {
                action: 'hover',
                selector: 'div[class$="cthp-treatment"] a.title',
            },
        ],
        postInteractionWait: 1000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
	},
    {
		label: 'cancer type home page focus on video caption',
		testPath: '/types/breast',
        focusSelector: 'a.arrow-link.cthp-mm-text-area',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            '.cthp-survival'
        ],
        selectorExpansion: true,
	}
]