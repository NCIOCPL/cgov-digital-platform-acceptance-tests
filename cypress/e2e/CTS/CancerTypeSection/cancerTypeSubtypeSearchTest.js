/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

When("user types following value and selects matched option in the corresponding field", dataTable => {
    for (const { field, value } of dataTable.hashes()) {
        if (field == 'Subtype') {
            cy.get('input#st').as('subType').type(value).type('{enter}');
        }
        if (field == 'Stage') {
            cy.get('input#stg').as('stage').type(value);
            cy.get('div[class^="cts-autocomplete__menu-item highlighted"]').first().click();
        }
        if (field == 'Side Effects') {
            cy.get('input#fin').as('sideEffect').type(value);
            cy.get('div[class^="cts-autocomplete__menu-item highlighted"]').first().click();
        }
    }
});

And("the url query has the following corresponding code", dataTable => {
    cy.location('href').then(url => {
        const params = new URL(url).searchParams;
        const paramItem = Array.from(params.entries()).map(([pkey, pvalue]) => {
            for (const { parameter, value } of dataTable.hashes()) {
                if (parameter === pkey) {
                    expect(pvalue).to.include(value);
                }
            }
        });
    })
});







