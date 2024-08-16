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
    }
]