/// <reference types="Cypress" />
import { Given, And, Then } from 'cypress-cucumber-preprocessor/steps';

Then('the system returns the results page for {string}', (term) => {
    cy.get('div.results > h3').should('include.text', term);
});

And('the best bet box is displayed', () => {
    cy.get('div.best-bet').should('be.visible');
});

And('the best bets title is a link', () => {
    cy.get('div.best-bet').find('a').should('have.attr', 'href');
});

And('the dictionary definition box is displayed', () => {
    cy.get('div.definition').should('be.visible');
});

And('the {string} button is displayed within the dictionary definition', (moreInfoButton) => {
    cy.get('div.definition p').find('a').should('contain.text', moreInfoButton);
});

Then('the {string} button within the dictionary definition is displayed', (showHideButtonText) => {
    cy.get('.definition__show-full').should('contain.text', showHideButtonText);
});

And('the {string} title is {string}', (tag, title) => {
    if (title.includes('XXXXX')) {
        cy.document().then(document => {
            const actualTitle = document.querySelector(`${tag}:nth-of-type(1)`).textContent;
            const regex = new RegExp(title.replace(/XXXXX/g, '[0-9]+'));
            expect(actualTitle).to.match(regex);
        });
    }
    else {
        cy.get(`${tag}`).first().should('have.text', title);
    }
});

And('both pagers are displayed', () => {
    cy.get('.pager__navigation[data-testid="tid-results-pager-top"]').should('be.visible');
    cy.get('.pager__navigation[data-testid="tid-results-pager-bottom"]').should('be.visible');
});

And('the results are displayed with each title containing a link', () => {
    cy.get('.result__list-item').find('a').should('have.attr', 'href');
});

And('the system defaults to {string} results per page', (resultsCount) => {
    cy.get('.results__viewby option').should('be.selected').and('have.value', resultsCount);
});

Then('the drop down box to show results per page is displayed', () => {
    cy.get('.pager__select > option').should('be.visible');
});

Then('the {string} text is {string}', (tag1, title1) => {
    cy.get(`${tag1}`).last().should('have.text', title1);
});

And('pagers are not displayed for less than 20 results', () => {
    cy.get('.pager__navigation[data-testid="tid-results-pager-top"]').should('not.exist')
    cy.get('.pager__navigation[data-testid="tid-results-pager-bottom"]').should('not.exist');
});


Then('user is clicking on a BestBets title link at position {int}', (positionNumber) => {
    cy.get('div.best-bet').eq(positionNumber - 1).find('a').trigger('click', { followRedirect: false });
    cy.wait(500)
});

Then('user is clicking on a search result item at position {int}', (positionNumber) => {
    cy.get('.result__list-item').eq(positionNumber - 1).find('a').trigger('click', { followRedirect: false });
    cy.wait(500)
});

Then('user is clicking on a glossary term link {string}', (termLink) => {
    cy.get('div.definition p').find('a').trigger('click', { followRedirect: false });
    cy.wait(500)
});






