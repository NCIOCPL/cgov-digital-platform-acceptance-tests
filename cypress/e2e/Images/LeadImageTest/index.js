// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('lead image is visible', () => {
    cy.get('.cgdp-image').should('be.visible');
});

And('caption text is {string}', (caption) => {
    cy.get('.cgdp-image .cgdp-image__caption').should('contain.text', caption);
});

And('credit text is {string}', (credit) => {
    cy.get('.cgdp-image .cgdp-image__caption p').should('contain.text', credit);
});

And('alt text is {string}', (alttext) => {
    cy.get('.cgdp-image img').should('have.attr', 'alt').and('eq', alttext);
});

Then('lead image is not visible', () => {
    cy.get('.cgdp-image').should('not.exist');
});