module.exports = [
    {
		label: 'cancer research list page on hover link turns cranberry',
		testPath: '/types/breast/research',
        hoverSelector: 'a.title',
	},
    {
		label: 'cancer research list page focus on link media',
		testPath: '/types/breast/research',
        focusSelector: 'a[href="/about-nci/organization/nci-at-a-glance"]',
        selectors: [
            '.grid-row.grid-gap'
        ],
        selectorExpansion: false,
       
	},
]