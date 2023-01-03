module.exports = [
	{
		label: 'borderless cards whole page',
		testPath: '/test/borderless-card',
	},
    {
		label: 'borderless cards cranberry title on hover desktop and tablet',
		testPath: '/test/borderless-card',
        hoverSelector: '.borderless-text-container h2 a',
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
        selectors: [
            '.default-borderless-theme'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards cranberry title on hover mobile',
		testPath: '/test/borderless-card',
        hoverSelector: '.image-hover.borderless-image-container h2 a',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '.default-borderless-theme'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards title on focus desktop and tablet',
		testPath: '/test/borderless-card',
        focusSelector: '.borderless-text-container h2 a',
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
        selectors: [
            '.default-borderless-theme'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards title on focus mobile',
		testPath: '/test/borderless-card',
        focusSelector: '.image-hover.borderless-image-container h2 a',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '.default-borderless-theme'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards button on focus all breakpoints',
		testPath: '/test/borderless-card',
        focusSelector: '.borderless-button',
        selectors: [
            '.default-borderless-theme'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards accent cool focus whole card',
		testPath: '/test/borderless-card',
        focusSelector: '.accent-cool a',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            '.accent-cool'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards accent cool focus on title',
		testPath: '/test/borderless-card',
        focusSelector: '.accent-cool .borderless-image-right:has(.borderless-button) h2 a',
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            '.accent-cool:has(.borderless-button)'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards accent cool focus on image tablet',
		testPath: '/test/borderless-card',
        focusSelector: '.accent-cool .borderless-image-right:has(.borderless-button) .borderless-image-container :nth-child(2)',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        selectors: [
            '.accent-cool:has(.borderless-button)'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'borderless cards accent cool focus on button mobile',
		testPath: '/test/borderless-card',
        focusSelector: '.accent-cool .borderless-image-right:has(.borderless-button) .borderless-button',
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        selectors: [
            '.accent-cool:has(.borderless-button)'
        ],
        selectorExpansion: false,
       
	},
]