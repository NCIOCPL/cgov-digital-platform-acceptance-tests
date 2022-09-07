// <reference types="Cypress" />
import { Given, And, Then, When } from 'cypress-cucumber-preprocessor/steps';

And('Spanish chat pop up is displayed', () => {
    cy.get('#Spanish-CTSPrompt', { timeout: 30000 }).should('be.visible');
});

When('user clicks on chat button', () => {
    cy.get('#proactive-chat-link').click();
    cy.wait(2000);
});