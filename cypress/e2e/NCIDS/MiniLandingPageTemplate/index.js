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

And('NCIDS list is displayed with title {string}', (title) => {
    cy.get('.cgdp-list h2').should('be.visible').and('include.text', title)
})
And('each list item out of {int} has a heading and an image except item {int}', (totalNum, index) => {
    for (let i = 0; i < totalNum; i++) {
        cy.get('li.usa-collection__item').eq(i).find('a').invoke('text').should('have.length.above', 0);
        if (i !== index-1) {
            cy.get('li.usa-collection__item').eq(i).find('img').should('have.attr', 'src')
        }
    }
})
And('all list items out of {int} have description except items {int} and {int}', (totalNum, index1, index2) => {
    for (let i = 0; i < totalNum; i++) {
        if (i !== (index1-1) && i !== (index2-1)) {
            cy.get('li.usa-collection__item').eq(i).find('p.usa-collection__description').invoke('text').should('have.length.above', 0);
        }

    }
})

And('each list item out of {int} has a heading and description except items {int} and {int}',(totalNum,index1, index2)=>{

    for (let i = 0; i < totalNum; i++) {
        if (i !== (index1-1) && i !== (index2-1)) {
        cy.get('li.usa-collection__item').eq(i).find('p.usa-collection__description').invoke('text').should('have.length.above', 0);
        }
        cy.get('li.usa-collection__item').eq(i).find('a').invoke('text').should('have.length.above', 0);

    }
})

When('user clicks on NCIDS list item at position {int}',(index)=>{
    cy.get('li.usa-collection__item a').eq(index - 1).then(link$ => {
        link$.on('click', e => {
            e.preventDefault();
        });
    })
        .click({ followRedirect: false });
})

