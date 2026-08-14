module.exports = [
    {
		label: 'cancer research list page on hover link turns cranberry',
		testPath: '/types/breast/research',
        hoverSelector: 'a.title',
	},
    {
        label: 'cancer research list page glossified links',
        testPath: '/test/dictionary-link-test-cancer-research',
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
            }
        ]
    }
]