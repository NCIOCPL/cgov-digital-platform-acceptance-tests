module.exports = [
    {
        label: 'AIDS Funding History factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
        prodPath: true,
        pause: true,
        readySelector: '#NCI-Chart__aids-funding .highcharts-container',
        selectors: [
            '#NCI-Chart__aids-funding .highcharts-container'
        ]
    },
    {
        label: 'Professional Judgment and Appropriation factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        prodPath: true,
        pause: true,
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
        readySelector: '#NCI-Chart__appropriations .highcharts-container',
        selectors: [
            '#NCI-Chart__appropriations .highcharts-container'
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
        pause: true,
        readySelector: '#NCI-Chart__compare-html-amount .highcharts-container',
        selectors: [
            '#NCI-Chart__compare-html-amount .highcharts-container'
        ]
    },
    {
        label: 'Research Career "K" Awards factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/k-awards',
        prodPath: true,
        pause: true,
        readySelector: '#NCI-Chart__kawards-pie .highcharts-container',
        selectors: [
            '#NCI-Chart__kawards-pie .highcharts-container'
        ]
    },
    {
        label: 'Extramural Funding factbook',
        testPath: '/about-nci/budget/fact-book/data/extramural',
        prodPath: true,
        pause: true,
        readySelector: '#NCI-Chart__html-extramural .highcharts-container',
        selectors: [
            '#NCI-Chart__html-extramural .highcharts-container'
        ]
    },
    {
        label: 'Dr. Ruth L. Kirschstein National Research Service Awards factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/nrsa',
        prodPath: true,
        pause: true,
        postInteractionWait: 4000,
        readySelector: '#NCI-Chart__html-nrsa .highcharts-container',
        selectors: [
            '#NCI-Chart__html-nrsa .highcharts-container'
        ]
    },
    {
        label: 'NIH Management Fund factbook',
        testPath: '/about-nci/budget/fact-book/data/management-fund',
        prodPath: true,
        pause: true,
        postInteractionWait: 4000,
        selectors: [
            '#NCI-Chart__management-fund .highcharts-container'
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
        pause: true,
        postInteractionWait: 4000,
        readySelector: '#NCI-Chart__moonshot-obligations .highcharts-container',
        selectors: [
            '#NCI-Chart__moonshot-obligations .highcharts-container'
        ]
    },
    {
        label: 'Research Project Grants factbook',
        testPath: '/about-nci/budget/fact-book/extramural-programs/rpg',
        prodPath: true,
        pause: true,
        postInteractionWait: 4000,
        readySelector: '#NCI-Chart__number-rpg-awards .highcharts-container',
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
            '#NCI-Chart__number-rpg-awards'
        ]
    },
    {
        label: 'NCI and Division Obligations factbook',
        testPath: '/about-nci/budget/fact-book/data/obligations',
        prodPath: true,
        pause: true,
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
        readySelector: '#NCI-Chart_obligations-mechanism .highcharts-container',
        selectors: [
            '#NCI-Chart_obligations-mechanism .highcharts-container'
        ]
    },
    {
        label: 'Program Structure factbook',
        testPath: '/about-nci/budget/fact-book/data/program-structure',
        prodPath: true,
        pause: true,
        readySelector: '#NCI-Chart__program-structure .highcharts-container',
        selectors: [
            '#NCI-Chart__program-structure .highcharts-container'
        ]
    },
    {
        label: 'Extramural vs Intramural & RMS Funding factbook',
        testPath: '/about-nci/budget/fact-book/historical-trends/extramural-intramural-rms',
        prodPath: true,
        pause: true,
        readySelector: '#NCI-Chart__rms-funding .highcharts-container',
        selectors: [
            '#NCI-Chart__rms-funding .highcharts-container'
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
        pause: true,
        selectors: [
            '#NCI-Chart__rms-funding .highcharts-container'
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
        pause: true,
        clickSelector: 'section#comparison h2',
        postInteractionWait: 4000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '#NCI-Chart__appropriations .highcharts-container'
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
        pause: true,
        clickSelector: 'section#awards h2',
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '#NCI-Chart__number-rpg-awards .highcharts-container'
        ]
    },
    {
        label: 'NCI and Division Obligations factbook mobile breakpoint',
        testPath: '/about-nci/budget/fact-book/data/obligations',
        prodPath: true,
        pause: true,
        clickSelector: 'section[id*="nci-oligations-by-mechanism"] h2',
        postInteractionWait: 4000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '#NCI-Chart_obligations-mechanism .highcharts-container'
        ],
        selectorExpansion: false,
    },


    // {
    //     label: 'AIDS Funding disabling NIH data will show NCI only',
    //     testPath: '/about-nci/budget/fact-book/historical-trends/aids-funding',
    //     prodPath: true,
    // pause: true,
    //     clickSelector: 'button[aria-label="Show NIH"]',
    //     postInteractionWait: 2000,
    //     viewports: [
    //         {
    //             label: 'desktop',
    //             width: 1025,
    //             height: 600,
    //         },
    //     ],
    //     selectors: [
    //         'div[aria-label*="Highcharts interactive chart"]'
    //     ],
    //     selectorExpansion: false,

    // },
    {
        label: 'Professional Judgment and Appropriation factbook hover over year',
        testPath: '/about-nci/budget/fact-book/historical-trends/bypass-appropriations',
        prodPath: true,
        pause: true,
        postInteractionWait: 2000,
        viewports: [
            {
                label: 'tablet',
                width: 650,
                height: 900,
            },
        ],
        readySelector: '#NCI-Chart__appropriations .highcharts-container',
        selectors: [
            '#NCI-Chart__appropriations .highcharts-container'
        ],
        selectorExpansion: false,

    },

]
