module.exports = [
    {
		label: 'PDQ drug info summary whole page',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        delay: 2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ],
	},
    {
		label: 'PDQ drug info summary audio button focus',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        focusSelector: 'a.CDR_audiofile',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ],
        selectors: [
            'div[class="cgdpl desktop:grid-col-9"]'
        ],
        selectorExpansion: true,
       
	},
    {
		label: 'PDQ drug info summary expand accordion and focus on glossified term link',
		testPath: '/about-cancer/treatment/drugs/bevacizumab',
        chainedActionSelectors: [
            {
                action: 'click',
                selector: 'div.accordion h2',
            },
            {
                action: 'focus',
                selector: 'a[href*="/Common/PopUps/popDefinition.aspx?id=46283&version=Patient&language=English"]',
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
        selectors: [
            'div.accordion'
        ],
        selectorExpansion: true,
	},
]