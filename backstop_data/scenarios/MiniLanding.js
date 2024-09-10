module.exports = [
    {
        label: 'mini landing page all components',
        testPath: '/about-nci/organization/ccct',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
    },
    {
        label: 'mini landing focus on feature card',
        testPath: '/about-nci/organization/ccct',
        focusSelector: '.feature-card a',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
    },
    {
        label: 'mini landing hover over managed list item',
        testPath: '/about-nci/organization/ccct',
        hoverSelector: '.title-and-desc.title.desc.container a',
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
        label: 'mini landing page focus on managed list link',
        testPath: '/about-nci/organization/ccct',
        focusSelector: '.title-and-desc.title.desc.container a',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            'div[class*="desktop:grid-col-9"]'
        ],
        selectorExpansion: false,
    },
    {
        label: 'NCIDS mini landing page',
        testPath: '/test/ncids-mini-landing-template',
    },
    {
		label: 'NCIDS mini landing page with title and description list',
		testPath: '/test/ncids-li-title-desc',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
	},  
    {
		label: 'NCIDS mini landing page with title, image and description list Spanish',
		testPath: '/espanol/test-es/ncids-li-title-desc-img',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'tablet',
                width: 320,
                height: 800,
            },
        ],
	}, 
]