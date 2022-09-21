// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('recommended content section is visible', () => {
    cy.get('div#blog-cards').should('be.visible');
});

Then('recommended content section is not visible', () => {
    cy.get('div#blog-cards').should('not.be.visible');
});

And('recommended content header text is {string}', (headerText) => {
    cy.get('div#blog-cards').find('h4').should('be.visible').and('have.text', headerText);

});

And('recommended content section display {int} of content cards', (totalNumber) => {
    cy.get('.feature-card.cgvBlogPost').should('have.length', totalNumber);
});

And(`the card's title at position {int} is {string}`, (cardIndex, cardTitle) => {
    cy.get('.feature-card.cgvBlogPost h3').eq(cardIndex).should('have.text', cardTitle);
});


And(`the card's image at position {int} has source {string} and file name {string}`, (cardIndex, src, fileName) => {
    cy.get('.feature-card.cgvBlogPost img').eq(cardIndex).invoke('attr', 'src').then((fullSrc) => {
        expect(fullSrc.startsWith(src)).to.be.true;
        const src1 = fullSrc.substring(0, fullSrc.indexOf('?itok'));
        expect(src1.endsWith(fileName)).to.be.true;
    });
});

And(`the card's image at position {int} has the alt text {string} and a link {string}`, (cardIndex, altText, cardLink) => {
    cy.get('.feature-card.cgvBlogPost').eq(cardIndex).find('img').should('have.attr', 'alt', altText);
    cy.get('.feature-card.cgvBlogPost').eq(cardIndex).find('a').should('have.attr', 'href', cardLink);
});