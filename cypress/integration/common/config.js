import { Given } from "cypress-cucumber-preprocessor/steps";

Given('screen breakpoint is set to {string}', (screenSize) => {
    if (screenSize === 'desktop')
        cy.viewport(1024, 600);
    else if (screenSize === 'mobile')
        cy.viewport(320, 800);
    else if (screenSize === 'tablet')
        cy.viewport(640, 900);
})