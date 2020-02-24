/// <reference types="Cypress" />
/*****************
 * This file contains all the steps for asserting metadata.
 *****************/
import { Given, When, Then } from "cypress-cucumber-preprocessor/steps";

Then("browser title is {string}", (title) => {
  cy.title().should('eq', title);
});