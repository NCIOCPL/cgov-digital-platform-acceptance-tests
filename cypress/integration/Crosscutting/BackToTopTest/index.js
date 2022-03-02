/// <reference types="Cypress" />
import { When, Then } from "cypress-cucumber-preprocessor/steps";

When('user scrolls {int} px {string}', (pixels, direction) => {
    if (direction === 'down')
        cy.scrollTo(0, pixels);
    else if (direction === 'up')
        cy.scrollTo(pixels, 0);
});

Then('back-to-top arrow appears with text {string} and href {string}', (textTop, hrefTop) => {
    cy.get('.back-to-top').should('be.visible').and('have.text', textTop).and('have.attr', 'href', hrefTop);
});

Then('back-to-top arrow is not displayed', () => {
    cy.get('.back-to-top').should('not.be.visible');
});