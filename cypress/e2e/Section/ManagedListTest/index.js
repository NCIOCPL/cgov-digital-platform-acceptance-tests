/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

//This step is just a workaround until it gets fixed
Given('user is navigating to {string}', (a) => {
    Cypress.on('uncaught:exception', (err, runnable) => {
        // we expect a 3rd party library error with message like 'list not defined' etc.
        // and don't want to fail the test so we return false
        if (err.message.includes(`Cannot read property 'getAttribute' of undefined`)) {
            return false
        }
    });
    cy.visit(a);
});

Then('managed list section is visible', () => {
    cy.get('.list.managed > ul').should('be.visible');
});

And('number of items in the list is {int}', (listCount) => {
    cy.get('.list.managed > ul > li').should('have.length', listCount);
});

And('each managed list description text is within reasonable length', () => {
    cy.document().then(document => {
        const allListItems = document.querySelector(`${'.list.managed > ul >li'}`).childElementCount;
        for (let i = 0; i < allListItems; i++) {
            cy.get('.list.managed > ul >li >div.title-and-desc.title.desc.container> div.description').eq(i).invoke('text').then((text) => {
                expect(text.length).to.be.greaterThan(20).lessThan(300);
            });
        }
    });

});

And('list items at positions {string} have {string} as {string}', (indexes, component, values) => {
    const index = indexes.split(',');
    const value = values.split(',');
    for (let i = 0; i < index.length; i++) {
        switch (component) {
            case 'titles':
                cy.get('.list.managed > ul >li>.title-and-desc.title.desc.container h3').eq(i).should('contain.text', value[i]);
                break;

            case 'links':
                cy.get('.list.managed > ul >li>.title-and-desc.title.desc.container h3').eq(index[i]).find('a').should('have.attr', 'href', value[i]);
                break;

            case 'alt texts':
                cy.get('.list.managed > ul >li>.list-item-image.image.container a').eq(i).find('img').should('have.attr', 'alt', value[i]);
                break;

            case 'sources':
                cy.get('.list.managed > ul >li>.list-item-image.image.container a').eq(i).find('img').invoke('attr', 'src').then((fullSrc) => {
                    expect(fullSrc.startsWith(value)).to.be.true;
                });
                break;

            case 'files':
                cy.get('.list.managed > ul >li>.list-item-image.image.container a').eq(i).find('img').invoke('attr', 'src').then((fullSrc) => {
                    const src1 = fullSrc.substring(0, fullSrc.indexOf('?itok'));
                    expect(src1.endsWith(value[i])).to.be.true;
                });
                break;

            case 'exit notification link':
                cy.get('.list.managed > ul >li>.title-and-desc.title.desc.container >h3 ').eq(index[i]).find('a.icon-exit-notification').should('have.attr', 'href', value[i]);
                break;

        }
    }
});

And('the number of exit disclaimers is {int}', (extLinkCount) => {
    cy.get('.list.managed > ul >li>.title-and-desc.title.desc.container >h3 >a.icon-exit-notification').should('have.length', extLinkCount);
});

Then('managed list does not exist', () => {
    cy.get('.list.managed > ul').should('not.exist');
});
