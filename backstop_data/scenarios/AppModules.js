module.exports = [
    {
        label: 'CTS basic search form',
        testPath: '/research/participate/clinical-trials-search',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'CTS advanced search form',
        testPath: '/research/participate/clinical-trials-search/advanced',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'CTS basic default search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=1',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'CTS basic parametarized search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=1',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
     {
        label: 'CTS advanced default search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=2',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'CTS advanced parametarized search',
        testPath: '/research/participate/clinical-trials-search/r?loc=0&rl=1/research/participate/clinical-trials-search/r?a=65&loc=0&rl=2&st=C170515&t=C9291',
        selectors: [
            '#NCI-CTS-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Cancer Terms Search Form - English No Image',
        testPath: '/publications/dictionaries/cancer-terms/search/valerian/?searchMode=Begins',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Cancer Terms Definition Page - Spanish Image',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-cancer/def/edr',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Cancer Terms Definition Page - English Contains',
        testPath: '/publications/dictionaries/cancer-terms/search/ter/?searchMode=Contains',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Genetics Term Search Form - English',
        testPath: '/publications/dictionaries/genetics-dictionary',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Genetics Term Search Form - Spanish',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-genetica',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Dictionary of Genetics Term Definition Page - English',
        testPath: '/publications/dictionaries/genetics-dictionary/def/acrochordon',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
     },
    {
        label: 'Dictionary of Genetics Term Definition Page - Spanish',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-genetica/def/acrocordon',
        selectors: [
            '#NCI-glossary-app-root'
        ],
        misMatchThreshold:2
    },
    {
        label: 'Drug Dictionary Search Form',
        testPath: '/publications/dictionaries/cancer-drug',
        selectors: [
            '#NCI-dd-app-root'
        ],
        misMatchThreshold:2
    },

 ]