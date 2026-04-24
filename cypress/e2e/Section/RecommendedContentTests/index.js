/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';

Then('recommended content section is visible', () => {
    cy.get('div.cgdp-recommended-content').should('be.visible');
});

Then('recommended content section is not visible', () => {
    cy.get('div.cgdp-recommended-content').should('not.be.visible');
});

And('recommended content header text is {string}', (headerText) => {
    cy.get('h2.cgdp-feature-card-row__heading').should('be.visible').contains(headerText);

});

And('recommended content section display {int} of content cards', (totalNumber) => {
    cy.get('li.nci-card').should('have.length', totalNumber);
});

And(`the card's title at position {int} is {string}`, (cardIndex, cardTitle) => {
    cy.get('span.nci-card__title').eq(cardIndex).should('have.text', cardTitle);
});


And(`the card's image at position {int} has source {string} and file name {string} before query parameter {string}`, (cardIndex, src, fileName, queryParam) => {
    cy.get('li.nci-card img').eq(cardIndex).invoke('attr', 'src').then((fullSrc) => {
        expect(fullSrc.startsWith(getBaseDirectory())).to.be.true;
        expect(fullSrc).to.include(src)
        const src1 = fullSrc.substring(0, fullSrc.indexOf(`?${queryParam}`));
        expect(src1.endsWith(fileName)).to.be.true;
    });
});

And(`the card's image at position {int} has the alt text {string} and a link {string}`, (cardIndex, altText, cardLink) => {
    cy.get('li.nci-card').eq(cardIndex).find('img').should('have.attr', 'alt', altText);
    cy.get('li.nci-card').eq(cardIndex).find('a').invoke('attr','href').then(href=>{
        if(href.startsWith('http')){
            expect(href).to.eq(cardLink)
        }else {
            expect(href).to.eq(`${getBaseDirectory()}${cardLink}`);
        }
    }) 
});