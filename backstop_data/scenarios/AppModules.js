module.exports = [
    {
        label: 'CTS basic search form',
        testPath: '/research/participate/clinical-trials-search',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'CTS advanced search form',
        testPath: '/research/participate/clinical-trials-search/advanced',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'CTS basic default search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=1',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'CTS basic parametarized search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=1',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
     {
        label: 'CTS advanced default search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=2',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'CTS advanced parametarized search',
        testPath: '/research/participate/clinical-trials-search/r?a=65&loc=0&rl=2&st=C170515&t=C9291',
        selectors: [
            '#NCI-CTS-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Cancer Terms Search - English Begins',
        testPath: '/publications/dictionaries/cancer-terms/search/valerian/?searchMode=Begins',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
       ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
     {
        label: 'Dictionary of Cancer Terms Definition Page - English',
        testPath: '/publications/dictionaries/cancer-terms/def/abiraterone-acetate',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],

        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Cancer Terms Definition Page - Spanish',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-cancer/def/edr',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Cancer Terms - Spanish Contains',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-cancer/buscar/her/?searchMode=Contains',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
     
    {
        label: 'Dictionary of Cancer Terms Expand Page - Spanish',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-cancer/ampliar/W',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
     ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Cancer Terms Definition Page - English Image and Video',
        testPath: '/publications/dictionaries/cancer-terms/def/metastatic',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Genetics Term Search Form - English',
        testPath: '/publications/dictionaries/genetics-dictionary',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Genetics Term Search - English Contains',
        testPath: '/publications/dictionaries/genetics-dictionary/search/heritan/?searchMode=Contains',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },
    {
        label: 'Dictionary of Genetics Term Definition Page - English',
        testPath: '/publications/dictionaries/genetics-dictionary/def/acrochordon',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
     },
     {
        label: 'Dictionary of Genetics Term Expand Page - English',
        testPath: '/publications/dictionaries/genetics-dictionary/expand/D',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
     },
     {
        label: 'SiteWide Search Results Page - English Best Bets',
        testPath: '/search/results?swKeyword=tumor',
        selectors: [
            '#NCI-sws-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
     },
     {
        label: 'Drug Dictionary Search Form',
        testPath: '/publications/dictionaries/cancer-drug/search/-carbon/?searchMode=Contains',
        selectors: [
            '#NCI-dd-app-root'
        ],
        viewports: [
            {
                label: 'desktop',
                width: 1025,
                height: 600,
            },
        ],
        misMatchThreshold:2,
        requireSameDimensions: false
    },

 ]