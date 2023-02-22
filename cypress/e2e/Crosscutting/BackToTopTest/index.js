/// <reference types="Cypress" />
import { When, Then } from "cypress-cucumber-preprocessor/steps";

When('user scrolls {int} px {string}', (pixels, direction) => {
    if (direction === 'down')
        cy.scrollTo(0, pixels);
    else if (direction === 'up')
        cy.scrollTo(pixels, 0);
});

Then('back-to-top arrow appears with text {string} and href {string}', (textTop, hrefTop) => {
    cy.get('div.usa-footer__nci-return-to-top').should('be.visible').and('include.text', textTop).find('a').should('have.attr', 'href',hrefTop);
});

Then('back-to-top arrow is not displayed', () => {
    cy.get('div.usa-footer__nci-return-to-top').should('not.be.visible');
});

Then('back-to-top arrow is displayed',(icon)=>{
    cy.get('div.usa-footer__nci-return-to-top').should('be.visible');
});

When('user clicks on back-to-top button',()=>{
cy.get('div.usa-footer__nci-return-to-top a').click();
});