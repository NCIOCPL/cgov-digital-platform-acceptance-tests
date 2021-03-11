/*
Map contains all Adobe parameters that have alternative 
Analytics implementation variable
*/
const keyMap = {
  'ch': 'channel',
  'c.' : 'contextData',
  '.c' : 'contextData',
  'cc' : 'currencyCode',
  'cdp' : 'cookieDomainPeriods',
  'ce' : 'charSet',
  'cl' : 'cookieLifetime',
  'D' : 'dynamicVariablePrefix',
  'ns' : 'visitorNameSpace',
  'ev': 'events',
  'g' : 'pageURL',
  '-g' : 'pageURL',
  'gn' : 'pageName',
  'oid' : 'objectID',
  'r' : 'referrer',
  'sv' : 'server',
  'vid' : 'visitorID',
  'vvp' : 'variableProvider',
  'gt' : 'pageType',
  'pe' : 'linkType',
  'ts' : 'timestamp',
  'sv' : 'server'
};
export const convertBeacon = (rawUrl) => {
  const params = new URL(rawUrl).searchParams;
  const rtnObj = Array.from(params.entries())
    // Iterate over the params and convert them to something else.
    .map(([pkey, value]) => {
      // Simple keys that have Analytics implementation variable are found in the map
      if (keyMap[pkey]) return { key: keyMap[pkey], value };
      // Special cases here
      if (pkey.match(/^c[0-9]+$/)) {
        const number = pkey.substring(1);
        if(number>=1 && number<=75){
        const key = `prop${number}`;
        return {key, value};
         } else {
          throw new Error (`Invalid variable: ${pkey}`)
         }
      }else if (pkey.match(/^h[0-9]/)) {
        const number = pkey.substring(1);
        if(number>=1 && number<=5){
        const key = `hier${number}`;
        return {key, value};
         } else {
          throw new Error (`Invalid variable: ${pkey}`)
         }
      }else if(pkey.match(/^v[0-9]+$/)){
        const number = pkey.substring(1);
        if(number>=1 && number<=250){
        const key = `evar${number}`;
        return {key, value};
         } else {
          throw new Error (`Invalid variable: ${pkey}`)
         }
      } else if(pkey.match(/^l[0-9]+$/)){
        const number = pkey.substring(1);
        if(number>=1 && number<=3){
        const key = `list${number}`;
        return {key, value};
         } else {
          throw new Error (`Invalid variable: ${pkey}`)
         }
        //rest of received params are asigned as is
      } else {
        const key = pkey;
        return {key, value}
      }
    })
    .reduce((ac, {key, value}) => {  
      return {
        ...ac,
        [key]: value
      };
    }, {})
  return rtnObj;
}