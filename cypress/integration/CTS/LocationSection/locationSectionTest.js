/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

//instead of using an IF-ELSE conditional statements, we have a map that we can retrieve values we need
//according to the radio button key provided
const locationRadio = new Map();
locationRadio.set('Search All Locations', 'search-location-all');
locationRadio.set('ZIP Code', 'search-location-zip');
locationRadio.set('Country, State, City', 'search-location-country');
locationRadio.set('Hospitals/Institutions', 'search-location-hospital');
locationRadio.set('At NIH (only show trials at the NIH Clinical Center in Bethesda, MD)', 'search-location-nih');



When("user clicks on Limit results to Veterans Affairs facilities switch", () => {
    cy.get('#fieldset--location .cts-toggle').scrollIntoView();
    cy.get('div.cts-toggle label[for="search-location-toggle"]').click();
});



Then("the following radio buttons are displayed", dataTable => {

    //loop through the data table
    for (const { radioButton, visibility } of dataTable.hashes()) {
        const value = locationRadio.get(radioButton);
        //locator
        const radioLabelLocator = `label[for='${value}']`;
        //check if eother button is displayed or it doesnt exist
        if (visibility.includes('displayed')) {
            cy.get(radioLabelLocator).should('be.visible');
        } else {
            cy.get(radioLabelLocator).should('not.exist');
        }
    }
});

And("user clicks {string} button", (findButton) => {
    cy.get('.btn-submit.faux-btn-submit').as('findButton').click();
});

Then("the search is executed and results page is displayed", () => {
    cy.get('h1:contains("Clinical Trials Search Results")').should('be.visible');
});

And("the url query has the following corresponding code", dataTable => {
    cy.location('href').then(url => {
        const params = new URL(url).searchParams;
        const paramItem = Array.from(params.entries()).map(([pkey, pvalue]) => {
            for (const { queryParam, value } of dataTable.hashes()) {
                if (queryParam === pkey) {
                    expect(pvalue).equal(value);
                }
            }
        });
    })

});

When("user selects {string} radio button", (radioButton) => {
    const value = locationRadio.get(radioButton);
    //locator
    const radioLabelLocator = `label[for='${value}']`;
    //click the radio button
    cy.get(radioLabelLocator).click();

});

And("user types {string} in the ZipCode field", (zipCode) => {
    cy.get('.cts-input.search-location__zip').type(zipCode);
});

And("user selects {string} in the Radius field", (zipRadius) => {
    cy.get('select#zipRadius').select(zipRadius);
});

And("user selects {string} in the Country field", (country) => {
    cy.get('select#country').select(country);
});

And("user types {string} in the State field", (state) => {
    cy.get('input#lst').type(state);
});

And("user selects {string} from autosuggest", (type) => {
    cy.get(`.cts-autocomplete__menu-item:contains('${type}')`).click();
});

And("user types {string} in the City field", (city) => {
    cy.get('input#city').type(city);
});

And("user types {string} in the Hospital field", (hospital) => {
    cy.get('.search-location__block').scrollIntoView();
    cy.get('div.search-location__block>div').type(hospital);
});