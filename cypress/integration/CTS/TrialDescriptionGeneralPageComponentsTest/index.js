// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

And('trial info displays {string}', (infoText) => {
    const regex = new RegExp(infoText);
    cy.get('.all-trials').invoke('text').should('match', regex);
});

And('{string} button does not exist', (showSearchCriteriaButton) => {
    cy.get('button').contains(showSearchCriteriaButton).should('not.exist');
});

And('{string} link has a href {string}', (linkText, linkHref) => {
    cy.get(`a[href="${linkHref}"]`).should('have.text', linkText);
});

When('user clicks on {int} result item link', (num) => {
    cy.get(`div.results-list-item__title a`).eq(num - 1).click();
});

Then('user is redirected to {string} with query parameters that match {string}', (redirectedPath, queryParam) => {
    cy.location('pathname').should('eq', redirectedPath);
    const regex = new RegExp(queryParam);
    cy.location('search').should('match', regex);
});

And('{string} link is displayed', (textLink) => {
    cy.get('div[class*="btnAsLink"]').should('have.text', textLink).and('be.visible');
});

And('{string} text is displayed', (infoText) => {
    cy.get('.trial-description-page__header').find('strong').first().should('have.text', infoText).and('be.visible');
});

And('trial details accordion is displayed', () => {
    cy.get('.trial-description-page__content  .cts-accordion').should('be.visible');
});

And('{string} section is expanded', (descriptionSection) => {
    cy.get('button.cts-accordion__button').contains(descriptionSection).parent()
        .should('have.attr', 'aria-expanded', 'true');
});

And('{string} button is displayed', (btn) => {
    cy.get('button').contains(btn).should('be.visible');
});

And('option to {string} trial is displayed', (shareTrial) => {
    cy.get('button').contains(shareTrial).should('be.visible');
});

And('there are {int} delighters present', (count) => {
    cy.get('.cts-delighter-container div[class^="delighter"]:visible').should('have.length', count);
});

And('the following delighters are displayed', (dataTable) => {
    for (const { delighter, href, title, text } of dataTable.hashes()) {
        cy.get(`div[class="delighter ${delighter}"]:visible`).as('delighter');
        cy.get('@delighter').find('a').first().should('have.attr', 'href', href);
        cy.get('@delighter').find('h4').first().should('have.text', title);
        cy.get('@delighter').find('p').first().should('have.text', text);
    }
});

When('user clicks on {string} button', (btn) => {
    cy.get('button').contains(btn).click({ force: true });
});

And('search criteria table displayes the following', (dataTable) => {
    for (const { Category, Selection } of dataTable.hashes()) {
        cy.get('tbody tr th').should('have.text', Category);
        cy.get('tbody tr td').should('have.text', Selection);
    }
});

Then('all trial details sections are expanded', () => {
    cy.get('div.trial-description-page__content button.cts-accordion__button').should('have.attr', 'aria-expanded', 'true');
});

Then('all trial details sections are collapsed', () => {
    cy.get('div.trial-description-page__content button.cts-accordion__button').should('have.attr', 'aria-expanded', 'false');
});

And('option to {string} trial does not exist', (printTrial) => {
    cy.get('button.share-btn.cts-share-print').contains(printTrial).should('not.be.visible');
});




