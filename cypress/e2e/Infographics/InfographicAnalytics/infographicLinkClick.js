/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";
When('user clicks on View and Print Infographic button',()=>{
    cy.get("figure[class*='centered']").find('figcaption a').trigger('click');
    cy.wait(2000);
});

And('screen breakpoint is set to {string}', (screenSize) => {
    if (screenSize === 'desktop')
    cy.viewport(1024, 600);
else if (screenSize === 'mobile')
    cy.viewport(320, 800);
else if (screenSize === 'tablet')
    cy.viewport(769, 900);
});