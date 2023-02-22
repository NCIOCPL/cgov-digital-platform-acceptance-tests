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
                selector: '.related-resources.list h6',
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
]