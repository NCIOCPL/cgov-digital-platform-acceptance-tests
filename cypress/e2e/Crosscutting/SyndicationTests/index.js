/// <reference types="Cypress" />
import { And, Then } from 'cypress-cucumber-preprocessor/steps';


Then('the syndication text {string} is present', (expectedText) => {
    cy.get('div.syndication').find('p').should('be.visible').and('have.text', expectedText);
});

And('the link {string} has a href {string}', (linkText, linkHref) => {
    cy.get('div.syndication').find('a').should('have.text', linkText).and('have.attr', 'href', linkHref);
});

And('syndication icon located at {string} is present', (iconUrl) => {
    cy.document().then((document) => {
        const element = document.querySelector("div.syndication>div");
        const style = window.getComputedStyle(element);
        const image = style.getPropertyValue('background-image');
        const newImage = image.replace(/\?v=\w+/, '');
        expect(newImage).to.include(iconUrl);
    });
});