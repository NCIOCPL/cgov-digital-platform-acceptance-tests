/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';
import { getBaseDirectory } from '../../utils';
And('the {int} release doesnt have a link', (year) => {
    cy.get('p').should('contain.text', year).should('not.have','a');
});

And('the following press releases are displayed', (dataTable) => {
    for (const { title, link } of dataTable.hashes()) {
        cy.get('p').find(`a:contains('${title}')`).should('have.attr','href',link);
    }
});

And('{string} box is displayed with a link {string}', (linkText, linkHref) => {
    cy.get('.callout-box-full').find('h3').should('have.text', linkText);
    cy.get('.callout-box-full').find('a').should('have.attr', 'href', linkHref);
    
});

And('the list of press release pages is displayed', () => {
    cy.get('.views-element-container').should('be.visible');
});

And('each title is a link with href that starts with {string}', (itemHref) => {
    cy.get('.views-element-container > ul> li').find('a').should('have.attr', 'href').then((link) => {
        expect(link).to.include(itemHref)
    })
});

And('each date is for year {string}', (year) => {
    cy.get('.views-element-container > ul> li').find('time').should('contain.text', year);
});

And('posted date is not displayed', () => {
    cy.get('div.document-dates.horizontal').should('not.exist');
});

And('the contact {string} is displayed with a link to email {string}', (pressText, email) => {
    cy.get('.columns.large-4.media-contact.right a').should('have.attr', 'href', email).should('have.text', pressText);
});

When('user is clicking on definition for {string}', (glossTerm) => {
    cy.get('.definition').click();
});

Then('pop-up definition box is displayed for {string}', (glossTerm) => {
    cy.get('div[role="dialog"]').should('be.visible');
});

And('the contact {string} is not displayed', (pressText) => {
    cy.get('.columns.large-4.media-contact.right').should('not.exist');
});

And('{string} date is displayed as {string}', (label, stamp) => {
    cy.get('div.document-dates > ul >li').as('timestamp');
    cy.get('@timestamp').find('strong').should('include.text', label);
     cy.get('@timestamp').find('time').should('include.text', stamp);
    
});

And('user clicks on press release number {int}', (position) => {
    cy.get('a.title').eq(position - 1).trigger('click', { followRedirect: false });
});