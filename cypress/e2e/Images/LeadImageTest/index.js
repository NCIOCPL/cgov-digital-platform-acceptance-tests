// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('lead image is visible', () => {
    cy.get('.centered-set.image-medium').should('be.visible');
});

And('caption text is {string}', (caption) => {
    cy.get('.centered-set.image-medium > figcaption > div').should('contain.text', caption);
});

And('credit text is {string}', (credit) => {
    cy.get('.centered-set.image-medium > figcaption > div > div').should('contain.text', credit);
});

And('alt text is {string}', (alttext) => {
    cy.get('.centered-set.image-medium >div >img').should('have.attr', 'alt').and('eq', alttext);
});

Then('lead image is not visible', () => {
    cy.get('.centered-set.image-medium').should('not.exist');
});