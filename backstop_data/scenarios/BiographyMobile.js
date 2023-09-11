module.exports = [
    {
        label: 'biography whole page',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        delay: 2000,
        viewports: [
            {
                label: 'mobile',
                width: 320,
                height: 800,
            }
        ]
    },
    
    {
        label: 'biography expand accordion and then hover over link',
        testPath: '/about-cancer/coping/feelings/relaxation/loukissas-jen-biography',
        chainedActionSelectors: [
            {
                action: 'click',
                selector: '.related-resources.list h6',
            },
            {
                action: 'hover',
                selector: '.related-resources.list a',
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