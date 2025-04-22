/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

And('the page displays pager info {string}', (pagerInfo) => {
    const regex = new RegExp(pagerInfo.split('\N').join('\\d+'));
    cy.get('.ctla-results__count.grid-col').invoke('text').then((text) => {
        const newText = text.trim().split('\n').join(' ').split('\t').join('').replace(/  +/g, ' ');;
        expect(newText).to.match(regex);
    })
});

And('each result displays the trial title with a link in the following format {string}', (linkFormat) => {
    cy.get('a.ctla-results__list-item-title.grid-col').should('have.attr', 'href').then((link) => {
        expect(link).to.include(linkFormat)
    })
}
);

And('each result displays the trial summary', () => {
    cy.get('.ct-list-item p').should('not.be.empty');
});

And('each result displays {string} below the summary', (location) => {
    cy.get('.ctla-results__list-item-location.grid-col')
        .should('include.text', location);
});

When('the user navigates to {string} with non-existent page {string}', (path, parameter) => {
    cy.visit(`${path}/?${parameter}`);
});

Then('the text {string} appears', (text) => {
    cy.get('#NCI-trial-listing-app-root p').should('have.text', text)
})

When('user clicks on {int} result', (resultNum) => {
    cy.get('a.ctla-results__list-item-title.grid-col')
        .eq(resultNum - 1)
        .trigger('click', { followRedirect: false });
});

Then('user is directed to {string}', (directedUrl) => {
    cy.visit(directedUrl);
});

And('intro text {int} paragraph is {string}', (num, introText) => {
    cy.get('.ctla-results__intro').find('p').eq(num - 1).should('have.text', introText);

});

And('{string} link has href {string}', (link, href) => {
    cy.get('a').contains(link).should('have.attr', 'href', href);
});

