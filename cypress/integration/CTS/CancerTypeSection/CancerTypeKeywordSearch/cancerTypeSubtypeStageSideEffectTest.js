/// <reference types="Cypress" />

import { Given, Then, And, When } from "cypress-cucumber-preprocessor/steps";

const fieldAttribute = new Map();
fieldAttribute.set('Subtype', 'st');
fieldAttribute.set('Stage', 'stg');
fieldAttribute.set('Side Effects/Biomarkers/Participant Attributes', 'fin');


Then("field with placeholder appears", dataTable => {

    for (const { field, placeholder } of dataTable.hashes()) {
        const value = fieldAttribute.get(field);

        cy.document().then(doc => {
            const subSearch = doc.querySelector(`.subsearch > div > label[for='${value}']`);
            expect(subSearch.innerText).to.be.eq(field);
            expect(subSearch.nextSibling.children[0]).to.have.attr('placeholder', placeholder);
        });
    }
});





