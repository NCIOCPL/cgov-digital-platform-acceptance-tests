// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('date is displayed', () => {
    cy.get('div.cgdp-document-dates').should('be.visible');
});

And('the date {string} is {string}', (field, value) => {
    cy.get('div.cgdp-document-dates > ul >li').as('timestamp');
    if (field == "text") {
        cy.get('@timestamp').find('time').should('have.attr', 'datetime').and('eq', value);
    }
    else if (field == "label") {
        cy.get('@timestamp').find('strong').should('include.text', value);
    }
    else if (field == "stamp") {
        cy.get('@timestamp').find('time').should('include.text', value);
    }
});

Then('dates do not appear', () => {
    cy.get('div.cgdp-document-dates').should('not.exist');
});