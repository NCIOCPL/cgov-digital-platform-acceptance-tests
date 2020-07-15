/// <reference types="Cypress" />

import { Then } from "cypress-cucumber-preprocessor/steps";

const twoColumCard = 'div.title-first-feature-card-left';
const oneColumnCard = 'div.title-first-feature-card-right';

const getCard = cardType => {
    if (cardType.toLowerCase() === 'two column')
        return twoColumCard;
    else if (cardType.toLowerCase() === 'one column')
        return oneColumnCard;
    else
        return console.error('Card can be either "one column" or "two column", please check the spelling')
}

Then('the title-first feature card row will display', () => {
    cy.get('div.title-first-feature-card-container').should('be.visible');
});

Then('a {string} card will appear on the {string}', (cardType, alighment) => {
    const cardLocator = getCard(cardType);

    cy.document().then(document => {
        const card = document.querySelector(`${cardLocator}`);
        if (alighment.toLowerCase() === 'left')
            expect(card.offsetLeft).to.eq(30);
        else if (alighment.toLowerCase() === 'right')
            expect(card.offsetLeft).to.eq(569);
        else if (alighment.toLowerCase() === 'top')
            expect(card.nextElementSibling.className).to.eq(oneColumnCard.substring(4))
        else
            expect(card.previousElementSibling.className).to.eq(twoColumCard.substring(4))

    })
})
Then('the card title of the {string} feature card item should appear as a H3 tag', (cardType) => {
    const cardLocator = getCard(cardType);
    cy.get(`${cardLocator} h3`).should('not.be.empty');
})

Then('{string} by {string} sized promo image of the {string} feature card is displayed with the source {string} and alt text {string}',
    (height, width, cardType, src, alt) => {
        const regex = new RegExp(src);
        const cardLocator = getCard(cardType);
        cy.get(cardLocator).find('img').as('cardImg').should('have.attr', 'alt').and('eq', alt);
        cy.get('@cardImg').should('have.attr', 'src').and('match', regex);

        cy.get('@cardImg').should('have.attr', 'width').and('eq', width);
        cy.get('@cardImg').should('have.attr', 'height').and('eq', height);

    })
Then('the card description of the {string} feature card item should appear', (cardType) => {
    const cardLocator = getCard(cardType);
    cy.get(cardLocator).find('p').should('not.be.empty')
})
Then('the {string} card has a href {string}', (cardType, href) => {
    const cardLocator = getCard(cardType);
    cy.get(cardLocator).find('a').should('have.attr', 'href', href)
})

When('user clicks on a {string} feature card row', (cardType) => {
    const cardLocator = getCard(cardType);
    cy.get(cardLocator).trigger('click');
})