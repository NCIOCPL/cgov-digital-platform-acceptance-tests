import { Then } from "cypress-cucumber-preprocessor/steps";

Given('user is navigating to {string}', (a) => {
  cy.visit(a);
});

Then("browser title is {string}", (title) => {
  cy.title().should('eq', title);
});
