module.exports = [
    {
        label: 'blog all page components',
        testPath: '/news-events/cancer-currents-blog/2019/cancer-drugs-natural-products-nci-program',
        specific: true,
        delay: 2000,
        viewports: [

            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
    },
    {
        label: 'blog with recommended content',
        testPath: '/news-events/cancer-currents-blog/2019/pancreatic-cancer-targeting-kras-indirectly',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ]
    },
    // {
    //     label: 'blog with citations and Related Resources expand citation',
    //     testPath: '/news-events/cancer-currents-blog/2019/transition-lowy-nci-acting-director',
    //     viewports: [
    //         {
    //             label: 'mobile',
    //             width: 320,
    //             height: 800,
    //         }
    //     ],
    //     clickSelector: '#cgvCitationSl h2',
    //     postInteractionWait: 1000,
    //     selectors: [
    //         '#cgvCitationSl'
    //     ],
    //     selectorExpansion: true,
    // },

    {
        label: 'blog no lead image',
        testPath: '/news-events/cancer-currents-blog/2019/blog-post-no-lead-img',
        viewports: [
                    {
                        label: 'mobile',
                        width: 320,
                        height: 800,
                    }
                ]
    },
    {
        label: 'blog with lead image no caption',
        testPath: '/news-events/cancer-currents-blog/2019/blog-post-lead-img-no-caption',
        specific: true,
        viewports: [
                    {
                        label: 'mobile',
                        width: 320,
                        height: 800,
                    }
                ]
    }
]