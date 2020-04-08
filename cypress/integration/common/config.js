import { Given } from "cypress-cucumber-preprocessor/steps";

Given('screen breakpoint is set to {string}', (screenSize) => {
    if (screenSize === 'desktop')
        cy.viewport(1025, 600);
    else if (screenSize === 'mobile')
        cy.viewport(600, 800);
    else if (screenSize === 'tablet')
        cy.viewport(800, 900);
})