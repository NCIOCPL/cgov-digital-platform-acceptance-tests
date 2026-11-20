module.exports = [
    {
		label: 'PDQ drug info summary whole page',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        delay: 2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ],
	},
    {
		label: 'PDQ drug info summary audio button focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'button.cgdp-audiofile.cgdp-audiofile--large',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ],
        selectors: [
            '#main-content'
        ],
        selectorExpansion: true,
       
	}
]