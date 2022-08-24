// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Given('user is navigating to {string}', (a) => {
    Cypress.on('uncaught:exception', (err, runnable) => {
        // returning false here to Cypress from
        // failing the test
        return false;
    });
    cy.visit(a);
});

And('user expands accordion section {string}', (section) => {
    cy.get('.accordion.ui-accordion > section > h2').contains(section).click();
    cy.wait(500);
});

When('user is clicking on definition for {string}', (termName) => {
    cy.get('a.definition').contains(termName).click();
    cy.wait(500);
});

Then('pop-up definition box is displayed for {string}', (termName) => {
    cy.get('div.modal__container .term').should('include.text', termName);
});

And('definition box displays all {string} provided by glossary', (features) => {
    const expText = features.split(',');
    for (let i = 0; i < expText.length; i++) {
        switch (expText[i]) {
            case 'definition':
                cy.get('div.modal__container dd[class="definition"]').should('be.visible');
                break;
            case 'pronunciation':
                cy.get('div.modal__container span[class="pronunciation"]').should('be.visible');
                break;
            case 'audio':
                cy.get('div.modal__container a[class="CDR_audiofile"]').should('be.visible');
                break;
            default:
                cy.get('div.modal__container').find('img').as('image');
                cy.get('@image').should('have.attr', 'src');
                cy.get('@image').should('have.attr', 'alt');
                const count = parseInt(((expText[i].replace('img[', '')).replace(']', '')));
                cy.get('@image').should('have.length', count);
                break;
        }
    }
});






