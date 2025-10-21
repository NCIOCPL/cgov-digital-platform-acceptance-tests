module.exports = [
	{
		label: 'usa prose english',
		testPath: '/test/test-usa-prose',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ]
	},
    {
		label: 'usa prose spanish',
		testPath: '/espanol/test-es/test-usa-prose',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ]
	}
]