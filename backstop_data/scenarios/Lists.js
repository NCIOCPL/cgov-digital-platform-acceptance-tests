module.exports = [
    {
        label: 'list item title',
        testPath: '/test/mini-landing/li-title',
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
        hoverSelector: 'a.title',
        selectors: [
            '#content'
        ],
        selectorExpansion: true,
    },
    {
        label: 'list item title description',
        testPath: '/test/mini-landing/li-title-desc',
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
        hoverSelector: 'a.title',
        selectors: [
            '#content'
        ],
        selectorExpansion: true,
    },
    {
        label: 'list item title description image',
        testPath: '/test/mini-landing/li-title-desc-img',
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
        hoverSelector: 'a.title',
        selectors: [
            '#content'
        ],
        selectorExpansion: true,
    }
]