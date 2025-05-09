module.exports = [
    {
    	label: 'press release all page components',
    	testPath: '/annual-report-nation-2018',
        delay: 2000,
    },
    // {
    //     label: 'press release expand related resources accordion and hover over link',
    //     testPath: '/annual-report-nation-2018',
    //     chainedActionSelectors: [
    //         {
    //             action: 'click',
    //             selector: '.cgdp-related-resources.list h2',
    //         },
    //         {
    //             action: 'hover',
    //             selector: 'a.title',
    //         },
    //     ],
    //     postInteractionWait: 1000,
    //     viewports: [
    //         {
    //             label: 'mobile',
    //             width: 320,
    //             height: 800,
    //         },
    //     ],
    // },
    {
    	label: 'press release with related resources and citations',
    	testPath: '/test/press-release-citation-norr',
        delay: 2000,
    },
    {
    	label: 'press release with with lead image with caption and enlarge',
    	testPath: '/test/press-release-lead-img-caption-enlarge',
        delay: 2000,
    },   {
    	label: 'press release with with lead image with caption',
    	testPath: '/test/press-release-lead-img-caption',
        delay: 2000,
    },   {
    	label: 'press release with no lead image',
    	testPath: '/test/press-release-no-lead-img',
        delay: 2000,
    },
    
    // {
    // 	label: 'spanish press release with related resources and citations expand citation',
    // 	testPath: '/espanol/noticias/comunicados-de-prensa/2018/leucemia-llc-ibrutinib-estudio',
    //     clickSelector: '.cgdp-article-footer-citation h2',
    //     postInteractionWait: 1000,
    //     viewports: [
    //         {
    //             label: 'mobile',
    //             width: 320,
    //             height: 800,
    //         },
    //     ],
    //     selectors: [
    //         '.cgdp-article-footer-citation'
    //     ],
    //     selectorExpansion: true,
    // }
]