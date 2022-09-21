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

Then('footer section is visible', () => {
    cy.get('.site-footer').should('be.visible');
});

And('there is only one footer on a page', () => {
    cy.get('.site-footer').should('have.length', 1);
});

And('footer header text is {string}', (header) => {
    cy.get('.site-footer__header').should('include.text', header);
});

And('footer text is within reasonable range', () => {
    cy.get('.site-footer__container').invoke('text').then((text) => {
        expect(text.length).to.be.greaterThan(400).lessThan(800);
    });
});

And('the footer text does not contain any broken links',() => {
    cy.document().then(document => {
        const allAnchorTags = document.querySelectorAll(".site-footer__container a");
        for (let i = 0; i < allAnchorTags; i++) {
            cy.get('.site-footer__container a').eq(i).invoke('attr', href).then((href) => {
                expect(href.length).to.be.greaterThan(0);
            });
        }
    });
});