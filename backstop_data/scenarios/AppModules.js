module.exports = [
    {
        label: 'CTS basic search form',
        testPath: '/research/participate/clinical-trials-search',
    },
    {
        label: 'CTS advanced search form',
        testPath: '/research/participate/clinical-trials-search/advanced',
    },
    {
        label: 'Dictionary of Cancer Terms Search Form - English No Image',
        testPath: '/publications/dictionaries/cancer-terms/search/valerian/?searchMode=Begins',
        postInteractionWait:5000
    },
    {
        label: 'Dictionary of Cancer Terms Definition Page - Spanish Image',
        testPath: '/espanol/publicaciones/diccionarios/diccionario-cancer/def/edr',
          postInteractionWait:5000
    },
    {
        label: 'Site wide search english - best bets',
        testPath: '/search/results?swKeyword=pact',
    },
      {
        label: 'Site wide search english - glossary box',
        testPath: '/search/results?swKeyword=tumor',
    },
    {
        label: 'Site wide search english - glossary and best bets box',
        testPath: '/search/results?swKeyword=mantle+cell+lymphoma',
    },

    
 ]