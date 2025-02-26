module.exports = [
    {
        label: 'AIDS Funding History factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__aids-funding"]',
        selectors: [
            'div[id*="NCI-Chart__aids-funding"]'
        ]
    },
    {
        label: 'Professional Judgment and Appropriation factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        prodPath: true,
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
        readySelector:'div[id*="NCI-Chart__appropriations"]',
        selectors: [
            'div[id*="NCI-Chart__appropriations"]'
        ] 
    },
    // {
    //  label: 'Grant and Contract Awards factbook',
    //  testPath: '/about-nci/budget/fact-book/extramural-programs/grant-contract-awards',
    //     viewports: [
    //         {
    //             label: 'desktop',
    //             width: 1025,
    //             height: 600,
    //         },
    //         {
    //             label: 'tablet',
    //             width: 650,
    //             height: 900,
    //         },
    //     ],
    // },
    {
        label: 'Comparison of Dollars, Positions & Space factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/comparison',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__compare-html-amount"]',
        selectors: [
            'div[id*="NCI-Chart__compare-html-amount"]'
        ] 
    },
    {
        label: 'Research Career "K" Awards factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/k-awards',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__kawards-pie"]',
        selectors: [
            'div[id*="NCI-Chart__kawards-pie"]'
        ] 
    },
    {
        label: 'Extramural Funding factbook',
        testPath: '/about-nci/budget/fact-book/data/extramural',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__html-extramural"]',
        selectors: [
            'div[id*="NCI-Chart__html-extramural"]'
        ] 
    },
    {
        label: 'Dr. Ruth L. Kirschstein National Research Service Awards factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/nrsa',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__html-nrsa"]',
        selectors: [
            'div[id*="NCI-Chart__html-nrsa"]'
        ] 
    },
    {
        label: 'NIH Management Fund factbook',
        testPath: '/about-nci/budget/fact-book/data/management-fund',
        prodPath: true,
        selectors: [
            'div[id*="NCI-Chart__management-fund"]'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
    },
    {
        label: 'Obligations factbook',
        testPath: '/about-nci/budget/fact-book/cancer-moonshot/moonshot-obligations',
        prodPath: true,
        readySelector: 'div[id*="NCI-Chart__moonshot-obligations"]',
        selectors: [
            'div[id*="NCI-Chart__moonshot-obligations"]'
        ] 
    },
    {
        label: 'Research Project Grants factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/rpg',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__number-rpg-awards"]',
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
            'div[id*="NCI-Chart__number-rpg-awards"]'
        ]
    },
    {
        label: 'NCI and Division Obligations factbook',
        testPath: '/about-nci/budget/fact-book/data/obligations',
        prodPath: true,
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
        readySelector:'g.highcharts-series-group',
        selectors: [
            'div[id*="NCI-Chart_obligations-mechanism"]'
        ] 
    },
    {
        label: 'Program Structure factbook',
        testPath: '/about-nci/budget/fact-book/data/program-structure',
        prodPath: true,
        readySelector: 'div[id*="NCI-Chart__program-structure"]',
        selectors: [
            'div[id*="NCI-Chart__program-structure"]'
        ] 
    },
    {
        label: 'Extramural vs Intramural & RMS Funding factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/extramural-intramural-rms',
        prodPath: true,
        readySelector:'div[id*="NCI-Chart__rms-funding"]',
        selectors: [
            'div[id*="NCI-Chart__rms-funding"]'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ], 
    },
    {
        label: 'Extramural vs Intramural & RMS Funding factbook tab and mob',
        testPath: '/about-nci/budget/fact-book/historical-trends/extramural-intramural-rms',
        prodPath: true,
        // readySelector:'g.highcharts-axis.highcharts-yaxis',
        selectors: [
            'div[id*="NCI-Chart__rms-funding"]'
        ],
        viewports: [
                    {
                        label: 'mobile',
                        width: 320,
                        height: 800,
                    },
                    {
                        label: 'tablet',
                        width: 650,
                        height: 900,
                    },
                ],
    },

     {
        label: 'Professional Judgment and Appropriation factbook mobile breakpoint',
        testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        prodPath: true,
        clickSelector:'section#comparison h2',
        postInteractionWait:4000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            'div[id*="NCI-Chart__appropriations"]'
        ],
        selectorExpansion: false
    },
    // {
    //  label: 'Grant and Contract Awards factbook mobile breakpoint',
    //  testPath: '/about-nci/budget/fact-book/extramural-programs/grant-contract-awards',
    //     clickSelector:'section#grant-contract-by-state-institution h2',
    //     scrollToSelector: '.highcharts-button-symbol',
    //     postInteractionWait:2000,
    //     viewports: [
    //         {
    //             label: 'mobile',
    //             width: 320,
    //             height: 800,
    //         },
    //     ],
    // },
    {
        label: 'Research Project Grants factbook mobile breakpoint',
        testPath: '/about-nci/budget/fact-book/extramural-programs/rpg',
        prodPath: true,
        clickSelector:'section#awards h2',
        postInteractionWait:2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            'div[id*="NCI-Chart__number-rpg-awards"]'
        ] 
    },
    {
        label: 'NCI and Division Obligations factbook mobile breakpoint',
        testPath: '/about-nci/budget/fact-book/data/obligations',
        prodPath: true,
        clickSelector: 'section[id*="nci-oligations-by-mechanism"] h2',
        postInteractionWait:4000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            'div[id*="NCI-Chart_obligations-mechanism"]'
        ],
        selectorExpansion: false,
    },


    {
        label: 'AIDS Funding disabling NIH data will show NCI only',
        testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
        prodPath: true,
        clickSelector: 'button[aria-label="Show NIH"]',
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        selectors: [
            'div[aria-label*="Highcharts interactive chart"]'
        ],
        selectorExpansion: false,
       
    },
    {
        label: 'Professional Judgment and Appropriation factbook hover over year',
        testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        prodPath: true,
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        readySelector:'div#NCI-Chart__appropriations',
        selectors: [
            'div#NCI-Chart__appropriations'
        ],
        selectorExpansion: false,
       
    },

]
