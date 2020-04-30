/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";
import { getClickBeacon } from "../../utils/getClickBeacon.js"
import { getLoadBeacon } from "../../utils/getLoadBeacon.js"

let loadOrClick;

Then('the following parameters should be captured', dataTable => {
    let beacon = getBeacon();

    const allEvents = beacon.events.split(',');
    let mapOfEvents = new Map();

    allEvents.forEach(eventValue => {
        if (eventValue.includes('=')) {
            const splitted = eventValue.split('=');
            mapOfEvents.set(splitted[0].toString(), splitted[1]);
        } else {
            mapOfEvents.set(eventValue.toString(), '');
        }
    });


    // assertions for each entry parameter provided

    for (const { parameter, value } of dataTable.hashes()) {
        if (value.length > 1 && value.startsWith('/') && value.endsWith('/') && !parameter.includes('event')) {
            const regex = new RegExp(value.substring(1, value.length - 1));
            expect(beacon[parameter]).to.match(regex);
        } else if (value.includes('{CANONICAL_HOST}')) {
            cy.location('host').then(host => {
                const madeUpValue = value.replace('{CANONICAL_HOST}', host);
                expect(beacon[parameter]).to.eq(madeUpValue);
            })
        } else if (parameter.includes('event')) {
            if (value.startsWith("/")) {
                const regex = new RegExp(value.substring(1, value.length - 1))
                expect(mapOfEvents.get(parameter)).to.match(regex);
            } else
                expect(mapOfEvents.get(parameter)).to.be.eq(value);

        } else
            expect(beacon[parameter]).to.be.equal(value);
    }
});

Then('page click request is sent', () => {
    loadOrClick = getClickBeacon();
});

When('page load request is sent', () => {
    loadOrClick = getLoadBeacon();
});


function getBeacon() {
    return loadOrClick;
}


Then('user is navigating to {string} with added wait', (url) => {
    cy.visit(url);
    cy.wait(2000)
});

