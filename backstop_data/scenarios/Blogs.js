module.exports = [
    {
        label: 'blog all page components',
        testPath: '/news-events/cancer-currents-blog/2019/cancer-drugs-natural-products-nci-program',
        specific: true,
        delay: 2000,
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
            },
        ],

    },
    {
        label: 'blog archive expanded',
        testPath: '/news-events/cancer-currents-blog/2019/cancer-drugs-natural-products-nci-program',
        clickSelector: 'h2#archive',
        postInteractionWait: 1000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ],
        selectors: [
            '#blog-archive-accordion'
        ],
        selectorExpansion: true,

    },

    {
        label: 'blog with recommended content',
        testPath: '/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            }
        ]
    },
    {
        label: 'blog with citations and Related Resources',
        testPath: '/news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director',
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