module.exports = [
    {
        label: 'event whole page focus on email link desktop',
        testPath: '/about-cancer/coping/nci-workshop-event',
        focusSelector: 'a[href$="icalendar"]',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
    },
    {
        label: 'event whole page focus on social media link tablet',
        testPath: '/about-cancer/coping/nci-workshop-event',
        focusSelector: 'a[href="http://www.cnn.com/"]',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
    },
    {
        label: 'event accordion on mobile',
        testPath: '/about-cancer/coping/nci-workshop-event',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '.related-resources.list h6'
        ],
        selectorExpansion: false,
    },
    {
        label: 'event expand accordion and then hover over link',
        testPath: '/about-cancer/coping/nci-workshop-event',
        chainedActionSelectors: [
            {
                action: 'click',
                selector: '.related-resources.list h6',
            },
            {
                action: 'hover',
                selector: '.related-resources.list a',
            },
        ],
        postInteractionWait: 1000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
    },
]