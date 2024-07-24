/// <reference types="Cypress" />
import { When } from "cypress-cucumber-preprocessor/steps";

When('NCIDS Page Title Block is displayed with text {string}', (title) => {
    cy.get(`h1.nci-heading-h1`).should('have.text', title);
});

When('there are {int} content blocks on a page', (num) => {
    cy.get(`div[class='usa-section']`).should('have.length', num)
});

When('the following types of links are present', (dataTable) => {
    for (const { index, dataEntityType, title, link } of dataTable.hashes()) {
        cy.get(`a[href*="${link}"]`).eq(index).as('link');

        if (!dataEntityType.includes('n/a')) {
            cy.get('@link').should('have.attr', 'data-entity-type', dataEntityType)
        } else {
            cy.get('@link').should('not.have.attr', 'data-entity-type', dataEntityType)
        }

        cy.get('@link').should('have.text', title)
    }

});

When('user clicks on content block link at position {int}', (index) => {
    cy.get(`#main-content a`).eq(index - 1).then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
        .click({ followRedirect: false });
});

When('user clicks on NCIDS feature card at position {int}', (cardIndex) => {
    cy.get('li[class^="nci-card"]').eq(cardIndex - 1).find('img').trigger('click', { followRedirect: false })
})

