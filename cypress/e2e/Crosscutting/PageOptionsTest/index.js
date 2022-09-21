// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

//This step is just a workaround until it gets fixed
Given('user is navigating to {string}', (a) => {
    Cypress.on('uncaught:exception', (err, runnable) => {
        // we expect a 3rd party library error with message like 'list not defined' etc.
        // and don't want to fail the test so we return false
        if (err.message.includes(`Cannot read property 'getAttribute' of undefined`)) {
            return false
        }
    });
    cy.visit(a);
});

Then('page options are displayed', () => {
    cy.get('div#PageOptionsControl1').should('be.visible');
})

And('{string} button is displayed', (pageOption) => {
    const expText = pageOption.split(',');
    for (let i = 0; i < expText.length; i++) {
        switch (expText[i]) {
            case 'print':
                cy.get('.page-options--print').should('be.visible');
                break;
            case 'email':
                cy.get('.page-options--email').should('be.visible');
                break;
            case 'facebook':
                cy.get('.social-share.social-share--facebook').should('be.visible');
                break;
            case 'twitter':
                cy.get('.social-share.social-share--twitter').should('be.visible');
                break;
            case 'pinterest':
                cy.get('.social-share.social-share--pinterest').should('be.visible');
                break;
            case 'font resizer':
                cy.get('.page-options--resize').should('be.visible');
                break;
        }
    }
});

And('{string} button is not displayed', (pageOption1) => {
    const expText = pageOption1.split(',');
    for (let i = 0; i < expText.length; i++) {
        switch (expText[i]) {
            case 'font resizer':
                cy.get('.page-options--resize').should('not.be.visible');
                break;
            case 'print':
                cy.get('.page-options--print').should('not.be.visible');
                break;
        }
    }
});

And('{string} button does not exist', (fontResizer) => {
    cy.get('.page-options--resize').should('not.exist', fontResizer);
});