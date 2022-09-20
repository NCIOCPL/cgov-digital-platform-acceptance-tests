export function getClickBeacon() {
    let clickBeacon;
    for (let i = 0; i < cy.AnalyticsStorage.length; i++) {
        const singleBeacon = cy.AnalyticsStorage[i];
        if (!(singleBeacon.linkType === undefined)) {
            if (singleBeacon.linkType.includes('lnk_o') && !singleBeacon.pev2.includes('Resized')) {
                clickBeacon = singleBeacon;
            }
        }
    }    
    
    return clickBeacon;
}