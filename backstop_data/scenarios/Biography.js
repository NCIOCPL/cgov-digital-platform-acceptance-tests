module.exports = [
    {
		label: 'biography whole page',
		testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
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
        ]
	},
    {
        label: 'biography whole page focus on social media link tablet',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        focusSelector: '.cgdp-profile-box__social-media a',
        selectors: [
            '.cgdp-profile-box.cgdp-profile-box--biography'
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
        label: 'biography focus on email link desktop',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        focusSelector: 'a.cgdp-profile-box__email',
        selectors: [
            '.cgdp-profile-box.cgdp-profile-box--biography'
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
]