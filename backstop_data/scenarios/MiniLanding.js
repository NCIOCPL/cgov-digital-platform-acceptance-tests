module.exports = [
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
    {
		label: 'NCIDS mini landing page with Wide Guide Cards',
		testPath: '/test/ncids-mini-landing-wide-guide-card',
	},
    {
		label: 'NCIDS mini landing page imageless cards',
		testPath: '/test/ncids-imageless-card-test',
	},
    {
		label: 'NCIDS  mini landing page flag cards',
		testPath: '/test/ncids-flag-card-test',
	}
]