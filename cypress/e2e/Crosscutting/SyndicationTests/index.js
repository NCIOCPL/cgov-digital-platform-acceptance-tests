/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';


Then('the syndication text {string} is present', (expectedText) => {
    cy.get('div.cgdp-hhs-syndication').find('p').should('be.visible').and('have.text', expectedText);
});

And('the link {string} has a href {string}', (linkText, linkHref) => {
    cy.get('div.cgdp-hhs-syndication').find('a').should('have.text', linkText).and('have.attr', 'href', linkHref);
});

And('syndication icon is present', () => {
    cy.get('div.cgdp-hhs-syndication').find('svg').should('be.visible')
});