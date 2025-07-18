module.exports = [
    {
        label: 'cancer center all page components',
        testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
        delay: 2000,
        viewports: [
          
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
    },
    
    {
        label: 'cancer center accordion on mobile',
        testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            },
        ],
        selectors: [
            '.cgdp-related-resources.list h2'
        ],
        selectorExpansion: false,
    },
    // {
    //     label: 'cancer center expand accordion and then hover over link',
    //     testPath: '/about-cancer/coping/feelings/relaxation/duke-university',
    //     chainedActionSelectors: [
    //         {
    //             action: 'click',
    //             selector: '.cgdp-related-resources.list h2',
    //         },
    //         {
    //             action: 'hover',
    //             selector: '.cgdp-related-resources.list a',
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
]