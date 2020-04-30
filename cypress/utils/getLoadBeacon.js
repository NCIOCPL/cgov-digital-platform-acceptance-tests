export function getLoadBeacon() {
    for (let i = 0; i < cy.AnalyticsStorage.length; i++) {
        const singleBeacon = cy.AnalyticsStorage[i];
        if (singleBeacon.linkType === undefined)
            return singleBeacon;
    }
}