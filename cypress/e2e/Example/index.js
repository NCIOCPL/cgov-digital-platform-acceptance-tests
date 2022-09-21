/// <reference types="Cypress" />

import { Given } from "cypress-cucumber-preprocessor/steps";

Given("the user visits the homepage", () => {
  cy.visit("/");
});