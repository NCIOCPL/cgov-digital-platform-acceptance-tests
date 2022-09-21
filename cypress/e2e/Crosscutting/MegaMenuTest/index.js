/// <reference types="Cypress" />
import { When, Then, And } from "cypress-cucumber-preprocessor/steps";

Then('mega menu is displayed', () => {
    cy.get('#mega-nav').should('be.visible');
});
And('main categories titles are {string}', (titles) => {
    const allTitles = titles.split(',');
    cy.document().then(document => {
        const els = document.querySelectorAll('.nav-item.lvl-1>div.nav-item-title>a');
        for (let i = 0; i < els.length; i++) {
            expect(els[i].innerText).to.eq(allTitles[i]);
        }

    });

});

And('correct {int} of top-level menu items is displayed', (number) => {
    cy.document().then(document => {
        const els = document.querySelectorAll('.nav-item.lvl-1>div.nav-item-title>a');
        expect(els.length).to.eq(number)
    });
});
And('each menu {int} is within reasonable text length {string}', (num, boundaries) => {
    const txtLength = boundaries.split(":");

    for (let i = 0; i < num; i++) {

        cy.get('li.nav-item.lvl-1 .sub-nav-mega').eq(i).should('be.hidden').trigger('mouseover', { force: true }).should('be.visible').find('.sub-nav-group').invoke('text').should('have.length.at.least', parseInt(txtLength[0]));
        cy.get('li.nav-item.lvl-1 .sub-nav-mega').eq(i).should('be.visible').find('.sub-nav-group').invoke('text').should('have.length.at.most', parseInt(txtLength[1]));
    }
});

Then('hamburger menu is displayed', () => {
    cy.get('button.open-panel.nav-header.menu-btn').should('be.visible');
});
When('user clicks on hamburger menu', () => {
    cy.get('button.open-panel.nav-header.menu-btn').click();
});

Then('the length of the side sub menus text is within reasonable {string}', (range) => {
    const txtLength = range.split(":");
    cy.get('.nav-item-title').invoke('text').should('have.length.at.most', parseInt(txtLength[1]));
    cy.get('.nav-item-title').invoke('text').should('have.length.at.least', parseInt(txtLength[0]));
});
