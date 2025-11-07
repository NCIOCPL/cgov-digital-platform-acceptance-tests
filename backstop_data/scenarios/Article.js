module.exports = [
    {
        label: 'Article with citations, related resources and OTP',
        testPath: '/about-cancer/treatment/side-effects',
    },
    {
        label: 'Spanish Article with citations, related resources and OTP',
        testPath: '/espanol/cancer/tratamiento/efectos-secundarios',
    },
    {
        label: 'Article with lead and embedded image',
        testPath: '/test/lead-img-caption-credit',
    },
    {
        label: 'Lead image no caption and credit',
        testPath: '/test/lead-img-no-caption-credit',
    },
    {
        label: 'No lead image',
        testPath: '/test/no-lead-img',
    },
    {
        label: 'Article Summary box',
        testPath: '/test/article-body-summary-box',
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
    },
    {
        label: 'Article pull quote',
        testPath: '/test/pull-quote-test',
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
    },
    {
        label: 'Article pull spanish quote',
        testPath: '/espanol/test-es/pull-quote-test-es',
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
    },
    {
        label: 'Article NCIDS tables',
        testPath: '/test/article-body-section-ncids-tables',
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
    },
    {
        label: 'Article NCIDS sortable tables',
        testPath: '/test/article-body-section-ncids-sortable-table',
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
    },
    {
        label: 'Article glossified links',
        testPath: '/test/ncids-article-def-link-test',
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
    },
]