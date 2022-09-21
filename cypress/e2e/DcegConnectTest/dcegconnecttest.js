/// <reference types="Cypress" />
import { Then, And } from "cypress-cucumber-preprocessor/steps";

Then('the NIH logo appears with src {string} and alt text {string}', (imgSrc, altText) => {
    cy.get('#nvcgSlSiteBanner').find('img').should('have.attr', 'src', imgSrc).and('have.attr', 'alt', altText);
});

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
    cy.get('.borderless-card').eq(cardNumber - 1).find('h1').should('include.text', cardTitle);
});

Then('the feature card {int} will have the href {string}', (cardNumber, titleHref) => {
    cy.get('div.row.flex-columns a').eq(cardNumber - 1).should('have.attr', 'href').and('eq', titleHref);
});

Then('the feature card {int} promo image {string} will link to the {string}', (cardNumber, src, titleHref) => {
    if (src !== 'none')
        cy.get('.borderless-card').eq(cardNumber - 1).parent().should('have.attr', 'href').and('eq', titleHref);
    else
        cy.get('.borderless-card').eq(cardNumber - 1).should('not.exist');
});

And('the title of a content block {int} will be {string}', (number, titleText) => {
    cy.get("div[class='columns align-center']").eq(number - 1).find('h1').invoke('text').then((text) => {
        expect(text.trim()).equal(titleText);
    });
});

Then('the type {string} image number {int} of a content block {int} is displayed with the source {string}', (type, index, number, iconUrl) => {
    const baseURL = Cypress.config('baseUrl');
    cy.get("div[class='columns align-center']").eq(number - 1).find(`div[class$='${type}']`).eq(index - 1).then($container => {
        const style = window.getComputedStyle($container[0]);
        const image = style.getPropertyValue('background-image');
        const expectedURL = `url("${baseURL}${iconUrl}")`;
        const newImage = image.replace(/\?v=\w+/, '');
        expect(expectedURL).equal(newImage);
    });
});

Then('the image number {int} of a content block {int} will have a text {string}', (index, number, text) => {
    cy.get("div[class='columns align-center']").eq(number - 1).find(`div[class$='icon']`).eq(index - 1)
        .next().then(($el) => {
            const innerText = $el[0].innerText;
            expect(innerText).to.eq(text)
        });
});