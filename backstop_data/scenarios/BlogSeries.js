module.exports = [
	{
		label: 'cancer currents blog',
		testPath: '/news-events/cancer-currents-blog',
	},
    {
		label: 'blog series blog title focus',
		testPath: '/news-events/cancer-currents-blog',
        focusSelector: '.item-list a.title',
        postInteractionWait: 1000,
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
        selectors: [
            '.item-list'
        ],
        selectorExpansion: true,
	}
]