/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getClickBeacon } from "../../utils/getClickBeacon.js"
import { convertBeacon } from "../../utils/analyticsBeacon.js"

Then('the following parameters should be captured', dataTable => {
    const rawTable = dataTable.rawTable.slice();
    let beacon = getBeacon();

    for (let j = 0; j < rawTable.length; j++) {
        let row = rawTable[j];
        if (row[1].length > 1 && row[1].startsWith('/') && row[1].endsWith('/')) {
            const regex = new RegExp(row[1].substring(1, row[1].length - 1));
            expect(beacon[row[0]]).to.match(regex);
        } else if (row[1].includes('{CANONICAL_HOST}')) {
            cy.location('host').then(host => {
                const madeUpValue = row[1].replace('{CANONICAL_HOST}', host);
                expect(beacon[row[0]]).to.eq(madeUpValue);
            })
        } else
            expect(beacon[row[0]]).to.be.equal(row[1]);
    }

});

Then('the following events are captured', dataTable => {
    const rawTable = dataTable.rawTable.slice();
    let beacon = getBeacon();
    // assertions for each entry parameter provided
    for (let j = 0; j < rawTable.length; j++) {
        let row = rawTable[j];
        expect(beacon[row[0]]).to.include(row[1]);
    }
});

Then('page click request is sent', () => {
    Cypress.ClickBeacon = getClickBeacon();
});

When('page load request is sent', () => {
    cy.window().then((win) => {
        //create a map of request being sent of
        const networkrequests = win.performance.getEntries().map(r => r.name);
        //list of URLs collected
        const urlList = new Array();
        for (let i = 0; i < networkrequests.length; i++) {
            let temp = networkrequests[i].toString();
            //find Adobe request and store it in the urlList
            if (temp.includes(Cypress.env('trackingServer')[0]) || temp.includes(Cypress.env('trackingServer')[1])) {
                urlList.push(networkrequests[i]);
            }
        }
        for (let i = 0; i < urlList.length; i++) {
            const singleBeacon = convertBeacon(urlList[i]);
            if (singleBeacon.linkType === undefined)
                Cypress.LoadBeacon = singleBeacon;
        }
    });
});


function getBeacon() {
    if (Cypress.ClickBeacon !== undefined && Cypress.LoadBeacon === undefined)
        return Cypress.ClickBeacon;
    else
        return Cypress.LoadBeacon;
}