/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

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


Then("language toggle is displayed", () => {
    cy.get('.language-link').should('be.visible');
});

And("toggle label is {string}", (label) => {
    cy.get('.language-link').should('have.text', label);
});

And("toggle links to {string}", (link) => {
    cy.get('.language-link').should('have.attr', 'href').and('eq', link);
});

Then("language toggle does not exist", () => {
    cy.get('.language-link').should('not.exist');
});