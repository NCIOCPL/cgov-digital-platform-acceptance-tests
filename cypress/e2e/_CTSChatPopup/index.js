// <reference types="Cypress" />
import { Given, And, Then, When } from 'cypress-cucumber-preprocessor/steps';

And('Spanish chat pop up is displayed', () => {
    cy.get('#Spanish-CTSPrompt', { timeout: 180000 }).should('be.visible');
});

And('chat pop up is displayed', () => {
    cy.get('#ProactiveLiveHelpForCTSPrompt', { timeout: 50000 }).should('be.visible');
});

When('user clicks on chat button', () => {
    cy.window().then(win => {
        //stubbing the open window to prevent the call to open it,
        //but still triggering the click event
        const openWinStub = cy.stub(win, 'open')
        cy.get('#proactive-chat-link').trigger('click', { followRedirect: false });
    })

    cy.wait(2000);
});