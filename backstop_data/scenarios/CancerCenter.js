module.exports = [
    {
		label: 'cancer center all page components',
		testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
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
        label: 'cancer center focus on website link tablet',
        testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
        focusSelector: 'a.cgdp-profile-box__website-url',
        selectors: [
            '.cgdp-profile-box.cgdp-profile-box--cancer-center'
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
        label: 'cancer center focus on phone link desktop',
        testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
        focusSelector: '.cgdp-profile-box__address div a',
        selectors: [
            '.cgdp-profile-box.cgdp-profile-box--cancer-center'
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