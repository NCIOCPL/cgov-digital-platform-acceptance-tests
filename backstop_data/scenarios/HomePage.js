module.exports = [
	{
		label: 'OLD home page eng',
		testPath: '/cgdpl',
	},
    {
		label: 'OLD home page spanish',
		testPath: '/espanol/cgdpl',
	},
	{
		label: 'NCIDS home page eng ',
		testPath: '/',
		selectors: [
            'body.has-translated-content'
        ],
        specific: true,
		viewports: [
            {
				label: 'mobile',
                width: 320,
                height: 5000,
            },
			{
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'tablet',
                width: 650,
                height: 5000,
            },
		]
	},
    {
		label: 'NCIDS home page spanish',
		testPath: '/espanol',
		selectors: [
            'body.has-translated-content'
        ],
        specific: true,
		viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
            {
                label: 'tablet',
                width: 650,
                height: 5000,
            },
			{
				label: 'mobile',
                width: 320,
                height: 5000,
            }
		]
	}
]