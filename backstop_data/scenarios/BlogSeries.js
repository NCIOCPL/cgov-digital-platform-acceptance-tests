module.exports = [
	{
		label: 'cancer currents blog',
		testPath: '/news-events/cancer-currents-blog',
	},
    {
		label: 'blog series blog title focus',
		testPath: '/news-events/cancer-currents-blog',
        focusSelector: '.usa-collection a.usa-link',
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
            '.usa-collection'
        ],
        selectorExpansion: true,
	},
    {
		label: 'blog series blog topic',
		testPath: '/news-events/cancer-currents-blog?topic=biology',
	
     viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
            ]
        },
        {
		label: 'cancer currents blog spanish',
		testPath: '/espanol/noticias/temas-y-relatos-blog',
	
     viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
            ]
        }

]