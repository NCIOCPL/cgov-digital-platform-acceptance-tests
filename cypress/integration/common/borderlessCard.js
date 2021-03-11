/// <reference types="Cypress" />
import { Then, And } from "cypress-cucumber-preprocessor/steps";

Then('the title of the feature card {int} is {string}', (cardNumber, cardTitle) => {
    // check that appropriate h1 tag is displayed depending on the screen breakpoint
    cy.document().then(doc => {
        if (doc.documentElement.clientWidth < 641) {
            cy.get('.borderless-card').eq(cardNumber - 1).find('h1.mobile-display').should('be.visible');
            cy.get('.borderless-card').eq(cardNumber - 1).find('h1.desktop-tablet-display').should('not.be.visible');
        } else {
            cy.get('.borderless-card').eq(cardNumber - 1).find('h1.desktop-tablet-display').should('be.visible');
            cy.get('.borderless-card').eq(cardNumber - 1).find('h1.mobile-display').should('not.be.visible');
        }
    });
    cy.get('.borderless-card').eq(cardNumber - 1).find('h1').should('contain', cardTitle);
});
Then('the feature card {int} title will have the href {string}', (cardNumber, titleHref) => {
    cy.get('.borderless-card').eq(cardNumber - 1).find('h1 a').should('have.attr', 'href').and('eq', titleHref);
});

Then('the feature card {int} description is {string}', (cardNumber, cardDescription) => {
    if (cardDescription !== 'none')
        cy.get('.borderless-card').eq(cardNumber - 1).find('p').should('have.text', cardDescription);
    else
        cy.get('.borderless-card').eq(cardNumber - 1).find('p').should('not.exist');
});
Then('the feature card {int} will have a button displayed under the card description with the text {string} and href {string}',
    (cardNumber, buttonText, titleHref) => {
        cy.get('.borderless-card').eq(cardNumber - 1).find('.borderless-button')
            .as('button').should('have.attr', 'href')
            .and('eq', titleHref);
        cy.get('@button').should('contain', buttonText);
    })
Then('{string} by {string} sized promo image of the feature card {int} is displayed with the source {string} and alt text {string}',
    (height, width, cardNumber, src, altText) => {
        if (src !== 'none') {
            const regex = new RegExp(src);
            cy.get('.borderless-card').eq(cardNumber - 1).find('img').as('image')
                .should('have.attr', 'alt').and('eq', altText);
            cy.get('@image').should('have.attr', 'width').and('eq', width);
            cy.get('@image').should('have.attr', 'height').and('eq', height);
            cy.get('@image').should('have.attr', 'src').and('match', regex);
        } else {
            cy.get('.borderless-card').eq(cardNumber - 1).find('img').should('not.exist');
        }
    });
Then('the feature card {int} promo image {string} will link to the {string}', (cardNumber, src, titleHref) => {
    if (src !== 'none')
        cy.get('.borderless-card').eq(cardNumber - 1).find('img').parent().should('have.attr', 'href').and('eq', titleHref);
    else
        cy.get('.borderless-card').eq(cardNumber - 1).find('img').should('not.exist');
});

When('user clicks on a {string} of borderless card at position {int}', (cardComponent, index) => {

    cy.get('.borderless-card').eq(index - 1).as('card');
    // check that appropriate h1 tag is displayed depending on the screen breakpoint
    cy.document().then(doc => {
        if (doc.documentElement.clientWidth < 641) {
            cy.get('@card').find('h1.mobile-display').should('be.visible');
            cy.get('@card').find('h1.desktop-tablet-display').should('not.be.visible');
        } else {
            cy.get('@card').find('h1.desktop-tablet-display').should('be.visible');
            cy.get('@card').find('h1.mobile-display').should('not.be.visible');
        }
    })

    switch (cardComponent) {
        case "title":
            cy.get('@card').find('h1 a:visible').trigger('click', { followRedirect: false });
            break;
        case "button":
            cy.get('@card').find('.borderless-button').trigger('click', { followRedirect: false });
            break;
        case "image":
            cy.get('@card').find('img').trigger('click', { followRedirect: false });
            break;
    }
});

Then('the title of the accent feature card {int} is {string}', (accentCardNumber, accentCardTitle) => {
    // check that appropriate h2 tag is displayed depending on the screen breakpoint
    cy.get('div.borderless-container div[class="columns align-center"]').eq(accentCardNumber - 1).find('h2').should('contain.text', accentCardTitle);
});

And('the accent of feature card {int} is {string}', (accentCardNumber, accent) => {
    cy.get('div[class="columns align-center"]').eq(accentCardNumber - 1).parent().next().should('have.class', accent)
});

Then('the accent feature card {int} title will have the href {string}', (cardNumber, titleHref) => {
    cy.get('div.borderless-card.medium-10.columns.align-center').eq(cardNumber - 1).parent().should('have.attr', 'href').and('eq', titleHref);
});

And('the feature card {int} will have no button', (cardNumber) => {
    cy.get('div.borderless-container').eq(cardNumber - 1).find('div.borderless-button').should('not.be.visible');
});

And('promo image of the feature card {int} is alligned to the {string}', (cardNumber, cardAlignment) => {
    cy.get('div.borderless-container div.borderless-card').eq(cardNumber - 1).should('have.class',`borderless-image-${cardAlignment}`);
});

