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
        focusSelector: 'a[href="http://www.dukecancerinstitute.org/"]',
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
        label: 'cancer center focus on phone link desktop',
        testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
        focusSelector: 'a[href="tel:1-888-275-3853"]',
        selectors: [
            ' #nvcgSlProfilePanel'
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