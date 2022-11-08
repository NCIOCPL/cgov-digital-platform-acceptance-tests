import { Given } from "cypress-cucumber-preprocessor/steps";

Given('screen breakpoint is set to {string}', (screenSize) => {
    if (screenSize === 'desktop')
        cy.viewport(1025, 600);
    else if (screenSize === 'mobile')
        cy.viewport(320, 800);
    else if (screenSize === 'tablet')
        cy.viewport(641, 900);
    else if (screenSize.includes('custom')){
        const breakpoint = screenSize.replace('custom ','').split('x');
        cy.viewport(parseInt(breakpoint[0]), parseInt(breakpoint[1]));
    }
        
})