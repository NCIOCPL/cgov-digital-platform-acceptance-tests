module.exports = [
	{
		label: 'cancer info summary whole page',
		testPath: '/test/types/liver/what-is-liver-cancer/diagnosis',
	},
    {
		label: 'cancer info summary OTP link focus',
		testPath: '/test/types/liver/what-is-liver-cancer/diagnosis',
        focusSelector: '.on-this-page a',
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
            '.on-this-page'
        ],
        selectorExpansion: false,
       
	},
    {
		label: 'cancer info summary expand accordion ',
		testPath: '/test/types/liver/what-is-liver-cancer/diagnosis',
        clickSelector: 'div.accordion h2',
        postInteractionWait: 1000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            'div.accordion'
        ],
        selectorExpansion: false,
	},
    {
		label: 'spanish cancer info summary with OTP links',
		testPath: '/espanol/tipos/seno/paciente/tratamiento-seno-pdq',
	},
]