// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Given('user is navigating to {string}', (a) => {
    cy.visit(a);
    Cypress.on('uncaught:exception', (err, runnable) => {
        // we expect a 3rd party library error with message `Cannot read property 'getAttribute' of undefined`
        // and don't want to fail the test so we return false
        if (err.message.includes(`Cannot read property 'getAttribute' of undefined`)) {
            return false
        }
        // we still want to ensure there are no other unexpected
        // errors, so we let them fail the test
    })
});

Then('public use text is displayed', () => {
    cy.get('div.cgdp-public-use').should('be.visible');
});

And('the public use text contains {string}', (title) => {
    cy.get('div.cgdp-public-use').should('include.text', title);
});

Then('public use text is not displayed', () => {
    cy.get('div.cgdp-public-use').should('not.exist');
});

Then('the length of public use text is within correct range', () => {
    cy.get('div.cgdp-public-use p em').invoke('text').then((text) => {
        expect(text.length).to.be.greaterThan(300).lessThan(500);
    });
});