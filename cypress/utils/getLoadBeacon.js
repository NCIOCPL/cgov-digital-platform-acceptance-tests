export function getLoadBeacon() {
    for (let i = 0; i < cy.AnalyticsStorage.length; i++) {
        const singleBeacon = cy.AnalyticsStorage[i];
        if (singleBeacon.linkType === undefined  && singleBeacon.pev2 === undefined)
            return singleBeacon;
    }
}