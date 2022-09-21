/// <reference types="Cypress" />
import { Then } from "cypress-cucumber-preprocessor/steps";

Then('there are captured events', dataTable => {

    const allEvents = Cypress.BEACON.events.split(',');

    let mapOfEvents = new Map();

    allEvents.forEach(eventValue => {
        if (eventValue.includes('=')) {
            const splitted = eventValue.split('=');
            mapOfEvents.set(splitted[0], splitted[1]);
        } else
            mapOfEvents.set(eventValue, '');
    });

    for (const { event, value } of dataTable.hashes()) {
        // assertions for each entry parameter provided
        if (value.startsWith('/') && value.endsWith('/')) {
            const regex = new RegExp(value.substring(1, value.length - 1))
            expect(mapOfEvents.get(event)).to.match(regex);
        } else
            expect(mapOfEvents.get(event)).to.be.eq(value);

    }
});