// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('left navigation menu is visible', () => {
    cy.get('#nvcgSlSectionNav .section-nav').should('be.visible');
});

And('parent label is {string}', (label) => {
    cy.get('div.section-nav a').parent().should('have.class', 'current-page');
    cy.get('div.section-nav a').contains(label);
});

And('all the  menu children are visible', () => {
    cy.get('div.section-nav ul li li.level-1').should('be.visible');
    cy.get('div.section-nav ul li li.level-1').parent().should('not.have.class', 'current-page');
});

And('all of the menu gradchildren are not visible', () => {
    cy.get('li.level-1 li.level-2').should('not.be.visible');
});

And('the number of children is {int}', (count) => {
    cy.get("div.current-page").parent().find("ul>li:visible").should("have.length", count);
});

And('the parent node is expanded', () => {
    cy.get('.section-nav ul li div .toggle').should('have.attr', 'aria-expanded', 'true');
});

When('user clicks on site section menu', () => {
    cy.get('#section-menu-button').click();
});

And('section {string} has {int} children', (label, count) => {
    cy.get("div.current-page").parent().find("ul>li:visible").should("have.length", count);
});
