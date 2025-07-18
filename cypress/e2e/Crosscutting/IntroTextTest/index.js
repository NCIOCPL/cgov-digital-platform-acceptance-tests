// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('intro text section is visible', () => {
    cy.get('div[class*="intro-text"]').should('be.visible');
});

And('intro text section contains translated {string}', (translatedText) => {
    cy.get('div[class*="intro-text"] p').should('contain.text', translatedText);
});

Then('intro text section does not exist', () => {
    cy.get('div[class*="intro-text"]').should('not.exist');
});


