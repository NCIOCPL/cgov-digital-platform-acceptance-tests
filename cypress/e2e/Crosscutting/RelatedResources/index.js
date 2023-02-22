/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../../utils';
And('related resources section is visible', () => {
    cy.get('div#nvcgRelatedResourcesArea').should('be.visible');
});

And('related resources have working link {string} with the href {string}', (linkText, linkHref) => {
    cy.get('.related-resources.list').find('a').first().invoke('text').should('be.eq', linkText);
    cy.get('.related-resources.list').find('a').should('have.attr', 'href').and('eq', `${getBaseDirectory()}${linkHref}`);
});

And('exit disclaimer is visible', () => {
    cy.get('div#nvcgRelatedResourcesArea').find('a.icon-exit-notification').should('be.visible').and('have.attr', 'href');
});

And('the number of external links is {int}', (count) => {
    cy.get('div#nvcgRelatedResourcesArea').find('a.icon-exit-notification').should('have.length', count);
});

Then('related resources section does not exist', () => {
    cy.get('div#nvcgRelatedResourcesArea').should('not.exist');
});

And('exit disclaimer is not visible', () => {
    cy.get('div#nvcgRelatedResourcesArea').find('a.icon-exit-notification').should('not.exist');
});
