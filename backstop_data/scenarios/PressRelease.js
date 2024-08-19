module.exports = [
    {
    	label: 'press release all page components',
    	testPath: '/annual-report-nation-2018',
        delay: 2000,
    },
    {
        label: 'press release expand related resources accordion and hover over link',
        testPath: '/annual-report-nation-2018',
        chainedActionSelectors: [
            {
                action: 'click',
                selector: '.related-resources.list h2',
            },
            {
                action: 'hover',
                selector: 'a.title',
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
    {
    	label: 'press release with related resources and citations',
    	testPath: '/news-events/press-releases/2018/leukemia-cll-ibrutinib-trial',
        delay: 2000,
    },
    {
    	label: 'spanish press release with related resources and citations expand citation',
    	testPath: '/espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio',
        clickSelector: '#cgvCitationSl h2',
        postInteractionWait: 1000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '#cgvCitationSl'
        ],
        selectorExpansion: true,
    }
]