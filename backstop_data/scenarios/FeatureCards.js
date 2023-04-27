module.exports = [
	{
		label: 'NCIDS 3 internal feature card row',
		testPath: '/ncids-internal-feature-card-test',
	},
    {
		label: 'NCIDS 3 external feature card row',
		testPath: '/ncids-external-feature-card-test',
	},
    {
		label: 'card title hover',
		testPath: '/ncids-internal-feature-card-test',
        hoverSelector: 'a[href="/test/internal-card-test-article"]',
        delay: 3000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ],
        selectors: [
            'ul.nci-card-group'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'feature card focus',
		testPath: '/ncids-internal-feature-card-test',
        focusSelector: 'a[href="/test/internal-card-test-article"]',
        delay: 3000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ],
        selectors: [
            'section[class="usa-section usa-section--light cgdp-feature-card-row"]'
        ],
        selectorExpansion: false,
       
	}
]