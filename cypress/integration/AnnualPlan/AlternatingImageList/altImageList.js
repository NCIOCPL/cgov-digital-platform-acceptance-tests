/// <reference types="Cypress" />

import { Then } from "cypress-cucumber-preprocessor/steps";

Then('an alternating image list will appear', () => {
    cy.get('div.alternating-image-list-container').should('be.visible');
});

Then('the list items will have alternating alighment starting with left', () => {
    cy.document().then(document => {
        const allImages = document.querySelectorAll('div.list-item-image.image.container');
        const allDescContainer = document.querySelectorAll('.title-and-desc.title.desc.container.alternating-image-list-text');
        for (let i = 0; i < allImages.length; i++) {
            if (i % 2 === 0) {
                expect(allImages[i].offsetLeft).to.eq(30);
                expect(allDescContainer[i].offsetLeft).to.eq(441);
            } else {
                expect(allImages[i].offsetLeft).to.eq(441);
                expect(allDescContainer[i].offsetLeft).to.eq(30);
            }
        }
    })
});

Then('{string} by {string} sized promo image of the list item number {int} is displayed with the source {string} and alt text {string}',
    (height, width, itemNumber, src, alt) => {
        const regex = new RegExp(src);
        cy.get('.alternating-image-list-image').eq(itemNumber - 1).find('img').as('image')
            .should('have.attr', 'alt').and('eq', alt);
        cy.get('@image').should('have.attr', 'width').and('eq', width);
        cy.get('@image').should('have.attr', 'height').and('eq', height);
        cy.get('@image').should('have.attr', 'src').and('match', regex);
    });


Then('the page title of the list item number {int} should appear as H3 tag', (itemNumber) => {
    cy.get('.title-and-desc.title.desc.container.alternating-image-list-text').eq(itemNumber - 1)
        .find('h3').should('not.be.empty');
});

Then('the list description of the list item number {int} should appear', (itemNumber) => {
    cy.get('.title-and-desc.title.desc.container.alternating-image-list-text').eq(itemNumber - 1)
        .find('.description>p').should('not.be.empty')
});

Then('the item number {int} has a href {string}', (itemNumber, href) => {
    cy.get('a.alternating-image-list-container-link').eq(itemNumber - 1)
        .should('have.attr', 'href', href);

});

Then('the exit disclaimer of item number {int} appears', (itemNumber) => {
    cy.get('a.alternating-image-list-container-link').eq(itemNumber - 1).find('a.icon-exit-notification')
        .should('have.attr', 'href');
});

Then('the list items images will not be displayed', () => {
    cy.get('.alternating-image-list-image').find('img').should('not.be.visible');
});

When('user clicks on a list item at position {int}', (itemNumber) => {
    cy.get('a.alternating-image-list-container-link > div').eq(itemNumber - 1).trigger('click', { followRedirect: false });
});