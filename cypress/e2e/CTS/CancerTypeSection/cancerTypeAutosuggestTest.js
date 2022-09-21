/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";


When("user clicks on {string} field", (allButton) => {
    cy.get('label#ct-label').scrollIntoView();
    cy.get('button#ct-btn[aria-expanded="false"]').as('allButton').click();
});

Then("cancer types dropdown is displayed", () => {
    cy.get('#ct-searchTerm-autocomplete-wrapper').should('be.visible');
});

And("autosuggest component is displayed", () => {
    cy.get('#ct-searchTerm').should('be.visible');
});

And("placeholder text {string} displayed", (text) => {
    cy.get('input#ct-searchTerm').should('have.attr', 'placeholder').and('eq', text);
});

And("user types {string} in the autosuggest field", (cancerType) => {
    cy.get('input#ct-searchTerm').type(cancerType);
});

When("user selects {string} from autosuggest", (type) => {
    cy.get(`.cts-autocomplete__menu-item:contains('${type}')`).click();
});

And("user clicks {string} button", (findButton) => {
    cy.get('.btn-submit.faux-btn-submit').as('findButton').click();
});

Then("the search is executed and results page is displayed", () => {
    cy.get('h1:contains("Clinical Trials Search Results")').should('be.visible');
});

And('trial info displays {string}', (infoText) => {
    cy.get('.all-trials').invoke('text').then((text) => {
        const resultsText = text.split('\n').join(' ').split('\t').join('');
        const regex = new RegExp(infoText);
        expect(resultsText).to.match(regex);
    });
});

And("the url query has the following", dataTable => {
    cy.location('href').then(url => {
        const params = new URL(url).searchParams;
        const paramItem = Array.from(params.entries()).map(([pkey, pvalue]) => {
            for (const { parameter, value } of dataTable.hashes()) {
                if (parameter === pkey) {
                    expect(pvalue).equal(value);
                }
            }
        });
    })

});


