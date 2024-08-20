/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('citation section is visible', () => {
    cy.get('#cgvCitationSl').should('be.visible');
});

And('citation header text is {string}', (headerText) => {
    cy.get('#cgvCitationSl div').find('h2').invoke('text').then((text) => {

        expect(text.trim()).equal(headerText);
    });
});

And('citation number {int} is a PubMed link with an url {string}', (pubMedLinkNumber, linkUrl) => {
    cy.get('#cgvCitationSl a').eq(pubMedLinkNumber - 1).should('have.attr', 'href', linkUrl);
});


And('citation number {int} is not a PubMed link', (plainCitationNumber) => {
    cy.get('#cgvCitationSl a').eq(plainCitationNumber - 1).should('not.contain.text', 'PubMed Abstract');
});

And('citation text for citation number {int} is within reasonable length', (plainCitationNumber) => {
    cy.get('#cgvCitationSl li').eq(plainCitationNumber - 1).invoke('text').then((text) => {
        expect(text.length).to.be.greaterThan(20).lessThan(300);
    });
});

Then('citation section does not exist', () => {
    cy.get('#cgvCitationSl').should('not.exist');
});
