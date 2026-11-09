/// <reference types="Cypress" />
import { Then } from 'cypress-cucumber-preprocessor/steps';

Then("user clicks on View and Print Infographic link", () => {
    cy.get('.cgdp-infographic__link-container a').trigger('click',{followRedirect: false});
})
