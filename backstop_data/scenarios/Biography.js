module.exports = [
    {
		label: 'biography whole page',
		testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        delay: 2000,
	},
    {
        label: 'biography focus on email link desktop',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        focusSelector: '.profile-contact-email a',
        selectors: [
            '#nvcgSlProfilePanel'
        ],
        selectorExpansion: false,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
    },
    {
        label: 'biography whole page focus on social media link tablet',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        focusSelector: '.profile-panel-social-media a',
        selectors: [
            ' #nvcgSlProfilePanel'
        ],
        selectorExpansion: false,
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
    },
    {
        label: 'biography expand accordion and then hover over link',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
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