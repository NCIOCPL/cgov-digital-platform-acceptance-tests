module.exports = [
	{
		label: 'blog all page components',
		testPath: '/news-events/cancer-currents-blog/2019/cancer-drugs-natural-products-nci-program',
        delay: 2000,
	},
    {
		label: 'blog featured posts link hover state ',
		testPath: '/news-events/cancer-currents-blog/2019/cancer-drugs-natural-products-nci-program',
        clickSelector: 'h2#archive',
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
            ' #blog-archive-accordion'
        ],
        selectorExpansion: true,
       
	},
]